# July 23 - File Operations, Excel Files, Pandas, Modules, Exception Handling & SQLite

# File Operations

## What are File Operations?

- File operations allow Python programs to create, read, update, and delete files stored on the computer.
- They are useful for storing data permanently instead of keeping it only in memory.
- Python provides built-in functions to work with text files and binary files.

Common file operations include:
- Opening a file
- Reading data from a file
- Writing data to a file
- Appending data to a file
- Closing a file

---

# Opening a File

The `open()` function is used to open a file.

### Syntax

```python
open(file_name, mode)
```

It takes two main arguments:

- **File Name** – Name or path of the file.
- **Mode** – Specifies how the file should be opened.

---

# File Modes

## Read Mode (`r`)

- Opens an existing file for reading.
- This is the default mode.
- An error occurs if the file does not exist.
- The file cannot be modified in this mode.

---

## Write Mode (`w`)

- Opens a file for writing.
- Creates a new file if it does not exist.
- If the file already exists, its contents are overwritten.
- Used when old data is no longer needed.

---

## Append Mode (`a`)

- Opens a file for writing without deleting existing data.
- New content is added to the end of the file.
- Creates the file if it does not exist.

---

## Read and Write Mode (`r+`)

- Opens a file for both reading and writing.
- The file must already exist.
- Does not automatically erase existing content.
- Allows both reading and updating data.

---

## Other File Modes

| Mode | Description |
|------|-------------|
| `x` | Creates a new file. Raises an error if the file already exists. |
| `rb` | Opens a binary file for reading. |
| `wb` | Opens a binary file for writing. |
| `ab` | Opens a binary file for appending. |
| `r+` | Read and write. |
| `w+` | Read and write (overwrites existing data). |
| `a+` | Read and append. |

---

# Reading a File

Python provides several methods to read file contents.

## `read()`

- Reads the entire contents of a file.
- Returns the data as a string.

---

## `readline()`

- Reads one line at a time.

---

## `readlines()`

- Reads all lines and stores them in a list.

---

# Writing to a File

## `write()`

- Writes data into a file.
- Returns the number of characters written.
- Existing content is replaced in write mode.

---

# String Method: `strip()`

- Removes leading and trailing whitespace.
- Also removes newline characters (`\n`).
- Commonly used while reading text files.

---

# Closing a File

- Files should always be closed after use.
- Closing releases system resources.
- Prevents data corruption.

---

# Using `with` Statement

- The `with` statement automatically closes the file.
- It is the recommended way to work with files.
- Prevents forgetting to close files.

---

# Text Files

- Store data in readable text format.
- Examples:
  - `.txt`
  - `.csv`
  - `.log`

---

# Binary Files

- Store data in binary format.
- Not human-readable.
- Examples:
  - Images
  - Audio files
  - Videos
  - PDF files

---

# Excel Files in Python

Python can read and write Excel files using the **Pandas** library.

Supported Excel formats include:

- `.xlsx`
- `.xls`

---

# Pandas

## What is Pandas?

- Pandas is a powerful Python library used for data analysis and data manipulation.
- It provides efficient data structures for working with structured data.
- Widely used in Data Science, Machine Learning, and Data Analysis.

### Features of Pandas

- Fast data processing
- Reading multiple file formats
- Handling missing values
- Data cleaning
- Data filtering
- Sorting
- Grouping
- Statistical analysis

---

# DataFrame

## What is a DataFrame?

- A DataFrame is the primary data structure in Pandas.
- It consists of rows and columns.
- Similar to an Excel spreadsheet or SQL table.
- Each column can store different data types.

Advantages:
- Easy to analyze data
- Easy filtering
- Easy sorting
- Easy calculations

---

# Reading Excel Files

Commonly used function:

- `pd.read_excel()`

Purpose:
- Reads an Excel file and stores it as a DataFrame.

---

# Writing Excel Files

Commonly used function:

- `DataFrame.to_excel()`

Purpose:
- Writes a DataFrame into an Excel file.

---

# Reading Multiple Excel Files

Pandas can read multiple Excel files using loops.

Benefits:
- Combine multiple reports
- Merge datasets
- Perform batch processing
- Automate repetitive tasks

---

# Modules in Python

## What is a Module?

- A module is a single Python file containing functions, variables, and classes.
- Modules help organize code into reusable components.
- Modules can be imported into other programs.

Examples:

- math
- random
- os
- datetime
- sqlite3

---

# Packages

## What is a Package?

- A package is a collection of related modules.
- Packages help organize larger Python projects.
- A package usually contains multiple modules inside one directory.

Examples:

- NumPy
- Pandas
- Matplotlib
- Scikit-learn

---

# Libraries

## What is a Library?

- A library is a collection of packages and modules created for a specific purpose.
- Libraries provide reusable functionality.

Examples:

- Pandas
- NumPy
- TensorFlow
- OpenCV

---

# Functions

## What is a Function?

- A function is a reusable block of code.
- Functions perform a specific task.
- Functions improve code readability and reduce duplication.

Types:

- Built-in Functions
- User-defined Functions

---

# Built-in Modules

Python provides many built-in modules.

Common examples:

| Module | Purpose |
|---------|----------|
| math | Mathematical operations |
| random | Random number generation |
| datetime | Date and time operations |
| os | Operating system operations |
| sys | System-specific functions |
| sqlite3 | Database operations |
| statistics | Statistical calculations |

---

# Difference Between Module, Package, Library and Function

| Function | Module | Package | Library |
|----------|---------|----------|----------|
| Reusable block of code | Single Python file | Collection of modules | Collection of packages/modules |
| Performs one task | Groups related functions | Organizes modules | Provides complete functionality |
| Created using `def` | Imported using `import` | Contains multiple modules | Installed using pip |

---

# Exception Handling

## What is Exception Handling?

- Exception handling is used to manage runtime errors.
- It prevents the program from crashing.
- Allows the program to continue execution after handling errors.

---

# try Block

- Contains code that may produce an error.

---

# except Block

- Executes only if an exception occurs.
- Used to display error messages or perform alternative actions.

---

# finally Block

- Always executes whether an exception occurs or not.
- Commonly used for cleanup operations.
- Used for:
  - Closing files
  - Closing database connections
  - Releasing resources

---

# Common Exceptions

| Exception | Description |
|-----------|-------------|
| ZeroDivisionError | Division by zero |
| ValueError | Invalid value |
| TypeError | Incorrect data type |
| IndexError | Invalid index |
| KeyError | Invalid dictionary key |
| FileNotFoundError | File does not exist |
| NameError | Variable not defined |

---

# Database Connection Using Python

Python can connect to different databases such as:

- SQLite
- MySQL
- PostgreSQL
- Oracle
- SQL Server

---

# SQLite

## What is SQLite?

- SQLite is a lightweight relational database.
- It is built into Python.
- No separate database server is required.
- Suitable for small to medium-sized applications.

---

# sqlite3 Module

- Python uses the built-in `sqlite3` module to work with SQLite databases.
- It allows Python programs to create, read, update, and delete data from databases.

Common database operations include:

- Connecting to a database
- Creating tables
- Inserting records
- Reading records
- Updating records
- Deleting records
- Closing the connection

---

# Cursor Object

- A cursor is used to execute SQL queries.
- It acts as an interface between Python and the database.
- Used for executing SQL statements and retrieving results.

---

# Commit

- `commit()` saves all changes permanently to the database.
- Required after INSERT, UPDATE, or DELETE operations.

---

# Close Connection

- Database connections should always be closed after use.
- Closing the connection releases system resources.
- Prevents database locking and improves performance.

---

# Advantages of SQLite

- Lightweight
- Serverless
- Easy to use
- Built into Python
- Fast for small applications
- Portable database

---

# Summary

| Topic | Purpose |
|--------|---------|
| File Operations | Read, write, append and manage files |
| File Modes | Control how files are accessed |
| Pandas | Data manipulation and analysis |
| DataFrame | Tabular data structure |
| read_excel() | Read Excel files |
| to_excel() | Write Excel files |
| Module | Single Python file |
| Package | Collection of modules |
| Library | Collection of packages/modules |
| Function | Reusable block of code |
| Exception Handling | Handle runtime errors |
| try | Code that may cause an exception |
| except | Handles exceptions |
| finally | Executes regardless of exceptions |
| SQLite | Lightweight relational database |
| sqlite3 | Python module for SQLite |
| Cursor | Executes SQL queries |
| commit() | Saves changes to the database |
| close() | Closes the database connection |
