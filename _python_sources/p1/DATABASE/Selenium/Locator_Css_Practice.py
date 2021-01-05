from selenium import webdriver
# from selenium.webdriver.common.keys import Keys

#
from selenium.webdriver.common.by import By


class locator:
    driver = None
    baseURL = "https://www.w3schools.com/cssref/css_selectors.asp"

    def __init__(self, driver=None, baseURL=None):
        self.driver = driver
        if baseURL is not None:
            self.baseURL = baseURL

    def runChrome(self):
        baseURL = self.baseURL
        driverLocation = "D:\\BBBB_PYTHON_Selenium\\AACC_Project\\chromedriver_v81_win32\\chromedriver.exe"
        driver = webdriver.Chrome(executable_path=driverLocation)
        driver.get(baseURL)
        driver.set_page_load_timeout(10)
        driver.implicitly_wait(10)
        self.driver = driver

    def findByName(self, name="q"):
        self.runChrome()
        driver = self.driver
        elementByName = driver.find_element_by_name(name)

        if elementByName is not None:
            print("elementByName was found", name)
        else:
            print("Cannot find elementByName", name)

    def findByCss(self, css: str = "[maxlength]"):
        # Huong dan su dung CSS selector
        # https://www.w3schools.com/cssref/trysel.asp
        # https://www.w3schools.com/cssref/css_selectors.asp
        self.runChrome()
        driver = self.driver
        elementByCss = driver.find_element_by_css_selector(css)
        element_find = driver.find_element(By.CSS_SELECTOR, css)

        if elementByCss is not None:
            print("elementByName was found", css)
            print(elementByCss.text)
            print(element_find.text)
        else:
            print("Cannot find elementByName", css)
        self.driver.close()

    def close(self):
        self.driver.close()


l1 = locator()
# l1.findByName("btnK")
# l1.close()
l1.findByCss("#main h1")
