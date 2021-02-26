
CUSTOMER_SEARCH_BTN_FIELD_SEARCH = "xpath://button[@aria-label='Add search by {}']"     # Surname, Name, Email, Phone
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_SURNAME = "xpath://button[@aria-label='Add search by Surname']"
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME = "xpath://button[@aria-label='Add search by Name']"
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL = "xpath://button[@aria-label='Add search by Email']"
CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE = "xpath://button[@aria-label='Add search by Phone']"
CUSTOMER_SEARCH_BTN_SEARCH = "xpath://button[@aria-label='Search']"
CUSTOMER_SEARCH_BTN_CREATE_NEW_CUSTOMER = "xpath://button//span[contains(text(),'Create new customer')]"
CUSTOMER_SEARCH_INPUT_CONTENT_SEARCH = "xpath://input[contains(@ng-model,'{}')]"    # lastName, firstName, emailAddress, phoneNumber
CUSTOMER_SEARCH_INPUT_CONTENT_SURNAME = "xpath://input[contains(@ng-model,'lastName')]"
CUSTOMER_SEARCH_INPUT_CONTENT_FIRSTNAME = "xpath://input[contains(@ng-model,'firstName')]"
CUSTOMER_SEARCH_INPUT_CONTENT_EMAIL = "xpath://input[contains(@ng-model,'emailAddress')]"
CUSTOMER_SEARCH_INPUT_CONTENT_PHONE = "xpath://input[contains(@ng-model,'phoneNumber')]"

CUSTOMER_SEARCH_RESULT_SEARCH_CONTACT = "xpath://md-list-item[1]//div[@class='md-list-item-text layout-align-center-start layout-column']"
CUSTOMER_SEARCH_BTN_SHOW_HISTORY = "xpath://md-list-item[1]//button[@aria-label='Show history']"
# CUSTOMER_SEARCH_BTN_SHOW_HISTORY = "xpath://button[@aria-label='Show history']"
# CUSTOMER_SEARCH_BTN_CALL_CUSTOMER = "xpath://button[contains(@aria-label,'Click to call')]"
# CUSTOMER_SEARCH_BTN_CALL_CUSTOMER = "xpath://button[contains(@aria-label,'Click to call {}')]"
CUSTOMER_SEARCH_BTN_CALL_CUSTOMER = "xpath://md-list-item[1]//button[contains(@aria-label,'Click to call {}')]"
CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER = "xpath://md-list-item[1]//button[@aria-label='Click to email']"
CUSTOMER_SEARCH_BTN_EDIT_NAME = "xpath://button[@aria-label='Edit name']"
CUSTOMER_SEARCH_BTN_ADD_DATA = "xpath://button[@aria-label='Add{}']"    #  address, phone, URI

