import csv
import os
import time
import re

from selenium.webdriver.support.select import Select

import setup

driver = setup.get_driver()


def write_to_csv(dict_input: dict, filename: str = 'test'):
    if 'csv' not in filename:
        filename += '.csv'
    with open(filename, 'a', newline='') as csvfile:
        fieldnames = dict_input.keys()
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        # writer.writeheader()
        writer.writerow(dict_input)


def collect_data_mega(file_to_save: str = 'default'):
    cur_dict = {
        'id': re.sub('\D', '', driver.find_element_by_xpath("//div[@class='chitietketqua_title']/h5/b[1]").text),
        'date': driver.find_element_by_xpath("//div[@class='chitietketqua_title']/h5/b[2]").text,
        'num1': driver.find_element_by_xpath("//div[@class='day_so_ket_qua_v2']/span[1]").text,
        'num2': driver.find_element_by_xpath("//div[@class='day_so_ket_qua_v2']/span[2]").text,
        'num3': driver.find_element_by_xpath("//div[@class='day_so_ket_qua_v2']/span[3]").text,
        'num4': driver.find_element_by_xpath("//div[@class='day_so_ket_qua_v2']/span[4]").text,
        'num5': driver.find_element_by_xpath("//div[@class='day_so_ket_qua_v2']/span[5]").text,
        'num6': driver.find_element_by_xpath("//div[@class='day_so_ket_qua_v2']/span[6]").text,
        'JP_winner_number': driver.find_element_by_xpath("//tbody/tr[1]/td[3]").text,
        'JP_value': re.sub('\D', '', driver.find_element_by_xpath("//tbody/tr[1]/td[4]/b").text),
        '1st_winner_number': re.sub('\D', '', driver.find_element_by_xpath("//tbody/tr[2]/td[3]").text),
        '1st_value': 10000000,
        '2nd_winner_number': re.sub('\D', '', driver.find_element_by_xpath("//tbody/tr[3]/td[3]").text),
        '2nd_value': 300000,
        '3rd_winner_number': re.sub('\D', '', driver.find_element_by_xpath("//tbody/tr[4]/td[3]").text),
        '3rd_value': 30000}
    # print("cur_dict: ", cur_dict)
    if file_to_save is not 'default':
        write_to_csv(cur_dict, file_to_save)


def pagination_mega(start_page: int = 0, stop_page: int = 10, is_remove: bool = True, file: str = 'power_crawl2.csv'):
    if os.path.exists(file) and is_remove:
        os.remove(file)
    for i in range(stop_page, start_page, -1):
        print("Read ID: ", i, "=" * 50)
        driver.execute_script('javascript:ClientDrawResult(\'' + str(i).zfill(5) + '\')')
        time.sleep(0.5)
        collect_data_mega(file_to_save=file)
