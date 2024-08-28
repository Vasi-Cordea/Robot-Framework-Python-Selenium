*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary    
#//FIX NEEDED: options.add_argument("--disable-search-engine-choice-screen")
Test Setup        open browser URL
Test Teardown     Close Browser
Resource         resource.robot

*** Variables ***
${error_message_login}     xpath: //div[@class='alert alert-error alert-danger']

*** Test Cases ***
Valid Login Test

    fill login details

*** Keywords ***

open browser URL
      Log To Console  open browser for invalid pass test
  Open Browser         https://automationteststore.com/    chrome
    #Set Browser Implicit Wait    9000
fill login details
    Wait Until Element Is Visible      id: customer_menu_top
     click element    id: customer_menu_top
    input text     id:loginFrm_loginname     valenciano
    input text    id:loginFrm_password   @1234p
    Click Button  xpath: //*[@id="loginFrm"]/fieldset/button


