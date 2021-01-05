import os

from selenium import webdriver


class runChromeTest():
    def testMethod(self):
        print("xmp1")
        driver = webdriver.Chrome(
            executable_path="D:\\BBBB_PYTHON_Selenium\\AACC_Project\\chromedriver_v81_win32\\chromedriver.exe")
        driver.get("https://google.com")
        driver.implicitly_wait(15)
        driver.set_page_load_timeout(10)
        driver.find_element_by_name("q").send_keys("Nguyen Van Huy")
        driver.find_element_by_name("btnK").click()


class runChromeWithEnviro():
    def testMethod(self):
        driverLocation = "D:\\BBBB_PYTHON_Selenium\\AACC_Project\\chromedriver_v81_win32\\chromedriver.exe"
        os.environ["webdriver.chrome.driver"] = driverLocation
        driver = webdriver.Chrome(driverLocation)
        driver.get("https://google.com")
        driver.set_page_load_timeout(10)
        driver.implicitly_wait(10)
        driver.find_element_by_name("q").send_keys("google")
        driver.find_element_by_name("btnK").click()


class runIEWithEnviro():
    def testMethod(self):
        driverLocation = "D:\\BBBB_JAVA_Selenium\\eclipse data\\software\\IEDriverServerWin32_3.150.1.exe"
        os.environ["webdriver.ie.driver"] = driverLocation
        driver = webdriver.Ie(driverLocation)
        driver.get("https://google.com")
        driver.set_page_load_timeout(10)
        driver.implicitly_wait(10)
        driver.find_element_by_name("q").send_keys("google")
        driver.find_element_by_name("btnK").click()


runTest1 = runIEWithEnviro()
runTest1.testMethod()
