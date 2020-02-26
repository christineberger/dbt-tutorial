The files in this repository are a result of practicing the tutorial for dbt found at https://tutorial.getdbt.com/tutorial/. 

### These are the locations or information on the solutions for supplemental excercises from the tutorial:
#### Build your first models
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
- Put models/staging contains the prefixed (stg_) files.
- dbt_project.hyml contains the configuration for the staging modules.
- Used the 

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/overview)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
