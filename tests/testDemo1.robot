*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary    
#//FIX NEEDED: options.add_argument("--disable-search-engine-choice-screen")

*** Variables ***

*** Test Cases ***
LoginTest
    open browser 
    fill login details
Validate unsuccesful Login
       open browser
       fill with invalid login details
       wait until it cheacks and display error message
       verify error message is correct

*** Keywords ***
open browser 
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
    Click Button  xpath: //*[@id="loginFrm"]/fieldset/button

verify error message is correct
    ${result}Get Text    xpath: //div[@class='alert alert-error alert-danger']
    
    Error: Incorrect login or password provided.