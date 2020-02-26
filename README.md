#### The files in this repository are a result of practicing the tutorial for dbt found at https://tutorial.getdbt.com/tutorial/.
Below are the answers to the solutions for the supplemental excercises from the tutorial. These are my individual answers attempted on my own before watching the video walk-through of the additional exercises, unless otherwise noted.

### Excercise Set #1: Build your first models
1. **Write some bad SQL to cause an error — can you debug this error?**
 	```
  	15:43:06 | Concurrency: 1 threads (target='dev')
  	15:43:06 | 
  	15:43:06 | 1 of 3 START view model dbt_christine.stg_customers.................. [RUN]
  	15:43:07 | 1 of 3 OK created view model dbt_christine.stg_customers............. [CREATE VIEW in 1.42s]
  	15:43:07 | 2 of 3 START view model dbt_christine.stg_orders..................... [RUN]
  	15:43:08 | 2 of 3 ERROR creating view model dbt_christine.stg_orders............ 	[ERROR in 0.39s]
  	15:43:08 | 3 of 3 SKIP relation dbt_christine.customers......................... [SKIP]
  	15:43:08 | 
  	15:43:08 | Finished running 2 view models, 1 table model in 3.65s.
  	Completed with 1 error and 0 warnings:

  	Database Error in model stg_orders (models/staging/stg_orders.sql)
    	Syntax error: Expected ")" but got keyword WITH at [8:8]
    	compiled SQL at target/run/jaffle_shop/staging/stg_orders.sql

  	Done. PASS=2 WARN=0 ERROR=1 SKIP=0 TOTAL=3
  	```
 	The file stg_orders has an error. It found keyword "WITH" at line 8, character position 8. The line number in this instance wasn't particularly useful as my file's line was line 2. However, the location and filename, the syntax error stating it found something that should not be there ('WITH'), and the index at position 8 tells me where I can find the offending sql statement.
  
2. **Run only a single model at a time**

	The command ```dbt run --models {{ model }}``` allowed me to run a single model. Here are the results:
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
    
3. **Group your models with a stg_ prefix into a staging subdirectory, configure your staging models to be views, and run only the staging models**
  - models/staging contains the prefixed (stg_) files.
  - dbt_project.hyml contains the configuration for the staging models to be materialized as views.
  - The command ```dbt run staging.*``` to run all models under the staging subdirectory.
  
### Exercise Set #2: Test and document your project
1. **Write a test that fails, for example, omit one of the order statuses in the accepted_values list. What does a failing test look like? Can you debug the failure?**
	
    For this one, I removed the 'placed' value from the accepted_values in the models/schema.yml (which you can find commented out in the file). I ran the ```dbt test``` command and saw the errors in the terminal, however, I feel that if this was a real situation that I would have gotten some general information from the console (the location of the output file and offending test), but I would not have known to run the sql found in the schema_test folder against my database. After reviewing the sql, I understand that the query is getting all unique values found in the set, and then it selects from that list all the values that are not found in the test condition. **The video was very helpful in teaching me better ways to debug using the dbt schema test outputs.**
 
 	After following the video, my output in BigQuery came back with one result of a missing value:
 	``` 
 	[
  	{
   	 	"value_field": "placed"
  	}
 	]
	```

2. **Run the tests for one model only. If you grouped your stg_ models into a directory, try running the tests for all the models in that directory.**
  - For one model only, I used the command ```dbt test --models {{ model}}```
  - For testing all models in my models/staging directory, I ran ```dbt test --models staging.*```

3. **Use a docs block to add a Markdown description to a model.**
  - After reviewing https://docs.getdbt.com/docs/documentation#section-docs-blocks, I added a markdown description which can be found in models/staging/model-descriptions.md.
  - The reference to the docs block can be found in models/schema.yml under the stg_customers test.
  - Additionally, I ran ```dbt docs generate``` and ```dbt docs serve``` to make and view the documentation.
