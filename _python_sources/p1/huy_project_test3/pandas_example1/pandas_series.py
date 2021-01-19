import pandas as pd

'''
A Pandas Series is like a column in a table.

It is a one-dimensional array holding data of any type.
'''
a = [1, 7, 2]

myvar1 = pd.Series(a)

print(myvar1)

# Labels
print(myvar1[0])

# Create labels
a = [1, 7, 2]

myvar2 = pd.Series(a, index=["x", "y", "z"])

print(myvar2)
print(myvar2["y"])

# Key/Value Objects as Series

calories = {"day1": 420, "day2": 380, "day3": 390}

myvar3 = pd.Series(calories)

print(myvar3)

myvar4 = pd.Series(calories, index = ["day1", "day2"])

print(myvar4)

# DataFrames
data = {
    "calories": [420, 380, 390],
    "duration": [50, 40, 45]
}

myvar5 = pd.DataFrame(data)

print(myvar5)