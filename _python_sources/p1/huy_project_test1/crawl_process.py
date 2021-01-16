import csv
import os
import time

import setup

driver = setup.get_driver()


def select_product_in_results(product: str = 'Power 6/55'):
    data = {'Mega 6/45': '3', 'Max 3D': '5', 'Max 4D': '2', 'Power 6/55': '4', 'Keno': '6'}
    for k in data.keys():
        if product.lower() in k.lower():
            from selenium.webdriver.support.select import Select
            drp_select = Select(driver.find_element_by_xpath("//select[@id='drpSelectGame']"))
            drp_select.select_by_value(data[k])
            time.sleep(2)
            break
    print('Product input is not found in data', product)


def collect_data(file_to_save: str = 'default'):
    cur_dict = {'product': '', 'date': 0, 'id': 0, 'num1': 0, 'num2': 0, 'num3': 0, 'num4': 0, 'num5': 0, 'num6': 0}
    product = driver.find_element_by_xpath('//option[@selected]').text
    if 'Power' in product:
        cur_dict['num7'] = 0
    cur_dict['product'] = product
    for i in range(len(driver.find_elements_by_xpath('//tbody/tr'))):
        cur_dict['date'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[1]').text
        cur_dict['id'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[2]/a').text
        cur_dict['num1'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[3]/div/span[1]').text
        cur_dict['num2'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[3]/div/span[2]').text
        cur_dict['num3'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[3]/div/span[3]').text
        cur_dict['num4'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[3]/div/span[4]').text
        cur_dict['num5'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[3]/div/span[5]').text
        cur_dict['num6'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']/td[3]/div/span[6]').text
        if 'num7' in cur_dict.keys():
            cur_dict['num7'] = driver.find_element_by_xpath(
                '//tbody/tr' + '[' + str(i + 1) + ']/td[3]/div/span[8]').text
        # print("cur_dict: ", cur_dict)
        if file_to_save is not 'default':
            write_to_csv(cur_dict, file_to_save)


def pagination(start_page: int = 0, stop_page: int = 10, is_remove: bool = True, file: str = 'power_crawl2.csv',
               product: str = 'Power 6/55'):
    if os.path.exists(file) and is_remove:
        os.remove(file)
    select_product_in_results(product)
    for i in range(start_page, stop_page):
        print("Read page: ", i + 1, "=" * 50)
        driver.execute_script('javascript:NextPage(' + str(i) + ')')
        time.sleep(1)
        collect_data(file_to_save=file)


def write_to_csv(dict_input: dict, filename: str = 'test'):
    if 'csv' not in filename:
        filename += '.csv'
    with open(filename, 'a', newline='') as csvfile:
        fieldnames = dict_input.keys()
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        # writer.writeheader()
        writer.writerow(dict_input)
