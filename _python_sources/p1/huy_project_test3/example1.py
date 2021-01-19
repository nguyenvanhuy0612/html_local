from time import sleep
import huy_project_test2.setup as setup

driver = setup.get_driver()



def swipe_down(second):
    for i in range(int(second / 0.1)):
        # 根据i的值，模拟上下滑动
        if i % 2 == 0:
            js = "var q=document.documentElement.scrollTop=" + str(300 + 400 * i)
        else:
            js = "var q=document.documentElement.scrollTop=" + str(200 * i)
        driver.execute_script(js)
        sleep(0.1)

    js = "var q=document.documentElement.scrollTop=100000"
    driver.execute_script(js)
    sleep(0.1)
