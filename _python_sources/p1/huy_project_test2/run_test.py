from handling import *
from data import *
if not driver.current_url == url_power:
    driver.get(url_power)

collect_data_power()
print(csv_data_dict)
print(csv_data_list)
write_dictionary_to_csv()
