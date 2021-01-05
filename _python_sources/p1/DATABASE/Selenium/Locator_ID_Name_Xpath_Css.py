from selenium import webdriver
# from selenium.webdriver.common.keys import Keys

#
from selenium.webdriver.common.keys import Keys


class locator:
    driver = None

    def runChrome(self):
        baseURL = "https://google.com"
        driverLocation = "D:\\BBBB_PYTHON_Selenium\\AACC_Project\\chromedriver_v81_win32\\chromedriver.exe"
        driver = webdriver.Chrome(driverLocation)
        driver.get(baseURL)
        driver.set_page_load_timeout(10)
        driver.implicitly_wait(10)
        self.driver = driver

    def findByName(self, name="q"):
        if self.driver is None:
            self.runChrome()
        driver = self.driver
        elementByName = driver.find_element_by_name(name)

        if elementByName is not None:
            print("elementByName was found", name)
        else:
            print("Cannot find elementByName", name)

    def findByCss(self, css="[maxlength]"):
        # Huong dan su dung CSS selector
        # https://www.w3schools.com/cssref/trysel.asp
        # https://www.w3schools.com/cssref/css_selectors.asp
        if self.driver is None:
            self.runChrome()
        driver = self.driver
        elementByName = driver.find_element_by_css_selector(css)

        if elementByName is not None:
            print("elementByName was found", css)
            elementByName.send_keys("css selector", Keys.ENTER)
        else:
            print("Cannot find elementByName", css)
            self.close()

    def close(self):
        self.driver.close()


l1 = locator()
# l1.findByName("btnK")
# l1.close()
l1.findByCss()
