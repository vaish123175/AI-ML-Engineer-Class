# SQL Notes - July 10

## Built-in Functions

Built-in functions are predefined functions used to perform operations on strings, numbers, and dates.

### Types of Built-in Functions

* String Functions
* Mathematical Functions
* Date and Time Functions

---

## String Functions

### Padding

* Used to align data.
* Adds extra spaces or characters to a value.
* Empty spaces are called white spaces.

### Substring

* Used to get a part of a string.
* Index starts from 1 in SQL.

### Concatenation (CONCAT)

* Used to combine two or more strings.
* Example: Full names, email IDs.

### Reverse

* Used to reverse a string.
* Useful for checking palindromes.

### Length

* Used to find the number of characters in a string.

### SUBSTRING with LOCATE

* LOCATE() finds the position of a character or word in a string.
* Used along with SUBSTRING() to extract required data.
* `+1` gets characters after the located position.
* `-1` gets characters before the located position.

### Upper and Lower

* UPPER() converts text to uppercase.
* LOWER() converts text to lowercase.

### Left and Right

* LEFT() fetches characters from the left side.
* RIGHT() fetches characters from the right side.

### CASE Statement

* Used for conditional logic.
* Similar to if-else statements.

### Replace

* Used to replace a specific character, word, or value with another.

### Regular Expressions (REGEX)

* Used to fetch data matching specific patterns.
* NOT REGEXP is used to get data that does not match a pattern.

---

## Mathematical Functions

Used to perform calculations on numeric values.

### COUNT()

* Counts the number of records.

### SUM()

* Returns the total of a column.

### AVG()

* Returns the average value.

### RAND()

* Generates a random number.

### FLOOR()

* Returns the lower integer value.
* Example: FLOOR(10.9) = 10

### CEIL() / CEILING()

* Returns the upper integer value.
* Example: CEIL(10.1) = 11

### ROUND()

* Rounds a number to the nearest value.

### POWER()

* Raises a number to a specified power.

### MOD()

* Returns the remainder after division.

---

## Date and Time Functions

Used to work with date and time values.

### DATE()

* Returns only the date part from a datetime value.

### CURDATE()

* Returns the current date.

### DAY()

* Returns the day from a date.

### MONTH()

* Returns the month from a date.

### YEAR()

* Returns the year from a date.

---

## Important Points

* Built-in functions reduce the need to write lengthy logic.
* Multiple functions can be combined in a single query.
* String functions work with text data.
* Mathematical functions work with numeric data.
* Date functions work with date and time values.
