import Project2.setup as dr

from Project2.data import *

driver = dr.get_driver()
# driver.get("https://google.com")

rows = driver.find_elements_by_xpath(LOC_lines_coin)

print(len(rows))
for row in rows:
    try:
        print(row.text)
    except:
        pass
