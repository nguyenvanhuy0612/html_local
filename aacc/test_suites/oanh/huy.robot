*** Settings ***
Resource    ../resources/SystemResources.robot
Library     Selenium2Library


*** Test Cases ***
Test 1
    #Evaluate    pdb.Pdb(stdout=sys.__stdout__).set_trace()    modules=sys, pdb
    log to console    Hello
    #debug
    log to console    Hi
    Log to console    Huy1
    
Test 2
    debug
    import library  Selenium2Library    WITH NAME  S2L
    S2L.Set Selenium Speed  2
    S2L.Open Browser    https://google.com  chrome
    debug
    S2L.Close Browser
    Log to console    Test2
    log to console  123
