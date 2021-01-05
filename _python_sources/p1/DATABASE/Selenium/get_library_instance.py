def title_should_start_with(expected):
    from robot.libraries.BuiltIn import BuiltIn
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    title = seleniumlib.get_title()
    if not title.startswith(expected):
        raise AssertionError("Title '%s' did not start with '%s'" % (title, expected))


def get_current_web_driver():
    from robot.libraries.BuiltIn import BuiltIn
    sele2lib = BuiltIn().get_library_instance("Selenium2Library")
    return sele2lib.driver


def trans_send_keys():
    from robot.libraries.BuiltIn import BuiltIn
    sele2lib = BuiltIn().get_library_instance("Selenium2Library")
    from selenium.webdriver.common.keys import Keys
    # from selenium import webdriver
    # driver = webdriver.Chrome()
    driver = sele2lib.driver
    driver.find_element_by_css_selector("[rows]").send_keys("test")
    driver.find_element_by_css_selector("[rows]").send_keys(Keys.ENTER)
    driver.get("https://robotframework.org/Selenium2Library/Selenium2Library.html")
    return type(driver)


def get_trans_text(css_locator):
    from robot.libraries.BuiltIn import BuiltIn
    sele2lib = BuiltIn().get_library_instance("Selenium2Library")
    driver = sele2lib.driver
    # from selenium import webdriver
    # driver = webdriver.Chrome()
    return driver.find_element_by_css_selector(css_locator).text
