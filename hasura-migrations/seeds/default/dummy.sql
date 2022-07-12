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

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (19,19, '{"question":"What is the correct way to create a function in Python:"}','question19');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (20,20,'{"question":"Which one of these variables has an illegal name:"}','question20');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (21,21,'{"question":"What is the default local host port that a React development server uses"}','question21');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (22,22,'{"question":"What is Callback: "}','question22');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (23,23,'{"question":"What is true about @Autowired annotation:"}','question23');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (24,24,'{"question":"What is Spring Boot:"}', 'question24');

INSERT INTO "public"."questions"("id", "board_id", "data", "type")
VALUES (25,25,'{"question":"What are CRUD Operations:"}','question25');

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

INSERT INTO "public"."answers"("id", "board_id", "user_id", "question_id", "score", "data")
VALUES(19,19,19,19,10,'{"option1":"def myFunction()", 
"option2":"function myfunction()", "option3":"create myFunction()"}');

INSERT INTO "public"."answers"("id", "board_id", "user_id", "question_id", "score", "data")
VALUES(20,20,20,20,10, '{"option1" : "$myVar", "option2" : "$my_Var", "option3" : "$my-Var"}');

INSERT INTO "public"."answers"("id", "board_id", "user_id", "question_id", "score", "data")
VALUES(21,21,21,21,10, '{"option1" : "3000", "option2" : "8080" , "option3" : "5000", "option4" : "3500"}');

INSERT INTO "public"."answers"("id", "board_id", "user_id", "question_id", "score", "data")
VALUES(22,22,22,22,10, '{"option1" : "Callback is an asynchronous equivalent for a function",
"option2" : "Callback is a technique in which a method calls back the caller method", 
"option3" : "Both of the above", "option4" : "None of the above" }');

INSERT INTO "public"."answers"("id", "board_id", "user_id", "question_id", "score", "data")
VALUES(23,23,23,23,10, '{"option1" : "The @Autowired annotation can be used to autowire bean on the setter method",
"option2" : "This annotation provides more fine-grained control over where and how autowiring should be accomplished",
"option3" : "The @Autowired annotation can be used to autowire bean on the methods with arbitary and/or multiple arguments", 
"option4" : "All of the above"}');

INSERT INTO "public"."answers"("id", "board_id", "user_id", "question_id", "score", "data")
VALUES(24,24,24,24,10 , '{"option1" : "Java Framework", "option2" : "PHP Framework",
"option3" : "JavaScript Framework"}');

INSERT INTO "public"."answers"("id", "board_id", "user_id", "question_id", "score", "data")
VALUES(25,25,25,25,10 , '{"option1" : "Create", "option2" : "Read", 
"option3" : "Update" , "option4" : "Delete" , "option5" : "All of the above"}');



