import csv
import time
import re

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

import package1.setup as setup


driver = setup.get_driver()
WebDriverWait(driver, 10).until(EC.frame_to_be_available_and_switch_to_it((By.NAME, "main")))
table_body = driver.find_elements_by_xpath("//*[@id=\"jasperReportForm\"]/table[1]/tbody/tr/td/table/tbody/tr/td[2]/table/tbody")
data_text = table_body[0].text
print(data_text)
# data_text1 = data_text.splitlines()
# # print(data_text1)
# for data_row in data_text1:
#     rows = data_row.split(" ")
#     print(rows)


rows = re.split(r'\n{2,}', data_text)
print(rows)

import re
filename = 'sliceeverfile3.txt'
pattern  = '\d\d,\d\d,\d\d,\d\d,\d\d,\d\d,\d\d'
new_file = []

# Make sure file gets closed after being iterated
with open(filename, 'r') as f:
    # Read the file contents and generate a list with each line
    lines = f.readlines()

# Iterate each line
for line in lines:

    # Regex applied to each line 
    match = re.search(pattern, line)
    if match:
        # Make sure to add \n to display correctly when we write it back
        new_line = match.group() + '\n'
        print(new_line)
        new_file.append(new_line)

with open(filename, 'w') as f:
    # go to start of file
    f.seek(0)
    # actually write the lines
    f.writelines(new_file)






# with open('POM_Report.csv', mode='w') as pom_file:
#     employee_writer = csv.writer(pom_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
#     employee_writer.writerow(data_text1)