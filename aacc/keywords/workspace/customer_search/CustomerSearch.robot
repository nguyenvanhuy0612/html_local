*** Settings ***
Variables  CustomerSearchLocator.py
Library    Selenium2Library
Library     DateTime

*** Keywords ***
#   /02/2021
Select Customer Search
    [Arguments]    ${surname}=${EMPTY}    ${name}=${EMPTY}    ${email}=${EMPTY}    ${phone}=${EMPTY}
    ${get_element_lastname} =     Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_SURNAME}    class
    ${get_element_name} =      Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME}    class
    ${get_element_email} =     Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL}    class
    ${get_element_phone} =     Get Element Attribute    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE}    class
    Sleep   0.5
    ${check_field_lastname} =    Run Keyword And Return Status   Should Contain    ${get_element_lastname}    enabled
    ${check_field_name} =     Run Keyword And Return Status   Should Contain    ${get_element_name}    enabled
    ${check_field_email} =    Run Keyword And Return Status   Should Contain    ${get_element_email}    enabled
    ${check_field_phone} =    Run Keyword And Return Status   Should Contain    ${get_element_phone}    enabled
#    Log To Console    ${check_field_lastname}***${check_field_name}***${check_field_email}***${check_field_phone}
#    Run Keyword Unless     '${surname}'=='${EMPTY}' and '${check_field_lastname}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_SURNAME}
#    Run Keyword Unless     '${name}'=='${EMPTY}' and '${check_field_name}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME}
#    Run Keyword Unless     '${email}'=='${EMPTY}' and '${check_field_email}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL}
#    Run Keyword Unless     '${phone}'=='${EMPTY}' and '${check_field_phone}'=='True'   Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE}
    Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_NAME}
    Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_EMAIL}
    Click Element    ${CUSTOMER_SEARCH_BTN_FIELD_SEARCH_PHONE}
    Sleep   0.5
    Run Keyword Unless     '${surname}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_SURNAME}    ${surname}
    Run Keyword Unless     '${name}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_FIRSTNAME}    ${name}
    Run Keyword Unless     '${email}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_EMAIL}    ${email}
    Run Keyword Unless     '${phone}'=='${EMPTY}'    Input Text   ${CUSTOMER_SEARCH_INPUT_CONTENT_PHONE}    ${phone}
    Sleep   1
    Click Element    ${CUSTOMER_SEARCH_BTN_SEARCH}
	Sleep   0.5

#   /02/2021
Verify Customer Search
    [Arguments]    ${surname}=${EMPTY}    ${name}=${EMPTY}    ${email}=${EMPTY}
    Wait Until Element Is Visible    ${CUSTOMER_SEARCH_RESULT_SEARCH_CONTACT}    timeout=20s
    ${get_content_contact} =    Get Text    ${CUSTOMER_SEARCH_RESULT_SEARCH_CONTACT}
    Should Contain    ${get_content_contact}   ${surname}
    Should Contain    ${get_content_contact}   ${name}
    Should Contain    ${get_content_contact}   ${email}