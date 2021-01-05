import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
def get_driver():
    chrome_driver = r"tools/chromedriver_chrome87.exe"
    chrome_options = Options()
    outputs = os.popen('wmic process get CommandLine').readlines()
    check = 0
    for line in outputs:
        if "remote-debugging-port" in line:
            print("Found: remote-debugging-port")
            chrome_options.add_experimental_option("debuggerAddress", "127.0.0.1:9223")
            check = 1
            break
    if check == 0:
        print("Not found: remote-debugging-port")
        chrome_options.add_argument("--remote-debugging-port=9223")
    driver = webdriver.Chrome(executable_path=chrome_driver, chrome_options=chrome_options)
    driver.implicitly_wait(30)
    driver.set_page_load_timeout(60)
    return driver
