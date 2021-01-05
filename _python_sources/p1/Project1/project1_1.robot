*** Settings ***
Library  Selenium2Library
Library  ../DATABASE/Selenium/BaseKeyword.py

*** Test Cases ***
Google
    open browser    https://google.com  chrome   alias=ChromeA
    sleep  5

Base Keyword
    open browser    https://google.com  chrome
    sleep  5
    ${search}=  Get WebElement  name:q
    log to console  ${search}
    highlight element   ${search}
    sleep  5
    ${btnSearch}=   get current web driver
    log to console      ${btnSearch}
    sleep  5

