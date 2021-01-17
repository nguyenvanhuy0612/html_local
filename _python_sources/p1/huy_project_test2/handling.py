import csv
import time

import setup
from data import *

driver = setup.get_driver()


def collect_data_power():
    csv_data_dict['product'] = driver.find_element_by_xpath('//option[@selected]').text
    number_row = driver.find_elements_by_xpath('//tbody/tr')
    rows = len(number_row)
    for i in range(rows):
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
    print('number of rows in current page is', rows)


def collect_data_mega():
    csv_data_dict['product'] = driver.find_element_by_xpath('//option[@selected]').text
    number_row = driver.find_elements_by_xpath('//tbody/tr')
    rows = len(number_row)
    for i in range(rows):
        csv_data_dict['date'] = number_row[i].text[0:10]
        csv_data_dict['id'] = number_row[i].text[11:16]
        csv_data_dict['num1'] = number_row[i].text[17:19]
        csv_data_dict['num2'] = number_row[i].text[19:21]
        csv_data_dict['num3'] = number_row[i].text[21:23]
        csv_data_dict['num4'] = number_row[i].text[23:25]
        csv_data_dict['num5'] = number_row[i].text[25:27]
        csv_data_dict['num6'] = number_row[i].text[27:29]
        csv_data_list.append(csv_data_dict.copy())
        time.sleep(1)
    print('number of rows in current page is', rows)


def go_page(i: int = 0):
    print("Go to page " + str(i) + " and sleep 1.5 secs", end=', ')
    driver.execute_script('javascript:NextPage(' + str(i) + ')')
    time.sleep(1.5)


def write_dictionary_to_csv():
    product_type = csv_data_list[0]['product'].lower()
    if 'power' in product_type:
        fields = ['product', 'date', 'id', 'num1', 'num2', 'num3', 'num4', 'num5', 'num6', 'num7']
        with open(csv_filename_power, 'a', newline='') as csv_file:
            writer = csv.DictWriter(csv_file, fieldnames=fields)
            writer.writerows(csv_data_list)
    if 'mega' in product_type:
        fields = ['product', 'date', 'id', 'num1', 'num2', 'num3', 'num4', 'num5', 'num6']
        with open(csv_filename_mega, 'a', newline='') as csv_file:
            writer = csv.DictWriter(csv_file, fieldnames=fields)
            writer.writerows(csv_data_list)
    csv_data_list.clear()
