import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from unicodedata import normalize
from Project2.setup import *

driver = get_driver()
url = 'https://en.wikipedia.org/wiki/Minnesota'
# table_MN = pd.read_html(url)
# print(f'Total tables: {len(table_MN)}')
# table_MN = pd.read_html(url, match='Election results from statewide races')
# print(len(table_MN))
#
# df = table_MN[0]
# print(df.head())

driver.get(url)

table1 = driver.find_element_by_css_selector("#mw-content-text > div.mw-parser-output")
table1 = table1.get_attribute('innerHTML')

# table_MN2 = pd.read_html(url, match="Minnesota")
table_MN2 = pd.read_html(table1, match="Average daily maximum and minimum temperatures for selected cities in Minnesota")
print(len(table_MN2))

df2 = table_MN2[0]
print(df2)
print(df2.head())
