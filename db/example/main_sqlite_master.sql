INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'schema_migrations', 'schema_migrations', 2, 'CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_schema_migrations_1', 'schema_migrations', 3, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'ar_internal_metadata', 'ar_internal_metadata', 4, 'CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_ar_internal_metadata_1', 'ar_internal_metadata', 5, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'products', 'products', 6, 'CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "unit" text)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'sqlite_sequence', 'sqlite_sequence', 7, 'CREATE TABLE sqlite_sequence(name,seq)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'fridges', 'fridges', 13, 'CREATE TABLE "fridges" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'items', 'items', 8, 'CREATE TABLE "items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "quantity" float, "fridge_id" integer, "product_id" integer, "limit_date" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_items_on_fridge_id', 'items', 12, 'CREATE INDEX "index_items_on_fridge_id" ON "items" ("fridge_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_items_on_product_id', 'items', 10, 'CREATE INDEX "index_items_on_product_id" ON "items" ("product_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'recipes', 'recipes', 14, 'CREATE TABLE "recipes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" varchar, "people" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'recipes_items', 'recipes_items', 15, 'CREATE TABLE "recipes_items" ("id" integer NOT NULL PRIMARY KEY, "product_id" integer DEFAULT NULL, "recipe_id" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "quantity" float DEFAULT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_recipes_items_on_product_id', 'recipes_items', 20, 'CREATE INDEX "index_recipes_items_on_product_id" ON "recipes_items" ("product_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_recipes_items_on_recipe_id', 'recipes_items', 16, 'CREATE INDEX "index_recipes_items_on_recipe_id" ON "recipes_items" ("recipe_id")');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'recipes_steps', 'recipes_steps', 19, 'CREATE TABLE "recipes_steps" ("id" integer NOT NULL PRIMARY KEY, "recipe_id" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "description" text DEFAULT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'index_recipes_steps_on_recipe_id', 'recipes_steps', 18, 'CREATE INDEX "index_recipes_steps_on_recipe_id" ON "recipes_steps" ("recipe_id")');