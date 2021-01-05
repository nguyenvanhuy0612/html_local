from selenium import webdriver


class list_elements:
    driver = None
    baseURL = "https://www.w3schools.com/cssref/css_selectors.asp"

    def __init__(self, driver=None, baseURL=None):
        self.driver = driver
        if baseURL is not None:
            self.baseURL = baseURL

    def runChrome(self):
        baseURL = self.baseURL
        driverLocation = "D:\\BBBB_PYTHON_Selenium\\AACC_Project\\chromedriver_v81_win32\\chromedriver.exe"
        self.driver = webdriver.Chrome(executable_path=driverLocation)
        self.driver.get(baseURL)
        self.driver.set_page_load_timeout(10)
        self.driver.implicitly_wait(10)

    def find(self, input_locator_xpath: str = "//div[@id='main']/h1"):
        # Huong dan su dung CSS selector
        # https://www.w3schools.com/cssref/trysel.asp
        # https://www.w3schools.com/cssref/css_selectors.asp
        self.runChrome()
        driver = self.driver
        elements_find = driver.find_elements_by_xpath(input_locator_xpath)
        length = len(elements_find)
        # todo print the length of all list elements found
        print(length)
        # todo open file and write all call methods  of driver
        with open("t.txt", "w") as write_file:
            for s in dir(driver):
                write_file.write(s+"\n")

        # Close
        self.driver.close()

    def close(self):
        self.driver.close()


l1 = list_elements()
l1.find(input_locator_xpath="//div[@id]")
