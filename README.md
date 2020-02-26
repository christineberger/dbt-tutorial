### The files in this repository are a result of practicing the tutorial for dbt found at https://tutorial.getdbt.com/tutorial/. 
Below are the answers to the solutions for the supplemental excercises from the tutorial:

### Excercise Set #1: Build your first models
- Write some bad SQL to cause an error — can you debug this error?
  ```
  15:43:06 | Concurrency: 1 threads (target='dev')
  15:43:06 | 
  15:43:06 | 1 of 3 START view model dbt_christine.stg_customers.................. [RUN]
  15:43:07 | 1 of 3 OK created view model dbt_christine.stg_customers............. [CREATE VIEW in 1.42s]
  15:43:07 | 2 of 3 START view model dbt_christine.stg_orders..................... [RUN]
  15:43:08 | 2 of 3 ERROR creating view model dbt_christine.stg_orders............ [ERROR in 0.39s]
  15:43:08 | 3 of 3 SKIP relation dbt_christine.customers......................... [SKIP]
  15:43:08 | 
  15:43:08 | Finished running 2 view models, 1 table model in 3.65s.

  Completed with 1 error and 0 warnings:

  Database Error in model stg_orders (models/staging/stg_orders.sql)
    Syntax error: Expected ")" but got keyword WITH at [8:8]
    compiled SQL at target/run/jaffle_shop/staging/stg_orders.sql

  Done. PASS=2 WARN=0 ERROR=1 SKIP=0 TOTAL=3
  ```
  - The file stg_orders has an error. It found keyword "WITH" at line 8, character position 8. The line number in this instance wasn't particularly useful as my file's line was line 2. However, the location and filename, the syntax error stating it found something that should not be there ('WITH'), and the index at position 8 tells me where I can find the offending sql statement.
  
### Run only a single model at a time
The command dbt run --models {{ model }} allowed me to run a single model. Here are the results:
```
$ dbt run --models stg_customers

Running with dbt=0.15.2
Found 3 models, 9 tests, 0 snapshots, 0 analyses, 138 macros, 0 operations, 0 seed files, 0 sources

15:56:25 | Concurrency: 1 threads (target='dev')
15:56:25 | 
15:56:25 | 1 of 1 START view model dbt_christine.stg_customers.................. [RUN]
15:56:27 | 1 of 1 OK created view model dbt_christine.stg_customers............. [CREATE VIEW in 2.02s]
15:56:27 | 
15:56:27 | Finished running 1 view model in 3.14s.

Completed successfully

Done. PASS=1 WARN=0 ERROR=0 SKIP=0 TOTAL=1

```

### Group your models with a stg_ prefix into a staging subdirectory, configure your staging models to be views, and run only the staging models
- models/staging contains the prefixed (stg_) files.
- dbt_project.hyml contains the configuration for the staging models to be materialized as views.
- Used the command dbt run staging.* to run all models under the staging subdirectory.
