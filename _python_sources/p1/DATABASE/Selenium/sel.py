import sys

from selenium.webdriver import Firefox, Remote


def open():
    driver = Firefox(
        executable_path="D:\\BBBB_PYTHON_Selenium\\Personal_Huy_Robot_Framework\\Resources\\geckodriver.exe")
    print("%s  %s" % (driver.session_id, driver.command_executor._url))
    driver.get("https://translate.google.com")
    return driver.session_id, driver.command_executor._url

def attach(sid, url):
    driver = Remote(command_executor=url, desired_capabilities={})
    driver.session_id = sid
    driver.find_element_by_css_selector("[rows]").send_keys("translate")


# sid = sys.argv[1] if len(sys.argv) > 1 else None
# url = sys.argv[2] if len(sys.argv) > 2 else None
# print(sid, url)

ff1 = open()
print(ff1, type(ff1))
print(ff1[0])
print(ff1[1])
attach(ff1[0],ff1[1])
