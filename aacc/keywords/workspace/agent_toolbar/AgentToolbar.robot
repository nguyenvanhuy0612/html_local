*** Settings ***
Resource   ../../../resources/SystemResources.robot
Variables        AgentToolbarLocator.py
Variables        ../login/LoginLocator.py
#Variables        AgentToolbarConstant.py
#Variables        ../login/LoginConstant.py
#Library          Selenium2Library
#Library          ../../base_module/BaseKeyword.py
#Library     BuiltIn
#Library     Calculator


*** Keywords ***


Agent Start Work
    Wait Until Element Is Visible    ${LOC_AGENT_STATE}    timeout=20s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep   3s
    ${start_work_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    timeout=30s
    Run Keyword If    '${start_work_status}'=='True'    Click Element    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}
    # Verify Workspaces starts work successfully
    Sleep    10s

#    Verify NRD


Agent Go Ready

#    ${home_dropdow_menu}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=30s
#    Run Keyword If    '${home_dropdow_menu}'=='True'    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
#    Sleep   1
#    ${go_ready_status}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_READY}    timeout=30s
#    Run Keyword If    '${go_ready_status}'=='True'    Click Element    ${LOC_AGENT_TOOLBAR_BTN_READY}
#    # Close dropdown menu
#    Run Keyword If    '${go_ready_status}'=='False'    Double Click Element     ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep   2
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_READY}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_READY}
    Sleep    3
    ${get_status} =     Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    title
    Should Be Equal     ${get_status}   Ready
    Sleep   1
#    Verify Ready
#    Sleep   2

Agent Go Not Ready
    [Arguments]     ${nrd_code}
    # Open menu contains state of agent
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep   1s
    ${go_not_ready_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_NOT_READY}    timeout=30s

    ${choose_nrd_code} =    String.Replace String   ${LOC_AGENT_TOOLBAR_BTN_NOT_READY_CODE}      ${NOT_READY_CODE}       ${nrd_code}
    # Click on Go Not Ready button
    Run Keyword If    '${go_not_ready_status}'=='True'    Run Keywords    Click Element    ${LOC_AGENT_TOOLBAR_BTN_NOT_READY}    AND
    # choose NRD code
    ...    Wait Until Element Is Visible    ${choose_nrd_code}    timeout=10s    AND
    ...    Click Element    ${choose_nrd_code}
    # Close dropdown menu
    Run Keyword If    '${go_not_ready_status}'=='False'    Double Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}      #${LOC_AGENT_TOOLBAR_BTN_DROP_DOWN_MENU}
    
    # Verify Workspaces goes not ready successfully
    Sleep    5s
    ${toolbar_state}=    Get Element Attribute  ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
    Should Be True    '${toolbar_state}'    Not Ready          #== '${AGENT_TOOLBAR_TXT_NOT_READY_STATE}'
    # Verify NRD Code Should Display Correctly
    Sleep   2

Agent Go ACW
    [Arguments]     ${acw}
    # Open menu contains state of agent
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep   1s
    ${go_acw_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_ACW}    timeout=20s

    ${choose_acw_code} =    String.Replace String   ${LOC_AGENT_TOOLBAR_BTN_ACW_CODE}      ${ACW_CODE}       ${acw}
    # Click on ACW code
    Run Keyword If    '${go_acw_status}'=='True'    Run Keywords    Click Element    ${LOC_AGENT_TOOLBAR_BTN_ACW}    AND
    # choose NRD code
    ...    Wait Until Element Is Visible    ${choose_acw_code}    timeout=10s    AND
    ...    Click Element    ${choose_acw_code}
    # Close dropdown menu
    Run Keyword If    '${go_acw_status}'=='False'    Double Click Element    ${LOC_AGENT_TOOLBAR_BTN_DROP_DOWN_MENU}

    # Verify Workspaces goes not ready successfully
    Sleep    3s
    ${toolbar_state}=    Get Element Attribute  ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
    Should Be True    '${toolbar_state}'       After Contact Work Pending       #== '${AGENT_TOOLBAR_TXT_NOT_READY_STATE}'
    Sleep   2

# Set Finish Work
Agent Finish Work
    # Open menu contains state of agent
    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=20s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s
    # Click Finish Work button
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_FINISH_WORK}    timeout=20s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_FINISH_WORK}
    # Verify Workspaces finishes work successfully
    Sleep    4s
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    timeout=20s
    ${toolbar_state}=    Get Element Attribute    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
    Should Be True    '${toolbar_state}'    Connected       #== '${AGENT_TOOLBAR_TXT_LOG_OUT_STATE}'
    Sleep   2

# Exit from Workspaces
Agent Exit
    # Open menu contains state of agent
    Wait Until Element Is Visible    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    timeout=30s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    1s
    # Click Exit button to exit Workspaces
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_EXIT}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_EXIT}
    # Verify exit successfully
    Wait Until Page Contains Element    ${LOC_WORKSPACE_LABEL_SIGNIN}    180s
        # Verify login page
    ${str_sign_in} =    Get Text    ${LOC_WORKSPACE_LABEL_SIGNIN}
    Should Be Equal    ${str_sign_in}    Login Agent
    Sleep   1

Agent Create Email
    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}    timeout=30s
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_CREATE_EMAIL}
    Sleep   2

Agent Calls Out
    [Arguments]     ${call_out}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_IPT_PHONE}    ${TIMEOUT_MEDIUM}
    Input Text    ${LOC_AGENT_TOOLBAR_IPT_PHONE}      ${call_out}
    Sleep   2
    Click Element    ${LOC_AGENT_TOOLBAR_IPT_PHONE}
    Sleep   1
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_CALL_OUT}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_CALL_OUT}
    Sleep   1
#    Click Element   ${LOC_AGENT_TOOLBAR_BTN_CALL_OUT}
#    Sleep   1

Agent Redial
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_REDIAL}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_REDIAL}
    Sleep   1

Agent Calls Supervisor
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_SUPERVISOR_CALL}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_SUPERVISOR_CALL}
    Sleep   1

# 13/03/2020
#Address Book Call Out
#    [Arguments]     ${agent}
#    # click button phonebook
#    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}    ${TIMEOUT_MEDIUM}
#    Click Element   ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}
#    Sleep   1
#    # search agent
##    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_IPT_PHONEBOOK_SEARCH}    ${TIMEOUT_MEDIUM}
##    Input Text   ${LOC_AGENT_TOOLBAR_IPT_PHONEBOOK_SEARCH}      ${agent}
##    Sleep   1
#    # choose agent then make call out
#    ${loc_choose_agent}=    String.Replace String    ${LOC_AGENT_TOOLBAR_PHONEBOOK_LIST}    ${AGENT_VAR}    ${agent}
#    Wait Until Page Contains Element    ${loc_choose_agent}    ${TIMEOUT_MEDIUM}
#    Click Element   ${loc_choose_agent}
#    Sleep   1
#    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL}    ${TIMEOUT_MEDIUM}
#    Click Element   ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL}
#    Sleep   1

Address Book Call Out
    [Arguments]     ${id}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}    ${TIMEOUT_MEDIUM}
    Click Element   ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK}
    Sleep   1
    ${loc_btn_call_agent} =    String.Replace String    ${LOC_AGENT_TOOLBAR_BTN_PHONEBOOK_CALL}   ${ID_AGENT}    ${id}
    Selenium2Library.Scroll Element Into View   ${loc_btn_call_agent}
    Wait Until Page Contains Element    ${loc_btn_call_agent}    ${TIMEOUT_MEDIUM}
    Set Focus To Element    ${loc_btn_call_agent}
    Click Element    ${loc_btn_call_agent}
    Sleep   1

Verify Start Work Page Should Display Full Name Of Agent
    [Documentation]    Verify Start Work page should display full name of Agent
    [Arguments]     ${agent_username}
    Wait Until Page Contains Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Should Be Equal    ${str_lable_agent}    ${agent_username}

Verify Menu Header Should Display Full Name Of Agent
    [Documentation]    Verify Menu Header should display full name of Agent
    [Arguments]     ${agent_username}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s
    Wait Until Page Contains Element    ${LOC_WORKSPACE_HOME_MENU_HEADER}    ${TIMEOUT_MEDIUM}
    ${str_lable_agent}=   Get Text    ${LOC_WORKSPACE_HOME_MENU_HEADER}
    Should Be Equal    ${str_lable_agent}    ${agent_username}
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep    2s

Verify Agent ID
    [Documentation]    Verify Agent ID Of Agent Should Display Correctly
    [Arguments]     ${agent_ID}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_CARD_AGENT_ID}    ${TIMEOUT_MEDIUM}
    ${agent_ID_on_page}=   Get Text    ${LOC_AGENT_TOOLBAR_CARD_AGENT_ID}
    Should Be Equal    ${agent_ID_on_page}    ${agent_ID}

Verify Station ID
    [Documentation]    Verify Station ID Of Agent Should Display Correctly
    [Arguments]     ${station_ID}
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_CARD_STATION_ID}    ${TIMEOUT_MEDIUM}
    ${station_ID_on_page}=   Get Text    ${LOC_AGENT_TOOLBAR_CARD_STATION_ID}
    Should Be Equal    ${station_ID_on_page}    ${station_ID}

#   04/03/2020
Verify Ready
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Ready

#   07/04/2020
Verify NRD Without RC
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Not Ready

#   04/03/2020
Verify NRD With RC
    [Documentation]    Verify NRD Code Should Display Correctly
    [Arguments]     ${nrd_code}

    # get text of title_nrd_code
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_NRD_CODE}    ${TIMEOUT_MEDIUM}
    ${title_nrd_code} =     Get Text    ${LOC_AGENT_TOOLBAR_TITLE_NRD_CODE}
    # get length of code
    ${len_nfr_code} =   Get Length     ${nrd_code}
    ${len_title_nfr_code} =   Get Length     ${title_nrd_code}
    # position of code
    ${locate} =      Evaluate   ${len_title_nfr_code}-${len_nfr_code}
    ${cut_title_nrd_code} =     Get Substring   ${title_nrd_code}   ${locate}
    ${upper_cut_title_nrd_code} =     Convert To Uppercase    ${cut_title_nrd_code}
    ${upper_nrd_code} =     Convert To Uppercase    ${nrd_code}
    Should Be Equal          ${upper_cut_title_nrd_code}   ${upper_nrd_code}

Verify Not Ready
    [Arguments]     ${nrd_code}=${EMPTY}
    ${workcard_id} =    Run keyword if   '${nrd_code}'=='${EMPTY}'    Verify NRD Without RC
    ...     ELSE    Verify NRD With RC    ${nrd_code}

#   05/03/2020
Verify ACW
    [Documentation]    Verify ACW Code Should Display Correctly
    [Arguments]     ${acw}
    # get text of title_nrd_code
    ${title_acw_code} =     Get Text    ${LOC_AGENT_TOOLBAR_TITLE_NRD_CODE}
    # get length of code
    ${len_acw_code} =   Get Length     ${acw}
    ${len_title_acw_code} =   Get Length     ${title_acw_code}
    # position of code
    ${locate} =      Evaluate   ${len_title_acw_code}-${len_acw_code}
    ${cut_title_acw_code} =     Get Substring   ${title_acw_code}   ${locate}
    ${upper_cut_title_acw_code} =     Convert To Uppercase    ${cut_title_acw_code}
    ${upper_acw_code} =     Convert To Uppercase    ${acw}
    Should Be Equal          ${upper_cut_title_acw_code}   ${upper_acw_code}

#   04/03/2020
Verify Pending NRD
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     Not Ready Pending

#   05/03/2020
Verify Pending ACW
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}    ${TIMEOUT_MEDIUM}
    ${title_footer} =   Get Element Attribute    ${LOC_AGENT_TOOLBAR_TITLE_FOOTER}   title
    Should Be Equal     ${title_footer}     After Contact Work Pending

#   18/03/2020
Verify Reset Timer
    Wait Until Page Contains Element    ${LOC_AGENT_TOOLBAR_TIMER}    ${TIMEOUT_MEDIUM}
    ${get_timer} =   Get Text    ${LOC_AGENT_TOOLBAR_TIMER}
    # get minute
    ${get_minute} =    Get Substring    ${get_timer}      1     3
    Should Be Equal     ${get_minute}   00
    Log To Console      The Minute is reset 00
    # get second
    ${get_second} =    Get Substring    ${get_timer}      4     6
    ${convert_second} =      Convert To Integer     ${get_second}
    ${compare_second} =     Evaluate    ${convert_second} < 8
    ${convert_string_second} =  Convert To String   ${compare_second}
    Should Be Equal     ${convert_string_second}   True
    Log To Console      The Second is reset 00

Verify Start Work Page
    Wait Until Element Is Visible    ${LOC_BTN_START_WORK}    timeout=60s
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    sleep   3s
    ${start_work_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_BTN_START_WORK}    timeout=20s
    Run Keyword If    '${start_work_status}'=='True'    Log To console   Agent finished work
    ...   ELSE   Fail   Agent did not finish work
    Click Element    ${LOC_WORKSPACE_HOME_DROPDOWN_MENU}
    Sleep    1

#Verify Agent Finished Work
#    Sleep    4s
#    Wait Until Element Is Visible    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    timeout=30s
#    ${toolbar_state}=    Get Element Attribute    ${LOC_AGENT_TOOLBAR_TXT_TOOLBAR_STATE}    title
#    Should Be True    '${toolbar_state}'    Connected       #== '${AGENT_TOOLBAR_TXT_LOG_OUT_STATE}'
#    Sleep   2


Verify Missed Contact Is Not Showed On Interaction Log
    [Documentation]    Verify Missed Contact Is Not Showed On Interaction Log
    [Arguments]    ${contact_info}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    0.5s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    0.5s
    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_MISSED_CONTACTS}
    :FOR     ${contact}   IN    @{contacts}
    \    ${wc_title}=    Get Element Attribute    ${contact}    title
    \    Run Keyword If    '${wc_title}'=='${contact_info}'    Fail    Missed contact ${contact_info} is showed on interaction log

# 4/5/2020
Verify Missed Contact
    [Documentation]    Verify Missed Contact Is Showed On Interaction Log
    [Arguments]    ${contact_info}       ${skillset}    ${contact_type}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    1s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    1
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_MISSED}
    ${last_contact_type_missed} =   Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_TYPE_MISSED}   aria-label
    Run Keyword If   '${contact_type}'== 'Webchat'    Should Be Equal    ${last_contact_type_missed}    Missed Chat
    Log To Console   Missed contact type is ${contact_type}
    ${info_last_contact_missed} =    Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_MISSED}   title
    ${skillset_last_contact_missed} =   Get Text     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_SKILL_CONTACT_MISSED}
    Should Be Equal     ${info_last_contact_missed}    ${contact_info}
#    Should Be Equal     ${skillset_last_contact_missed}    ${skillset}
    Log To Console   Missed contact ${contact_info} is showed on interaction log with Skillset ${skillset}

# 4/5/2020
Verify Inbound Contact
    [Documentation]    Verify Missed Contact Is Showed On Interaction Log
    [Arguments]    ${contact_info}       ${skillset}    ${contact_type}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    1s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    1
    Click Element    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_INBOUND}
    ${last_contact_type_inbound} =   Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_TYPE_INBOUND}   aria-label
    Run Keyword If   '${contact_type}'== 'Webchat'    Should Be Equal    ${last_contact_type_inbound}    Incoming Chat
    Log To Console   Inbound contact type is ${contact_type}
    ${info_last_contact_inbound} =    Get Element Attribute   ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_CONTACT_INBOUND}   title
    ${skillset_last_contact_inbound} =   Get Text     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG_LAST_SKILL_CONTACT_INBOUND}
    Should Be Equal     ${info_last_contact_inbound}    ${contact_info}
#    Should Be Equal     ${skillset_last_contact_missed}    ${skillset}
    Log To Console   Inbound contact ${contact_info} is showed on interaction log with Skillset ${skillset}



#Verify Missed Contact
#    [Documentation]    Verify Missed Contact Is Showed On Interaction Log
#    [Arguments]    ${contact_info}
#    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    1s
#    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
#    Sleep    1
#
#    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_MISSED_CONTACTS}
#    :FOR     ${contact}   IN    @{contacts}
#    \    ${wc_title}=    Get Element Attribute    ${contact}    title
#    \    Return From Keyword If    '${wc_title}'=='${contact_info}'
#    Fail    Missed contact ${contact_info} is not showed on interaction log


# Author: Phuc Hoang
# Created Date: 09-Nov-18
Verify Incoming Contact Is Not Showed On Interaction Log
    [Documentation]    Verify Incoming Contact Is Not Showed On Interaction Log
    [Arguments]    ${contact_info}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    0.5s 
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    0.5s
    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_INCOMING_CONTACTS}
    :FOR     ${contact}   IN    @{contacts}
    \    ${wc_title}=    Get Element Attribute    ${contact}    title
    \    Run Keyword If    '${wc_title}'=='${contact_info}'    Fail    Incoming contact ${contact_info} is showed on interaction log
    
Verify Incoming Contact Is Showed On Interaction Log
    [Documentation]    Verify Incoming Contact Is Showed On Interaction Log
    [Arguments]    ${contact_info}
    [Teardown]    Run Keywords     Click Element At Coordinates    ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}    0    0    AND    Sleep    0.5s
    Click Element     ${LOC_AGENT_TOOLBAR_BTN_INTERACTION_LOG}
    Sleep    0.5s
    @{contacts}=    Get WebElements    ${LOC_AGENT_TOOLBAR_TABLE_INTERACTION_LOG_TAB_ALL_LIST_INCOMING_CONTACTS}
    :FOR     ${contact}   IN    @{contacts}
    \    ${wc_title}=    Get Element Attribute    ${contact}    title
    \    Return From Keyword If    '${wc_title}'=='${contact_info}'
    Fail    Incoming contact ${contact_info} is not showed on interaction log