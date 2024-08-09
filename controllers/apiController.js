// Denna fil är en del av Log4CjS. Mer info finns här: https://gitlab.lkl.ltkalmar.se/oc/log4cjs



const Validator = require('../validation');
const xss = require('xss');
const fs = require('fs');


// Funktion för att ta emot post-anrop för loggning
const postCjsLog = (req, res, connection, table) => {

   // När en logg ska skrivas görs ett post-anrop mot /api/logs/ med ett JSON-objekt enligt formatet:
   //
   // {
   //    "token": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   //    "user": "Vilhelm Fontell",
   //    "button": 1,
   //    "object": "server01"
   // }

   const dropConnection = (() => {
      connection.release();
   });

   const sanitizedToken = xss(req.body.token);
   if (sanitizedToken !== 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx') {
      dropConnection();
      return res.send('En ogiltig autentiseringsnyckel angavs.');
   }

   // Gör validering
   const validation = new Validator.Validator(req.body, Validator.rules, Validator.errorMsgs);
   if (validation.fails()) {
      const validationError = JSON.stringify(validation.errors.all());
      logError(validationError, 'Valideringsfel');
      dropConnection();
      res.send(validation.errors.all());
      return;
   }

   // Gör sanering
   const sanitizedUser = xss(req.body.user);
   const sanitizedObject = xss(req.body.object);

   // Importerar användarjson och kollar om användaren finns där, annars lägg till den i databasen
   const usersList = JSON.parse(fs.readFileSync('../files/current_users.json').toString());
   if (!(Object.keys(usersList).includes(sanitizedUser))) {
      const highestId = Math.max(...Object.values(usersList).map(Number));
      usersList[sanitizedUser] = highestId + 1;
      fs.writeFileSync('../files/current_users.json', JSON.stringify(usersList, null, 2));
      connection.execute('INSERT INTO users(user_id, user_name, user_team) VALUES (?, ?, ?);', [usersList[sanitizedUser], sanitizedUser, null], (err) => {
         if (err) {
            logError(err, 'Användardatabasskrivningsfel');
            dropConnection();
            res.send('Ett fel uppstod vid skrivning till användardatabas.');
         }
      });
   }
   const userIdNum = usersList[sanitizedUser];

   // Skriver logg till databas
   connection.execute(`INSERT INTO ${table}(time, user_id, button_id, object) VALUES (DATE_FORMAT(NOW(), "%Y-%m-%d %H:%i:%s"), ?, ?, ?);`, [userIdNum, req.body.button, sanitizedObject], (err) => {
      if (err) {
         logError(err, 'Loggdatabasskrivningsfel');
         dropConnection();
         res.send('Ett fel uppstod vid skrivning till databas.');
         return;
      }
      dropConnection();
      res.send('Logg skriven');
   });
};


const logError = (error, errortype) => {
   const date = new Date().toLocaleString();
   const existingLogFile = fs.readFileSync('../files/errors.log').toString();
   const errorString = date + '\n' + errortype + ' uppstod:\n' + error + '\n\n';
   fs.writeFileSync('../files/errors.log', existingLogFile + errorString);
};



module.exports = {
   postCjsLog
};
