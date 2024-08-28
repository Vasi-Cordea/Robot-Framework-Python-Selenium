*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary    
#//FIX NEEDED: options.add_argument("--disable-search-engine-choice-screen")

*** Variables ***

*** Test Cases ***
# LoginTest
    #open browser
   #  fill login details
Validate unsuccesful Login
       open browser1
       fill with invalid login details
       wait until it checks and display error message
       verify error message is correct

*** Keywords ***
open browser1
      Log To Console  open browser for invalid pass test
  Open Browser         https://automationteststore.com/    chrome
    #Set Browser Implicit Wait    9000
fill login details
    Wait Until Element Is Visible      id: customer_menu_top
     click element    id: customer_menu_top
    input text     id:loginFrm_loginname     valenciano
    input text    id:loginFrm_password   @1234p
    Click Button  xpath: //*[@id="loginFrm"]/fieldset/button
    Close Browser

fill with invalid login details
     Wait Until Element Is Visible      id: customer_menu_top
     click element    id: customer_menu_top
    input text     id:loginFrm_loginname     valenciano
    input text    id:loginFrm_password   @1234T
      Set Browser Implicit Wait    9000
    Click Button  xpath: //*[@id="loginFrm"]/fieldset/button

wait until it checks and display error message
      Wait Until Element Is Visible     xpath: //div[@class='alert alert-error alert-danger']

verify error message is correct
    ${result}= Get Text    xpath: //div[@class='alert alert-error alert-danger']
    Log To Console      ${result}
    Should Be Equal As Strings       ${result}     Error: Incorrect login or password provided.
   