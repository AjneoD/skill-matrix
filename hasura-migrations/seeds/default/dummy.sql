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