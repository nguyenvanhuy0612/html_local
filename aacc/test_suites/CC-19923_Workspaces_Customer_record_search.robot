*** Settings ***
Resource    ../resources/SystemResources.robot

*** Test Cases ***

#=======================================================================================================================


#Created date:     17/02/2021
CC19923 003 Customer email or chat will be created successfully when a customer email or webchat sends to agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST6_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST6_NAME}   #${CUST6_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST6_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST6_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST6_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST6_EMAIL}   Hi Agent, I have some Issues

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST6_NAME}    #${CUST6_EMAIL}
    Sleep   2

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Verify the customer created successfully and will be displayed in customer search list
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#=======================================================================================================================

#Created date:     17/02/2021
CC19923 009 Search an email or webchat customer in customer search on voice only agent.
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    NavigationMenu.Open Customer Search
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
    Wait Until Element Is Visible    //div[@class='widget__content ps']//div[contains(@class,'empty')]     20

#=======================================================================================================================

#Created date:     18/02/2021
CC19923 010 Search an email or webchat customer in customer search on MM only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     18/02/2021
CC19923 011 Search an email or webchat customer in customer search on blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${EMPTY}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     19/02/2021
CC19923 012 Search a voice customer in customer search on voice only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    NavigationMenu.Open Customer Search
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
    Wait Until Element Is Visible    //div[@class='widget__content ps']//div[contains(@class,'empty')]     20

#=======================================================================================================================

#Created date:     19/02/2021
CC19923 013 Search a voice customer in customer search on MM only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     123
    Verify Customer Search      ${EMPTY}    a    a@a.com
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}

#=======================================================================================================================

#Created date:     19/02/2021
CC19923 014 Search a voice customer in customer search on blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify email customers will be listed in the widget and verify the information of customers
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     123
    Verify Customer Search      ${EMPTY}    a    a@a.com
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 015 Search an email or webchat customer in customer search by Surname
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST6_NAME}    ${EMPTY}    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 016 Search an email or webchat customer in customer search by Name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST6_NAME}    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 017 Search an email or webchat customer in customer search by Email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 018 Search an email or webchat customer in customer search by Surname and Name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 019 Search an email or webchat customer in customer search by Surname and Phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      a    ${EMPTY}    ${EMPTY}     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 020 Search an email or webchat customer in customer search by Surname and Email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST6_NAME}    ${EMPTY}    ${CUST6_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST6_NAME}    ${CUST6_NAME}    ${CUST6_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 021 Search an email or webchat customer in customer search by Surname, name and phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      a    a    ${EMPTY}     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 022 Search an email or webchat customer in customer search by Surname, name, phone and email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      a    a    a@a.com     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 023 Search an email or webchat customer in customer search by Name and phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    ${EMPTY}     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 024 Search an email or webchat customer in customer search by Name and email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     ${EMPTY}
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 025 Search an email or webchat customer in customer search by Name, Phone and email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    a    a@a.com     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 026 Search an email or webchat customer in customer search by Phone and email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    a@a.com     123
    Verify Customer Search      a    a    a@a.com

#=======================================================================================================================

#Created date:     /02/2021
CC19923 027 Search an email or webchat customer in customer search by characters such as the first letter of the name t or full name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ws_*    ${EMPTY}     ${EMPTY}
    Verify Customer Search      ${CUST1_NAME}    ${CUST1_NAME}    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 028 Search an email or webchat customer in customer search without @abc.def
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST1_NAME}     ${EMPTY}
    Page Should Not Contain Element    //md-list-item[1]//div[@class='md-list-item-text layout-align-center-start layout-column']     20

#=======================================================================================================================

#Created date:     /02/2021
CC19923 029 Search an email or webchat customer in customer search by a wildcard character
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify the information of customers when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST1_NAME}*     ${EMPTY}
    Verify Customer Search      ${CUST1_NAME}    ${CUST1_NAME}    ${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 030 Search a voice customer in customer search by Surname
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${EMPTY}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 031 Search a voice customer in customer search by Name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Name
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST1_NAME}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 032 Search a voice customer in customer search by Phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 033 Search a voice customer in customer search by Surname and Name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname and Name
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${CUST1_NAME}     ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 034 Search a voice customer in customer search by Surname and Phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname and Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${EMPTY}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 035 Search a voice customer in customer search by Surname, name and phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Surname, Name and Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${CUST1_NAME}    ${CUST1_NAME}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 036 Search a voice customer in customer search by Name and phone
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by Name and Phone
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${CUST1_NAME}     ${EMPTY}     ${CUST1_PHONE}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 037 Search a voice customer in customer search by characters such as the first letter of the name t or full name
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching characters such as the first letter of the name
    Select Customer Search      ${EMPTY}    ws_*    ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 038 Search a voice customer in customer search by a wildcard character
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Call button display when searching by a wildcard character
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ws_*    ${EMPTY}     ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 039 Search an email customer to not have phone number in customer search and verify the icons with tooltip show history and click to email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST2_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 040 Search an email customer having phone number in customer search and verify the icons with tooltip show history, Click to call and click to email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10
    ${loc_btn_click_to_call}=    String.Format String    ${CUSTOMER_SEARCH_BTN_CALL_CUSTOMER}    ${CUST1_PHONE}
    Page Should Contain Element     ${loc_btn_click_to_call}     10
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 043 Search an email or webchat customer in customer search after agent is staying a MM contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST2_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST2_NAME}    #${CUST2_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the information of customers after agent is staying a MM contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST2_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST2_NAME}    ${CUST2_NAME}    ${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends WC Contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 046 Search a voice customer in customer search after agent is staying a MM contact
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1: Customer launchs a session chat and send it to agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 2: Switch to agent's browser and Agent accepts WC and chat with Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify the information of customers after agent is staying a MM contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}     ${CUST1_EMAIL}     ${EMPTY}
    Verify Customer Search      ${CUST1_NAME}    ${CUST1_NAME}    ${CUST1_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends WC Contact
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST1_EMAIL}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 065 Retrieve history of an email or webchat customer on voice only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
    NavigationMenu.Open Customer Search
    Sleep   1

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
    Wait Until Element Is Visible    //div[@class='widget__content ps']//div[contains(@class,'empty')]     20

#=======================================================================================================================

#Created date:     /02/2021
CC19923 066 Retrieve history of an email or webchat customer on MM only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Sleep   1
    Page Should Contain Element     ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}     10

#=======================================================================================================================

#Created date:     /02/2021
CC19923 067 Retrieve history of an email or webchat customer on blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_SHOW_HISTORY}
    Sleep   1
    Page Should Contain Element     ${LOC_WORKSPACE_CUSTOMER_HISTORY_BTN_SHOW_FIRST_DETAIL}     10

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 069 Send an email from customer search on a MM only agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}
    Sleep   1
    Handle Alert    accept
    Sleep   2
    Close Mail Application

#=======================================================================================================================

#Created date:     /02/2021
CC19923 070 Send an email from customer search on a blend agent
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Verify Show History button, Click to Call and Click to Email button display when searching
    NavigationMenu.Open Customer Search
    Select Customer Search      ${EMPTY}    ${EMPTY}    ${CUST1_EMAIL}    ${EMPTY}
    Page Should Contain Element     ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}     10

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify can see the history og customer by clicking the Show History button
    Click Element    ${CUSTOMER_SEARCH_BTN_MAIL_CUSTOMER}
    Sleep   1
    Handle Alert    accept
    Sleep   2
    Close Mail Application

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#Created date:     /02/2021
CC19923 074 Search an email or webchat customer in customer history by date
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
#    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

    # STEP 0:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify can search WC contact in customer history by Date
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent

#=======================================================================================================================

#Created date:     /02/2021
CC19923 075 Search an email or webchat customer in customer history by customer email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
#    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Email   ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

    # STEP 0:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify can search a WC contact in customer history by Email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent

#=======================================================================================================================

#Created date:     /02/2021
CC19923 076 Search an email or webchat customer in customer history by subject
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
#    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Subject
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Subject   THIS IS MAIL FROM OANH_CUSTOMER
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 077 Search an email or webchat customer in customer history by to address
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

   # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT5_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify can search an email contact in customer history by To Address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   To    ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM    ${AGENT5_MAIL}   ${CUST1_EMAIL}    ${SUBJECT_MAIL1}    ${CONTENT_EMAIL1}
#    CustomerHistorySearch.Verify Customer History Search    EM    WS_WC1@acc7dc.com    ${CUST1_EMAIL}    Password Reminder    Find below your login details for our web portal.

#=======================================================================================================================

#Created date:     /02/2021
CC19923 078 Search an email or webchat customer in customer history by Date and Customer email
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
#    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date and Email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer   Email   ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

    # STEP 0:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00     Reload page
    Reload Page
    Sleep   2
    Handle Alert    accept
    Sleep   5

    # STEP 5:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
    Sleep   7

    # STEP 6:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   1
    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
    Sleep   3
    # Agent sends Message to Customer
    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
#    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
    Sleep   5
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent

    # STEP 7:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
    Switch Browser      ${BROWSER_CUST_ALIAS_1}
    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
    Sleep   5
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
#    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues

    # STEP 8:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
    Sleep   3
    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
    Sleep   2

    # STEP 9:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify can search WC contact in customer history by Date and Customer email
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST1_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent

#=======================================================================================================================

#Created date:     /02/2021
CC19923 079 Search an email or webchat customer in customer history by Date and subject
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
#    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date and Subject
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Subject    THIS IS MAIL FROM OANH_CUSTOMER
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

#Created date:     /02/2021
CC19923 080 Search an email or webchat customer in customer history by Date and to Address
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 00: Customer open Outlook and delete all old email
    Utils.TEST CASE HAS RUN INTO STEP    STEP 00    Customer open Outlook and delete all old email
    Outlook.Open Outlook
    Sleep   3
    Outlook.Delete Old Email
    Sleep   1

    # STEP 1: Agent creates new Email and sends to Customer
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Agent creates new Email and sends to Customer
    AgentToolbar.Agent Create Email
    Sleep   1
    WidgetEmail.Agent Sends Email   ${CUST1_EMAIL}     ${SUBJECT_EMAIL1}     ${CONTENT_EMAIL1}   ${AGENT3_SKILLSET_EM3}
    WidgetEmail.Complete Send Email     send       ${EMPTY}

    # STEP 2: Verify customer received email from Agent
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Verify customer received email from Agent
    Sleep   60
    Outlook.Delete Old Email
    Outlook.Verify Received Email    ${AGENT5_MAIL}    ${SUBJECT_EMAIL1}    ${CUST1_EMAIL}   ${EMPTY}
    Sleep   2
    Outlook.Close Outlook

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date and To address
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST1_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer   To   ${CUST1_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM    ${AGENT5_MAIL}   ${CUST1_EMAIL}    ${SUBJECT_MAIL1}    ${CONTENT_EMAIL1}
    #CustomerHistorySearch.Verify Customer History Search    EM    WS_WC1@acc7dc.com    ${CUST1_EMAIL}    Password Reminder    Find below your login details for our web portal.

#=======================================================================================================================

#Created date:     /02/2021
CC19923 081 Search an email or webchat customer in customer history by Date, Customer email and Subject
    [Setup]     Run Keywords
    #   Login blended agent 1 to workspaces, start work and go ready
    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
    ...     Login.Activate Agent    AND
    ...     AgentToolbar.Agent Start Work   AND
    ...     AgentToolbar.Agent Go Ready     AND
    ...     Sleep   1
    [Teardown]    Run Keywords
    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
    ...    WorkCard.Agent End Any Inbound Contact      AND
    ...    AgentToolbar.Agent Finish Work   AND
    ...    AgentToolbar.Agent Exit      AND
    ...    Close All Browsers

    # STEP 1:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
    Outlook.Open Outlook
    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
    Outlook.Choose Account     ${CUST2_EMAIL}
    Outlook.Send Email
    Sleep   20
    Outlook.Close Outlook

    # STEP 2:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
    Sleep   1
    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
#    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
    Sleep   3

    # STEP 3:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Agent ends Email contact
    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}

    # STEP 4:
    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify can search an email contact in customer history by Date, Email and Subject
    Sleep   5
    NavigationMenu.Open Customer Search
    Sleep   2
    CustomerHistorySearch.Search Customer   Date   ${CUST2_EMAIL}
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Subject    THIS IS MAIL FROM OANH_CUSTOMER
    Click Element    ${LOC_CUSTOMER_HISTORY_BTN_ADD_MORE_SEARCH_PARAMETER}
    Sleep   1
    CustomerHistorySearch.Search Customer    Email    ${CUST2_EMAIL}
    CustomerHistorySearch.Verify Customer History Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================

#=======================================================================================================================










##Created date:     /02/2021
#CC19923 003 Customer email or chat will be created successfully when a customer email or webchat sends to agent
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email With Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}      ${ATTACH_LINK_1}
#    Outlook.Choose Account     ${CUST2_EMAIL}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    WorkCard.Agent Accepts A Contact     ${CUST2_NAME}      #${CUST2_EMAIL}
#    Sleep   1
#    WidgetEmail.Verify Email Attachment     ${CUST2_NAME}   ${ATTACHMENT_NAME1}
##    WidgetEmail.Verify Email Attachment     ${CUST2_EMAIL}   ${ATTACHMENT_NAME1}
#    Sleep   3
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST2_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    EM   ${CUST2_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
#    WorkCard.Agent Ends A Contact     ${CUST2_NAME}     #${CUST2_EMAIL}
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
#    Sleep   7
#
#    # STEP 6:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
#    Sleep   3
#    # Agent sends Message to Customer
#    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
##    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
#    Sleep   5
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent
#
#    # STEP 7:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
#    Sleep   5
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
##    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues
#
#    # STEP 8:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   3
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
#    Sleep   2
#
#    # STEP 9:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent
#
##=======================================================================================================================
#
##=======================================================================================================================
#
##Created date:     /02/2021
#CC19923 009 Search a email or webchat customer in customer search on voice only agent.
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT1_USERNAME}    ${AGENT1_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    NavigationMenu.Open Customer Search
#    Sleep   1
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Verify that cannot search customer on voice only agent
#    Wait Until Element Is Visible    //div[@class='widget__content']//div[contains(@class,'empty')]     20
#
##=======================================================================================================================
#
##Created date:     /02/2021
#CC19923 010 Search a email or webchat customer in customer search on MM only agent
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT5_USERNAME}    ${AGENT5_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
#    [Teardown]    Run Keywords
#    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
#    ...    WorkCard.Agent End Any Inbound Contact      AND
#    ...    AgentToolbar.Agent Finish Work   AND
#    ...    AgentToolbar.Agent Exit      AND
#    ...    Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email Without Attachment  ${AGENT5_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}      #${CUST1_EMAIL}
#    Sleep   1
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    EM   ${CUST1_EMAIL}    ${AGENT5_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST2_EMAIL}
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
#    Sleep   7
#
#    # STEP 6:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
#    Sleep   3
#    # Agent sends Message to Customer
#    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
##    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
#    Sleep   5
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Verify Message On Customer Chat     ${AGENT5_FIRSTNAME}     Hello Customer, I'm Agent
#
#    # STEP 7:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
#    Sleep   5
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
##    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues
#
#    # STEP 8:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   3
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
#    Sleep   2
#
#    # STEP 9:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent
#
##=======================================================================================================================
#
##Created date:     /02/2021
#CC19923 011 Search a email or webchat customer in customer search on blend agent
#    [Setup]     Run Keywords
#    #   Login blended agent 1 to workspaces, start work and go ready
#    ...     Login.Login Agent    ${BROWSER_AGENT_1}    ${BROWSER_AGENT_ALIAS_1}    ${AGENT3_USERNAME}    ${AGENT3_PASSWORD}     AND
#    ...     Login.Activate Agent    AND
#    ...     AgentToolbar.Agent Start Work   AND
#    ...     AgentToolbar.Agent Go Ready     AND
#    ...     Sleep   1
##    [Teardown]    Run Keywords
##    ...    Switch Browser    ${BROWSER_AGENT_ALIAS_1}    AND
##    ...    WorkCard.Agent End Any Inbound Contact      AND
##    ...    AgentToolbar.Agent Finish Work   AND
##    ...    AgentToolbar.Agent Exit      AND
##    ...    Close All Browsers
#
#    # STEP 1:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 01    Open Outlook, from customer sent to Server the Email without attachment
#    Outlook.Open Outlook
#    Outlook.Send Email Without Attachment  ${AGENT3_MAIL}     ${SUBJECT_MAIL1}        ${MESSAGE_EMAIL1}
#    Outlook.Send Email
#    Sleep   20
#    Outlook.Close Outlook
#
#    # STEP 2:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 02    Agent accepts Email
#    WorkCard.Agent Accepts A Contact     ${CUST1_NAME}      #${CUST1_EMAIL}
#    Sleep   1
#
#    # STEP 3:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 03    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    EM   ${CUST1_EMAIL}    ${AGENT3_MAIL}    ${SUBJECT_MAIL1}    ${MESSAGE_EMAIL1}
#
#    # STEP 4:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 04    Agent ends Email contact
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}     #${CUST2_EMAIL}
#
#    # STEP 5:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 05    Customer launchs a session chat and send it to agent
#    WebChat.Open Browser To Webchat Page    ${BROWSER_CUST_1}    ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Init A Chat Session     ${CUST1_INFO}    ${EMAIL_CHATSCRIPT_NO}    ${AGENT3_SKILLSET_WC}
#    Sleep   7
#
#    # STEP 6:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 06    Switch to agent's browser and Agent accepts WC and chat with Customer
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   1
#    WorkCard.Agent Accepts A Contact    ${CUST1_NAME}   #${CUST1_EMAIL}
#    Sleep   3
#    # Agent sends Message to Customer
#    WorkCard.Agent sends Message to Customer    ${CUST1_NAME}   Hello Customer, I'm Agent
##    WorkCard.Agent sends Message to Customer    ${CUST1_EMAIL}   Hello Customer, I'm Agent
#    Sleep   5
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Verify Message On Customer Chat     ${AGENT3_FIRSTNAME}     Hello Customer, I'm Agent
#
#    # STEP 7:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 07     Customer send chat to Agent and verify this message display on Agent chat
#    Switch Browser      ${BROWSER_CUST_ALIAS_1}
#    WebChat.Customer Sends Message To Agent     Hi Agent, I have some Issues
#    Sleep   5
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    WorkCard.Verify Message On Agent Chat    ${CUST1_NAME}   Hi Agent, I have some Issues
##    WorkCard.Verify Message On Agent Chat    ${CUST1_EMAIL}   Hi Agent, I have some Issues
#
#    # STEP 8:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 08    Agent ends webchat session
#    Switch Browser      ${BROWSER_AGENT_ALIAS_1}
#    Sleep   3
#    WorkCard.Agent Ends A Contact     ${CUST1_NAME}    #${CUST1_EMAIL}
#    Sleep   2
#
#    # STEP 9:
#    Utils.TEST CASE HAS RUN INTO STEP    STEP 9    Verify Email Template can be search in Customer Search
#    Sleep   5
#    NavigationMenu.Open Customer Search
#    Sleep   2
#    CustomerHistorySearch.Search Customer   Email   ${CUST1_EMAIL}
#    CustomerHistorySearch.Verify Customer Search    WC   ${CUST1_EMAIL}    ${CUST1_NAME}    ${EMPTY}    Hello Customer, I'm Agent
