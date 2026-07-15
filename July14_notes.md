# SQL Notes - July 14

## Drawbacks of Subqueries

Subqueries are useful but have some limitations:

* Can make queries complex and difficult to understand.
* Require more processing time.
* May result in slower performance, especially when multiple nested subqueries are used.

To overcome these drawbacks, SQL provides alternative approaches such as CTEs, Temporary Tables, and Views.

---

# Common Table Expression (CTE)

A Common Table Expression (CTE) is a temporary result set that can be referenced within a query.

### Advantages

* Improves readability of complex queries.
* Increases reusability within the same query.
* Multiple logical subqueries can be organized using multiple CTEs.

### Limitation

* Scope is limited to the query in which it is created.
* It disappears once the query execution is completed.

---

# Recursive CTE

A Recursive CTE is a CTE that references and calls itself.

### Uses

* Hierarchical data processing.
* Parent-child relationships.
* Generating sequences and recursive calculations.

---

# Temporary Table

A Temporary Table is used to store intermediate results temporarily.

### Characteristics

* Exists until it is explicitly dropped or the session ends.
* Can be accessed throughout the current database session.
* Scope is extended from query level to session level.

### Drawback

* Exists only in temporary/local storage.
* Not accessible once the session is closed.

---

# View

A View is a virtual table created from a query.

### Characteristics

* Does not store duplicate copies of data.
* Stores only the query definition.
* Can be used like a regular table for querying data.
* Remains available beyond a single session.
* Can be accessed by other authorized users.

### Advantages

#### Data Security

* Restricts access to sensitive columns and data.
* Users can access only the information exposed through the view.

#### Abstraction

* Hides the complexity of underlying tables and queries.
* Provides a simplified interface for users.

---

# Stored Procedures

A Stored Procedure is a pre-defined set of SQL statements stored in the database.

### Characteristics

* Executes only when called.
* Does not store business data.
* Can accept input parameters.
* Can return output parameters.
* Helps in reusing SQL logic and automating tasks.

---

# Dynamic SQL Procedure

A Dynamic SQL Procedure is a stored procedure that builds and executes SQL statements dynamically at runtime.

### Advantages

* Flexible query execution.
* Useful when table names, columns, or conditions need to be determined dynamically.

---

# Metadata

Metadata is "data about data."

### Data Dictionary

A Data Dictionary stores information about database objects such as:

* Tables
* Columns
* Data Types
* Constraints
* Indexes
* Views
* Stored Procedures

It helps users and database administrators understand the structure of the database.
