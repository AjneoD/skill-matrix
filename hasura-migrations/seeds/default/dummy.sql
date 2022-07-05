INSERT INTO "public"."users" ( "name")
SELECT 
  CONCAT('person', "person") AS "name"
  
FROM generate_series(1, 100) AS "person"

ON CONFLICT ON CONSTRAINT "users_pkey"
DO UPDATE SET 
"name" = EXCLUDED."name"
;


INSERT INTO "public"."boards" ("name")
SELECT 
  CONCAT('person', "person") AS "name"
  
FROM generate_series(1, 100) AS "person"

ON CONFLICT ON CONSTRAINT "boards_pkey"
DO UPDATE SET 
  "name" = EXCLUDED."name"
  ;



INSERT INTO "public"."boards_admins" ("board_id", "user_id")

SELECT 
  ("board") AS "board_id",
  (floor(random() * (10 - 1 + 1) + 1)) AS "user_id"
  
FROM generate_series(1, 100) AS "board"
;

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

  "created_at" = EXCLUDED."created_at",

"updated_at" = EXCLUDED."updated_at",

"opens_at" = EXCLUDED."opens_at",

"closes_at" = EXCLUDED."closes_at" ;

--Answers
INSERT INTO "public"."answers" ("user_id", "board_id", "question_id", "created_at", "updated_at", "score", "notes", "data")

SELECT

  (floor(random() * (100 - 1 +1) +1)) AS "user_id",

  (floor(random() * (100 - 1 +1) +1)) AS "board_id",

  (floor(random() * (100 - 1 +1) +1)) AS "question_id",

  now() - '30d'::INTERVAL * random() AS "created_at",

  now() - '30d'::INTERVAL * random() AS "updated_at",

  '1' AS "score",

  CONCAT('answer', "answer") AS "notes",

 '{"FoodType":"veg","pref":"High"}' AS "data"



    FROM generate_series(1, 100) AS "answer"



ON CONFLICT ON CONSTRAINT "answers_pkey"

DO UPDATE SET  "user_id" = EXCLUDED."user_id",

  "board_id" = EXCLUDED."board_id",

  "question_id" = EXCLUDED."question_id",

  "created_at" = EXCLUDED."created_at",

  "updated_at" = EXCLUDED."updated_at",

  "score" = EXCLUDED."score",

"notes" = EXCLUDED."notes",

"data" = EXCLUDED."data";

--Questions
INSERT INTO "public"."questions" ("board_id", "type", "data", "is_deleted", "created_at")



SELECT

  (floor(random() * (100 - 1 +1) +1)) AS "board_id",

  'type_A' AS "type",

'{"FoodType":"veg","pref":"High"}' AS "data",

TRUE AS "is_deleted" ,

  now() - '30d'::INTERVAL * random() AS "created_at"

 

 FROM generate_series(1, 100) AS "question"




ON CONFLICT ON CONSTRAINT "questions_pkey"

DO UPDATE SET  

  "board_id" = EXCLUDED."board_id",

  "created_at" = EXCLUDED."created_at",

"type" = EXCLUDED."type",

"is_deleted" = EXCLUDED."is_deleted",

"data" = EXCLUDED."data";

