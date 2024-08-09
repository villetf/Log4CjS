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

CREATE TABLE ohm_logs (
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



INSERT INTO buttons(button_id, button_name, button_application) VALUES (1, 'Sök CI', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (2, 'Skapa ärende', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (3, 'Visa i Grafana', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (4, 'Visa i Netbox', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (5, 'Visa i Changelog', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (6, 'Visa i Eventlog', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (7, 'Checka alla', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (8, 'Automatiskt klick på done-knappen', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (9, 'Kopiera larminfo från listvy', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (10, 'Sök CI från listvy', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (11, 'Skapa ärende från listvy', 'OP5');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (12, 'Kopiera ärendelänk', 'ServiceDesk Plus');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (13, 'Gå till OP5', 'ServiceDesk Plus');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (14, 'Skapa ärende med länk', 'QRadar');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (15, 'Kopiera offenselänk', 'QRadar');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (16, 'Sök i CMDB', 'QRadar');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (17, 'Pinga host', 'Cisco AMP');
INSERT INTO buttons(button_id, button_name, button_application) VALUES (18, 'Visa i CMDB', 'Cisco AMP');

INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (102, 'Lägga upp Windowshost', 'OP5');

INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (103, 'Lägga upp Linuxhost', 'OP5');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (104, 'Ta bort host', 'OP5');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (105, 'Återställa borttagen host', 'OP5');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (106, 'Kopiera host från Prod till Test', 'OP5');
INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (107, 'Kopiera host från Test till Prod', 'OP5');

INSERT INTO ps_functions(function_id, function_name, function_application) VALUES (108, 'Visa alla datorer en användare är inloggad på', 'SysMan');