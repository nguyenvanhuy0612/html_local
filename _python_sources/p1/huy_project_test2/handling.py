import time

import setup
from data import *

driver = setup.get_driver()


def collect_data_power():
    csv_data_dict['product'] = driver.find_element_by_xpath('//option[@selected]').text
    try:
        number_row = driver.find_elements_by_xpath('//tbody/tr')
    except:
        print("Cannot find any row")
        return None
    for i in range(len(number_row)):
        csv_data_dict['date'] = number_row[i].text[0:10]
        csv_data_dict['id'] = number_row[i].text[11:16]
        csv_data_dict['num1'] = number_row[i].text[17:19]
        csv_data_dict['num2'] = number_row[i].text[19:21]
        csv_data_dict['num3'] = number_row[i].text[21:23]
        csv_data_dict['num4'] = number_row[i].text[23:25]
        csv_data_dict['num5'] = number_row[i].text[25:27]
        csv_data_dict['num6'] = number_row[i].text[27:29]
        csv_data_dict['num7'] = number_row[i].text[31:]
        csv_data_list.append(csv_data_dict.copy())


def go_page(i: int = 0):
    driver.execute_script('javascript:NextPage(' + str(i) + ')')
    time.sleep(1)
