--Users

INSERT INTO "public"."users" ("id","name")
SELECT 
("person") AS "id",
CONCAT('person', "person") AS "name"
FROM generate_series(1, 100) AS "person"
ON CONFLICT ON CONSTRAINT "users_pkey"
DO UPDATE SET 
"id" = EXCLUDED."id",
"name" = EXCLUDED."name";

--Boards

INSERT INTO "public"."boards" ("id", "name")
SELECT 
  ("board") AS "id",
  CONCAT('board', "board") AS "name"
FROM generate_series(1, 100) AS "board"
ON CONFLICT ON CONSTRAINT "boards_pkey"
DO UPDATE SET 
  "id" = EXCLUDED."id",
  "name" = EXCLUDED."name";

--Boards_Admins

INSERT INTO "public"."boards_admins" ("board_id", "user_id")
SELECT 
  ("board") AS "board_id",
  ("board") AS "user_id"
FROM generate_series(1, 100) AS "board"
ON CONFLICT ON CONSTRAINT "board_admins_pkey"
DO UPDATE SET
  "board_id" = EXCLUDED."board_id",
  "user_id" = EXCLUDED."user_id"; 

--Surveys

INSERT INTO "public"."surveys" ("board_id", "created_at", "updated_at", "opens_at" , "closes_at")
SELECT
(floor(random() * (100 - 1 +1) +1)) AS "board_id",
now() - '30d'::INTERVAL * random() AS "created_at",
now() - '30d'::INTERVAL * random() AS "updated_at",
now() - '30d'::INTERVAL * random() AS "opens_at",
now() + '7d'::INTERVAL * random() AS "closes_at"
FROM generate_series(1, 100) AS "survey"
ON CONFLICT ON CONSTRAINT "surveys_pkey"
DO UPDATE SET  
"board_id" = EXCLUDED."board_id",
"created_at" = EXCLUDED."created_at",
"updated_at" = EXCLUDED."updated_at",
"opens_at" = EXCLUDED."opens_at",
"closes_at" = EXCLUDED."closes_at" ;


INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(2,2,'{"question":"Evaluate your knowledge in React Js:"}','question2');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(3,3,'{"question":"Evaluate your knowledge in Node Js:"}','question3');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(4,4,'{"question":"Evaluate your knowledge in Hasura CLI:"}','question4');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(5,5,'{"question":"Evaluate your knowledge in Postgres:"}','question5');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(6,6,'{"question":"Evaluate your knowledge in Spring Boot:"}','question6');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(7,7,'{"question":"Evaluate your knowledge in CSS/SCSS:"}','question7');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(8,8,'{"question":"Evaluate your knowledge in PHP:"}','question8');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(9,9,'{"question":"Evaluate your knowledge in Golang:"}','question9');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(10,10,'{"question":"Evaluate your knowledge in Ruby:"}','question10');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(11,11,'{"question":"Evaluate your knowledge in Python:"}','question11');

INSERT INTO "public"."questions" ("id","board_id","data","type")
VALUES(12,12,'{"question":"Evaluate your knowledge in .NET:"}','question12');

INSERT INTO "public"."questions" ("id", "board_id", "data", "type")
VALUES (13,13, '{"question": "Evaluate your knowledge in SQL:"}' , 'question13');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (14,14 , '{"question": "Evaluate your knowledge in MS SQL:"}', 'question14');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (15,15, '{"question": "Evaluate your knowledge in AWS:" }', 'question15');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (16,16, '{"question" : "Evaluate your knowledge in Azure:" }', 'question16');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (17,17, '{"question" : "Evaluate your knowldege in Python:"}', 'question17');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (18,18, '{"question" : "Evaluate your knowledge in GraphQL:" }', 'question18');



INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(1,1,1,1,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(2,2,2,2,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');


INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(3,3,3,3,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(4,4,4,4,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(5,5,5,5,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(6,6,6,6,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(7,7,7,7,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(8,8,8,8,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(9,9,9,9,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(10,10,10,10,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(11,11,11,11,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(12,12,12,12,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(13,13,13,13,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');



INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(14,14,14,14,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(15,15,15,15,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(16,16,16,16,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(17,17,17,17,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project", 
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

INSERT INTO "public"."answers"("id","board_id","user_id","question_id","score","data")
VALUES(18,18,18,18,10,'{"option1":"0-Zero",
"option2":"1-I can read it and orient myself in a file / project",
"opsion3":"2-I can work on a file / project",
"option4":"3-I can use it even in more complex projects", 
"option5":"4-I have advanced knowledge, I could teach it to someone else",
"option6":"5-I know it in all its nuances and I feel calm"}');

