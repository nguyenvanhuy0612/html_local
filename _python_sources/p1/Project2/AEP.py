import csv
import time
import requests
from bs4 import BeautifulSoup
import pandas as pd
import re

import Project2.setup as setup
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

driver = setup.get_driver()
# driver.switch_to.frame("main")
WebDriverWait(driver, 10).until(EC.frame_to_be_available_and_switch_to_it((By.NAME, "main")))
tb_data = driver.find_element_by_css_selector("#mw-content-text > div.mw-parser-output > table:nth-child(39)")
html_source = tb_data.get_attribute('innerHTML')
# soup = BeautifulSoup(html_source, 'html.parser')
tables = pd.read_html(html_source)
# df = html_tables[0]
# print(df)
# print(tables)
for i, table in enumerate(tables):
    table.to_csv('data/table{}.csv'.format(i))

print(tables[0].T)