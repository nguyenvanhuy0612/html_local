from handling import *
from data import *

if not driver.current_url == url_power:
    driver.get(url_power)
page = 0
while page < 70:
    go_page(page)
    collect_data_power()
    write_dictionary_to_csv()
    csv_data_list.clear()
    page += 1
