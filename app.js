// Denna fil är en del av Log4CjS. Mer info finns här: https://gitlab.lkl.ltkalmar.se/oc/log4cjs
//


// Importerar nödvändiga moduler
const express = require('express');
const mysql = require('mysql2');
const apiController = require('./controllers/apiController');
const fs = require('fs');
const cors = require('cors');
const https = require('https');
const helmet = require('helmet');


// Skapar en expresskonstant och definierar att bodys ska vara json
const app = express();
app.use(express.json());

// Anger att vilken hemsida som helst får göra post-anrop med Javascripts fetch-metod
app.use(cors());

// Anger att filerna i mappen public ska vara offentligt åtkomliga på webbservern
app.use(express.static('../files/public', {
   maxAge: 900
}));

// Anger att Helmet ska användas
app.use(helmet());

// Sätter sökvägar till certifikat
const httpsOptions = {
   key: fs.readFileSync('../ssl/serverx.key'),
   cert: fs.readFileSync('../ssl/serverx.crt'),
};

// Skapar mysql-anslutningspoolen
const connectionPool = mysql.createPool({
   host: 'localhost',
   user: 'log4cjs_user',
   password: 'PVpc2jP1wKmPvgoQj7Kq',
   database: 'log4cjs'
});

let table;

// Definierar post-endpoint för CjS
app.post('/api/log', (req, res) => {
   connectionPool.getConnection((err, connection) => {
      if (err) {
         console.log('Användaranslutning till databasen misslyckades. Se logg för mer info');
         logError(err, 'Fel vid användaranslutning till databas');
         if (connection) {
            connection.release();
         }
         res.send('Kunde inte ansluta till databasen');
         return;
      }
      table = 'cjs_logs';
      apiController.postCjsLog(req, res, connection, table);
   });
});

// Definierar post-endpoint för Web Assistant
app.post('/api/wass/log', (req, res) => {
   connectionPool.getConnection((err, connection) => {
      if (err) {
         console.log('Användaranslutning till databasen misslyckades. Se logg för mer info');
         logError(err, 'Fel vid användaranslutning till databas');
         if (connection) {
            connection.release();
         }
         res.send('Kunde inte ansluta till databasen');
         return;
      }
      table = 'wass_logs';
      apiController.postCjsLog(req, res, connection, table);
   });
});

// Definierar post-endpoint för SupportTools
app.post('/api/supporttools/log', (req, res) => {
   connectionPool.getConnection((err, connection) => {
      if (err) {
         console.log('Användaranslutning till databasen misslyckades. Se logg för mer info');
         logError(err, 'Fel vid användaranslutning till databas');
         if (connection) {
            connection.release();
         }
         res.send('Kunde inte ansluta till databasen');
         return;
      }
      table = 'supporttools_logs';
      apiController.postCjsLog(req, res, connection, table);
   });
});

// Definierar post-endpoint för OHM
app.post('/api/ohm/log', (req, res) => {
   connectionPool.getConnection((err, connection) => {
      if (err) {
         console.log('Användaranslutning till databasen misslyckades. Se logg för mer info');
         logError(err, 'Fel vid användaranslutning till databas');
         if (connection) {
            connection.release();
         }
         res.send('Kunde inte ansluta till databasen');
         return;
      }
      table = 'ohm_logs';
      apiController.postCjsLog(req, res, connection, table);
   });
});


// Kontrollerar var 30:e sekund att anslutningen till databasen fungerar
setInterval(() => {
   connectionPool.getConnection((err, connection) => {
      if (err) {
         console.log('Kontrollanslutning mot databasen misslyckades. Se logg för mer info');
         logError(err, 'Fel vid kontrollanslutning till databas');
         return;
      }
      connection.query('SHOW STATUS LIKE \'Threads_connected\'', (err, results) => {
         if (err) {
            console.log('Kontrollfråga mot databasen misslyckades. Se logg för mer info');
            logError(err, 'Fel vid kontrollfråga till databas');
            connection.release();
            return;
         }

         fs.writeFileSync('../files/numberOfConnections', results[0].Value);
         connection.release();
      });
   });
}, 30000);



// Skapar HTTPS-server
const server = https.createServer(httpsOptions, app);

// Lyssnar på port 443
server.listen(443, () => {
   console.log('Servern lyssnar på port 443');
});



// Definierar funktion för att skriva till loggfil
const logError = (error, errortype) => {
   const date = new Date().toLocaleString();
   const existingLogFile = fs.readFileSync('../files/errors.log').toString();
   const errorString = date + '\n' + errortype + ' uppstod:\n' + error + '\n\n';
   fs.writeFileSync('../files/errors.log', existingLogFile + errorString);
};