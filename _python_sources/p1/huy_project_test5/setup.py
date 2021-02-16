import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

from data import *


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
    # remove image
    # chrome_options.add_experimental_option("prefs", {"profile.managed_default_content_settings.images": 2})
    # set developer mode
    # chrome_options.add_experimental_option('excludeSwitches', ['enable-automation'])
    driver = webdriver.Chrome(executable_path=chrome_driver, chrome_options=chrome_options)
    driver.implicitly_wait(implicitly_wait)
    driver.set_page_load_timeout(set_page_load_timeout)
    return driver

