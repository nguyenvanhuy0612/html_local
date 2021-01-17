from handling import *


def test1():
    if not driver.current_url == url_power:
        driver.get(url_power)
    page = 66
    while page < 70:
        go_page(page)
        collect_data_power()
        write_dictionary_to_csv()
        page += 1
        csv_data_list.clear()
    print('Success')


test1()
