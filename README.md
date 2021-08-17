# Bookmarker

## Workflow Mindmap - User Stories / Domain Modelling / MVC

[Workflow Mindmap](https://github.com/CorinneBosch/Bookmarker/blob/main/public/Workflow_mindmap.png)

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To set up the test database

Connect to `psql` and create the `bookmark_manager_test` database:

```
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.