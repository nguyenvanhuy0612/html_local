*** Settings ***
Library     Selenium2Library
#Library     connected_session_webdriver_temp1.py
Library     get_library_instance.py

*** Test Cases ***
Input Account
    Open Browser  https://translate.google.com    Chrome
    Set Selenium Speed  1
    ${session_id}=      Get Session Id
    Log To Console  Session: ${session_id}

    ${type}=     trans send keys
    Log To Console  Type of driver: ${type}

    ${text}=    Get Text    css:div > p:nth-of-type(15)
    Log To Console  Text1: ${text}

    ${text}=    get trans text  div > p:nth-of-type(15)
    Log To Console  Text2: ${text}