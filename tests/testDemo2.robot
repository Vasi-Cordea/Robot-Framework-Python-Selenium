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
   
*** Keywords ***

open browser URL
      Log To Console  open browser for invalid pass test
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
    Wait Until Element Is Visible     //ul[@id='main_menu_top']//span[contains(@class,'menu_text')][normalize-space()='Specials']
     click element    //ul[@id='main_menu_top']//span[contains(@class,'menu_text')][normalize-space()='Specials']

wait until elements are visible on page
  [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}