CREATE TABLE cjs_logs (
   time DATETIME NOT NULL,
   user_id INT NOT NULL,
   button_id INT NOT NULL,
   object VARCHAR(255),
   PRIMARY KEY (time, button_id, user_id),
   FOREIGN KEY (user_id) REFERENCES users(user_id),
   FOREIGN KEY (button_id) REFERENCES buttons(button_id)
);


CREATE TABLE users (
   user_id INT NOT NULL PRIMARY KEY,
   user_name VARCHAR(255) NOT NULL UNIQUE,
   user_team VARCHAR(255)
);


CREATE TABLE buttons (
   button_id INT NOT NULL PRIMARY KEY,
   button_name VARCHAR(255) NOT NULL,
   button_application VARCHAR(255) NOT NULL
);

CREATE TABLE wass_logs (
   time DATETIME NOT NULL,
   user_id INT NOT NULL,
   button_id INT NOT NULL,
   object VARCHAR(255),
   PRIMARY KEY (time, button_id, user_id)
);


CREATE TABLE supporttools_logs (
   time DATETIME NOT NULL,
   user_id INT NOT NULL,
   button_id INT NOT NULL,
   object VARCHAR(255),
   PRIMARY KEY (time, button_id, user_id)
);

CREATE TABLE mhm_logs (
   time DATETIME NOT NULL,
   user_id INT NOT NULL,
   button_id INT NOT NULL,
   object VARCHAR(255),
   PRIMARY KEY (time, button_id, user_id)
);

CREATE TABLE ps_functions (
   function_id INT NOT NULL PRIMARY KEY,
   function_name VARCHAR(255) NOT NULL,
   function_application VARCHAR(255) NOT NULL
);



INSERT INTO buttons(button_id, button_name, button_application) VALUES (1, 'Sök CI', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (2, 'Skapa ärende', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (3, 'Visa i Visualiseringssystem', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (4, 'Visa i Nätverkshanteringssystem', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (5, 'Visa i Changelog', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (6, 'Visa i Eventlog', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (7, 'Checka alla', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (8, 'Automatiskt klick på done-knappen', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (9, 'Kopiera larminfo från listvy', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (10, 'Sök CI från listvy', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (11, 'Skapa ärende från listvy', 'Övervakningssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (12, 'Kopiera ärendelänk', 'Ärendehanteringssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (13, 'Gå till Övervakningssystem', 'Ärendehanteringssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (14, 'Skapa ärende med länk', 'siem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (15, 'Kopiera offenselänk', 'siem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (16, 'Sök i CMDB', 'siem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (17, 'Pinga host', 'Virusskyddssystem');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (18, 'Visa i CMDB', 'Virusskyddssystem');

INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (102, 'Lägga upp Windowshost', 'Övervakningssystem');

INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (103, 'Lägga upp Linuxhost', 'Övervakningssystem');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (104, 'Ta bort host', 'Övervakningssystem');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (105, 'Återställa borttagen host', 'Övervakningssystem');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (106, 'Kopiera host från Prod till Test', 'Övervakningssystem');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (107, 'Kopiera host från Test till Prod', 'Övervakningssystem');

INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (108, 'Visa alla datorer en användare är inloggad på', 'Klienhanteringssystem');