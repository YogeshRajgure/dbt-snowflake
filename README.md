# dbt-snowflake

![img](/artifacts/images/flow.jpg)


use this

DBT

dtypes - 
SCD 0 -retain original - when the data that is in table is no loger required to undergo any change
eg. faxcodes were collected a decade ago, no one is going to change that data now,
(slowly changing dimentions)
SCD 1 - overwrite - when old info is not required to be stored, only new info should be stored and relevent
ed. the house owner updates that his house now has AC, so the previous info that it did not had AC is irrelevant to be stored

SCD 2 - add new row - keeping full history - Adding additional (historic data) rows for each dimension change
Here, for a record in a table we maintain multiple rows for multiple changes that happed to the record

SCD 3 - add new attribute - keeing limited data history - adding seperate columns for original and current value
here, scd 2 is maintained for a limited data

-------------------------------------

create a snowflake acc.

---------------------------------------
models-
models are basic building blocks of your business logic
Materialized as tables, views, etc
they live in SQL files under models folser
Models can reference each other and use templates and macros
------------------------------------------------------
Materializations overview-
View - if we need lightweight, and it doest get used often
table - if we need to read something more often
Incremental (table appends) - continuous appends, fact tables
Ephemeral (CTEs) - use it as a building component


=====================================
dbt init dbtlearn
--
configure profiles.yml and dbt_project.yml
--
dbt debug
--
dbt run
--
dbt run --full-refresh (if you want to rebuild the whole table)
--
dbt compile (just to comfirm that there are no errors)
--
dbt seed  (this command will copy the file from seed folder in your pc to snowflkae)
===================================

seeds are local files that you upload to the data warehouse from dbt
sources is an abstraction layer on top of your input tables (data is source if it is in warehouse)

=======================================
snapshots

we can capture changes with snapshot. its you choice when you want to capture change
--
dbt snapshot
--
==========================================
tests

two types -> singular and generic
-singular tests are SQL queries stored in tests which are expected to return an empty resultset .
Singular tests are in test folder
-built-in generic tests (out-of-the-bag) - unique, not_null, accepted_value, relationships
-you can also define yor own custom generic tests or import from dbt packages 
--
dbt test
--
you can also create a macro and use it in singular tests or create ageneric test in a macro
=========================================
install dependencies
--
dbt deps
--
you can use surrogate key package from utils to create a primary key for you table even if it does not have one
===========================================
documentation

add description in schema.yml
--
dbt docs generate
dbt docs serve
--
===========================================
Analyses
write sql query here that we dont want to materialize

Hooks
-sql statements that are executed at predefined times. Hooks can be configured on project, subfolder, model level
-hook types, -> on_run_start, on_run_end, pre_hook, post_hook
===================
preset dashboard iDemo
https://0d6891fa.us1a.app.preset.io/superset/dashboard/8/?edit=true&native_filters_key=KS0pqs6nP6WvZdyPh1wNkbk-joV13VE7Rtzs93uI36cdiBmhJ4aBof0WGjoiNZKz