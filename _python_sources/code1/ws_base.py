import base64
import time

from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import PW3.setup
from selenium import webdriver

driver = PW3.setup.get_driver()


def driver_info():
    print('Window handles:', driver.window_handles)
    print('current URL:', driver.current_url)
    print('current session id:', driver.session_id)
    for win_handle in driver.window_handles:
        driver.switch_to.window(win_handle)
        if '100.30.7.108:31380' in driver.current_url:
            return False
    return True


def get_page(input_url: str):
    if driver_info():
        driver.get(input_url)


url = r'http://100.30.7.108:31380/Login/?returnpage=../services/UnifiedAgentController/workspaces/'
get_page(url)


def save_canvas_as_image(canvas, file_save):
    canvas_base64 = driver.execute_script("return arguments[0].toDataURL('image/png').substring(21);", canvas)
    canvas_png = base64.b64decode(canvas_base64)

    with open(file_save, 'wb') as f:
        f.write(canvas_png)


# driver.find_element_by_xpath("//span[normalize-space()='WC_WC1']").click()
time.sleep(2)
canvas1 = driver.find_element_by_css_selector('#agentsChart')
canvas2 = driver.find_element_by_css_selector('#contactsChart')

save_canvas_as_image(canvas1, 'C:/Users/Administrator/Downloads/canvas1.png')
save_canvas_as_image(canvas2, 'C:/Users/Administrator/Downloads/canvas2.png')


js_func = """
function contextMenuClick(element){
    var evt = element.ownerDocument.createEvent('MouseEvents');

    var RIGHT_CLICK_BUTTON_CODE = 2; // the same for FF and IE

    evt.initMouseEvent('contextmenu', true, true,
         element.ownerDocument.defaultView, 1, 0, 0, 0, 0, false,
         false, false, false, RIGHT_CLICK_BUTTON_CODE, null);

    if (document.createEventObject){
        // dispatch for IE
       return element.fireEvent('onclick', evt)
     }
    else{
       // dispatch for firefox + others
      return !element.dispatchEvent(evt);
    }
}
"""

# canvas_png = base64.b64decode(canvas1.screenshot_as_base64)
# with open('file_save.png', 'wb') as f:
#     f.write(canvas_png)
# element = WebDriverWait(driver, 500).until(EC.presence_of_element_located((By.CSS_SELECTOR, "#agentsChart")))

driver.save_screenshot(r'C:/Users/Administrator/Downloads/ws.png')
with open(r'C:/Users/Administrator/Downloads/canvas1_test1_png.png', 'wb') as f:
    f.write(driver.find_element_by_css_selector('#agentsChart').screenshot_as_png)
