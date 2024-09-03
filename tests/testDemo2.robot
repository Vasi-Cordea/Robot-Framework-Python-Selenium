*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary    
#//FIX NEEDED: options.add_argument("--disable-search-engine-choice-screen")
Test Setup        open browser URL
Test Teardown    Close Browser session
Resource         resource.robot

*** Variables ***
${error_message_login}     xpath: //div[@class='alert alert-error alert-danger']

*** Test Cases ***
Valid Login Test

    fill login details

Validate unsuccessful Login

       fill login details    ${username}    ${invalidPassword}

Validate Special items are displayed in Shopping Page

    fill login details      ${username}     ${password}
 #    wait 90 sec for further instruction
    open special items page
    wait until elements are visible on page    ${element}
   # Verify items title in the Shopp page
    Select an item from list
   
*** Keywords ***

open browser URL
      Log To Console    open browser for invalid pass test
  Open Browser         ${url}    chrome
    #Set Browser Implicit Wait    9000

fill login details
    [Arguments]     ${username}    ${password}
    Wait Until Element Is Visible      id: customer_menu_top
     click element    id: customer_menu_top
    input text     id:loginFrm_loginname    ${username}
    input text    id:loginFrm_password   ${password}
    Click Button  xpath: //*[@id="loginFrm"]/fieldset/button

wait 90 sec for further instruction
    Set Browser Implicit Wait    90000

open special items page
    Wait Until Element Is Visible    ${flashB element}
     click element    ${flashB element} 

wait until elements are visible on page
  [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify items title in the Shopp page
    @{expectedList} =    Create List    FlashBronzer   Element2    Element3    AbsoluteEye     AcquaDiGio    Element6    Element7    OkOneSummer
    ${elements} =    Get WebElements    css:.prdocutname
    @{actualList} =    Create List

    FOR   ${elements}    IN    @{elements}
         ${element.text}
         Log    ${element.text}
         Append To List    @{actualList}     ${element.text}

    END
    Lists Should Be Equal       @{expectedList}      @{actualList}

Select an item from list
    [Arguments]    ${cardName}
     @{elements} =    Get WebElements    css:.prdocutname
     ${index}= Set Variable 1
      FOR   ${elements}    IN    @{elements}
        Exit For Loop If    ${cardName} == ${element.text}
       
              ${index}=         ${index} + 1

    END
    Lists Should Be Equal       @{expectedList}      @{actualList}
     