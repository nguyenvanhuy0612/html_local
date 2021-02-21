"""
https://youtu.be/vmEHCJofslg

Complete Python Pandas Data Science Tutorial! (Reading CSV/Excel files, Sorting, Filtering, Groupby)

"""
import pandas as pd

poke = pd.read_csv('pokemon_data.csv')
print(poke.head(6))


print(poke)