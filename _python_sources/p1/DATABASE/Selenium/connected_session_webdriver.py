from selenium import webdriver

sid, url = None, None


def open():
    driver = webdriver.Firefox(
        executable_path="D:\\BBBB_PYTHON_Selenium\\Personal_Huy_Robot_Framework\\Resources\\geckodriver.exe")
    driver.get("https://translate.google.com")
    print("%s  %s" % (driver.session_id, driver.command_executor._url))
    global sid
    sid = driver.session_id
    global url
    url = driver.command_executor._url


def trans():
    global sid
    print(sid)
    global url
    print(url)

    driver = webdriver.Remote(command_executor=url, desired_capabilities={})
    driver.close()
    driver.session_id = sid
    driver.find_element_by_css_selector("[rows]").send_keys("translate")


# sid = sys.argv[1] if len(sys.argv) > 1 else None
# url = sys.argv[2] if len(sys.argv) > 2 else None
# print("sid", sid)
# print("url", url)

open()
trans()
