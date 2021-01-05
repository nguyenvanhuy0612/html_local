import csv
import time

from selenium.webdriver.support.select import Select

import PW3.setup

driver = PW3.setup.get_driver()


def driver_info():
    print('Window handles:', driver.window_handles)
    print('current URL:', driver.current_url)
    print('current session id:', driver.session_id)
    for win_handle in driver.window_handles:
        driver.switch_to.window(win_handle)
        if 'vietlott.vn' in driver.current_url:
            break


def get_page(url: str = 'https://vietlott.vn/vi/trung-thuong/ket-qua-trung-thuong/so-ket-qua?gameid=3&nocatche=1'):
    driver.get(url)


def choose_products(product: str = 'Power 6/55'):
    data = {'Mega 6/45': '3', 'Max 3D': '5', 'Max 4D': '2', 'Power 6/55': '4', 'Keno': '6'}
    drp_select = Select(driver.find_element_by_xpath("//select[@id='drpSelectGame']"))
    drp_select.select_by_value(data[product])
    time.sleep(1)


# choose_products('Mega 6/45')


def write_csv(data_dict=None):
    if data_dict is None:
        data_dict = {'Mega 6/45': '3', 'Max 3D': '5', 'Max 4D': '2', 'Power 6/55': '4', 'Keno': '6'}
    for key in data_dict:
        print(key, '->', data_dict[key])
        yield data_dict[key]


# print(', '.join(write_csv()))


def write_csv2(dict_input: dict, filename: str):
    with open(filename, 'a', newline='') as csvfile:
        fieldnames = ['product', 'date', 'id', 'num1', 'num2', 'num3', 'num4', 'num5', 'num6']
        if len(dict_input) >= 10:
            fieldnames.append('num7')
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        # writer.writeheader()
        writer.writerow(dict_input)


def read_page(file_to_save: str = None):
    # cur_dict = {'product': 'mega', 'date': 23, 'id': 6, 'num1': 00, 'num2': 11, 'num3': 22, 'num4': 33, 'num5': 44, 'num6': 55};
    cur_dict = {}
    product = driver.find_element_by_xpath('//option[@selected]').text
    if 'Power' in product:
        cur_dict['num7'] = 77

    cur_dict['product'] = product
    for i in range(len(driver.find_elements_by_xpath('//tbody/tr'))):
        cur_dict['date'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']' + '/td[1]').text
        cur_dict['id'] = driver.find_element_by_xpath('//tbody/tr' + '[' + str(i + 1) + ']' + '/td[2]/a').text
        cur_dict['num1'] = driver.find_element_by_xpath(
            '//tbody/tr' + '[' + str(i + 1) + ']' + '/td[3]/div/span[1]').text
        cur_dict['num2'] = driver.find_element_by_xpath(
            '//tbody/tr' + '[' + str(i + 1) + ']' + '/td[3]/div/span[2]').text
        cur_dict['num3'] = driver.find_element_by_xpath(
            '//tbody/tr' + '[' + str(i + 1) + ']' + '/td[3]/div/span[3]').text
        cur_dict['num4'] = driver.find_element_by_xpath(
            '//tbody/tr' + '[' + str(i + 1) + ']' + '/td[3]/div/span[4]').text
        cur_dict['num5'] = driver.find_element_by_xpath(
            '//tbody/tr' + '[' + str(i + 1) + ']' + '/td[3]/div/span[5]').text
        cur_dict['num6'] = driver.find_element_by_xpath(
            '//tbody/tr' + '[' + str(i + 1) + ']' + '/td[3]/div/span[6]').text
        if len(cur_dict) >= 10:
            cur_dict['num7'] = driver.find_element_by_xpath(
                '//tbody/tr' + '[' + str(i + 1) + ']' + '/td[3]/div/span[8]').text
        print("cur_dict: ", cur_dict)
        if file_to_save is not None:
            write_csv2(cur_dict, file_to_save)


def pagination(start_page: int = 0, stop_page: int = 10):
    choose_products('Mega 6/45')

    for i in range(start_page, stop_page):
        print("Read page: ", i + 1, "="*50)
        driver.execute_script('javascript:NextPage(' + str(i) + ')')
        time.sleep(1)
        read_page(file_to_save='crawl3.csv')


driver_info()
# get_page()
# mega 86 pages, power 65 pages
pagination(0, 86)
