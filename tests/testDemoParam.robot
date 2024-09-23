*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary    
#//FIX NEEDED: options.add_argument("--disable-search-engine-choice-screen")
Test Teardown     Close Browser
Test Template    Login

*** Variables ***
${error_message_login}     xpath: //div[@class='alert alert-error alert-danger']

*** Test Cases ***    username        password
Invalid username        vacic           @1234p
invalid password        valenciano     aaaaaaaa
special characters      @#assd         %&@aaa

Valid Login Test
    Login


*** Keywords ***


Login
    [Arguments]    ${username}     ${passsword}
      Log To Console  open browser for invalid pass test
  Open Browser         https://automationteststore.com/    chrome
    #Set Browser Implicit Wait    9000

    Wait Until Element Is Visible      id: customer_menu_top
     click element    id: customer_menu_top
    input text     id:loginFrm_loginname     valenciano
    input text    id:loginFrm_password   @1234p
    Click Button  xpath: //*[@id="loginFrm"]/fieldset/button
    Close Browser

