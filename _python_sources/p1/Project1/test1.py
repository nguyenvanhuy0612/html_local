import re
import huy_project_test1.setup as setup

# driver = setup.get_driver()

def select_product_in_results(product: str = 'Power 6/55'):
    data = {'Mega 6/45': '3', 'Max 3D': '5', 'Max 4D': '2', 'Power 6/55': '4', 'Keno': '6'}
    for i in data.keys():
        if product.lower() in i.lower():
            print(product, i)
            break


# select_product_in_results('ken')
print('1'.zfill(5))

print(re.sub('\D', '', '85.542.628.500'))

# print(driver.find_element_by_xpath("//div[@class='chitietketqua_title']/h5/b[2]").text)

for i in range(6, 3, -1):
    print(i)