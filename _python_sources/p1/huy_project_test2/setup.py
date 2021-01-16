import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def get_driver():
    chrome_driver = r"../Tools/chromedriver.exe"
    chrome_options = Options()
    outputs = os.popen('wmic process get CommandLine').readlines()
    check = 0
    for line in outputs:
        if "remote-debugging-port" in line:
            print("get_driver(): Found: remote-debugging-port, add_experimental_option: debuggerAddress", "127.0.0.1:9223")
            chrome_options.add_experimental_option("debuggerAddress", "127.0.0.1:9223")
            check = 1
            break
    if check == 0:
        print("get_driver(): Not found: remote-debugging-port, add_argument: --remote-debugging-port=9223")
        chrome_options.add_argument("--remote-debugging-port=9223")
    driver = webdriver.Chrome(executable_path=chrome_driver, chrome_options=chrome_options)
    print("get_driver(): implicitly_wait = 60")
    driver.implicitly_wait(60)
    print("get_driver(): set_page_load_timeout = 120")
    driver.set_page_load_timeout(120)
    return driver


def driver_get_url(text_to_scan: str = 'vietlott.vn',
                   url: str = 'https://vietlott.vn/vi/trung-thuong/ket-qua-trung-thuong/so-ket-qua?gameid=3&nocatche=1'):
    driver = get_driver()
    print('Window handles:', driver.window_handles)
    print('current URL:', driver.current_url)
    print('current session id:', driver.session_id)
    for win_handle in driver.window_handles:
        driver.switch_to.window(win_handle)
        if text_to_scan in driver.current_url:
            print('Found ' + text_to_scan + ' in background process, do not get url')
            return None
    return driver.get(url)
