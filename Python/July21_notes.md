# Python Fundamentals 

## Strings

A **string** is an ordered sequence of characters enclosed within single (`' '`) or double (`" "`) quotes.

### len()

Returns the total number of characters in a string.

### String Indexing

Accessing individual characters in a string using their position (index).

### String Slicing

Extracting a portion of a string using start, end, and step values.

### Reverse String

Displaying the characters of a string in the opposite order.

### Concatenation

Combining two or more strings into a single string.

### Repetition

Repeating a string multiple times using the `*` operator.

### Immutability

The property that prevents a string from being modified after it is created.

### Item Reassignment

Changing a value at a specific index. This is not allowed for strings because they are immutable.

### upper()

Converts all characters in a string to uppercase.

### lower()

Converts all characters in a string to lowercase.

### split()

Splits a string into a list based on a specified separator.

### f-string

A modern string formatting method that allows variables and expressions to be embedded directly inside strings.

### format()

A string formatting method that inserts values into placeholders within a string.

### find()

Returns the index position of the first occurrence of a specified value.

### count()

Returns the number of times a specified value appears.

### expandtabs()

Converts tab characters into spaces.

### isalnum()

Returns `True` if the string contains only letters and numbers.

### isalpha()

Returns `True` if the string contains only alphabetic characters.

### islower()

Returns `True` if all alphabetic characters are lowercase.

### isspace()

Returns `True` if the string contains only whitespace characters.

### istitle()

Returns `True` if every word starts with a capital letter.

### isupper()

Returns `True` if all alphabetic characters are uppercase.

### endswith()

Checks whether a string ends with a specified value.

### partition()

Splits a string into three parts: before the separator, the separator itself, and after the separator.

---

# Lists

A **list** is an ordered and mutable collection that can store multiple values of different data types.

### len()

Returns the number of elements in a list.

### List Indexing

Accessing individual elements of a list using their position.

### List Slicing

Extracting a portion of a list.

### List Concatenation

Combining two or more lists into a single list.

### List Multiplication

Repeating the elements of a list multiple times.

### Mutability

The property that allows a list to be modified after creation.

### append()

Adds an element to the end of a list.

### pop()

Removes and returns an element from a list. By default, it removes the last element.

### sort()

Arranges list elements in ascending order by default.

### reverse()

Reverses the order of elements in a list.

### count()

Returns the number of occurrences of a specified value in a list.

### extend()

Adds multiple elements from another iterable to the end of a list.

### index()

Returns the position of the first occurrence of a specified value.

### insert()

Adds an element at a specified position in a list.

### remove()

Removes the first occurrence of a specified value from a list.

### Nested List

A list that contains one or more lists as its elements.

### List Comprehension

A concise way to create lists using a single line of code.

---

# Tuples

A **tuple** is an ordered collection similar to a list but immutable.

### Tuple to List

Converts a tuple into a list to allow modifications.

### List to Tuple

Converts a list into a tuple.

### When to Use Tuples

Tuples are used when data should remain unchanged after creation.

---

# Sets

A **set** is an unordered collection of unique elements.

### remove()

Removes a specified element from a set. Raises an error if the element does not exist.

### discard()

Removes a specified element from a set without raising an error if it does not exist.

### pop()

Removes and returns a random element from a set.

### clear()

Removes all elements from a set.

---

# Dictionaries

A **dictionary** is a mutable collection that stores data in key-value pairs.

### Key

A unique identifier used to access a value in a dictionary.

### Value

The data associated with a key.

### Nested Dictionary

A dictionary that contains another dictionary as a value.

### keys()

Returns all keys in a dictionary.

### values()

Returns all values in a dictionary.

### items()

Returns all key-value pairs as tuples.

### Dictionary Comprehension

A concise way to create dictionaries using a single line of code.

---

# Copy Methods

### Shallow Copy

Creates a new object but shares nested objects with the original object.

### Deep Copy

Creates a completely independent copy of an object, including all nested objects.

---

