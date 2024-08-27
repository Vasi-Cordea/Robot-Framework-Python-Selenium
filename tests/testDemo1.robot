*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary

*** Test Cases ***
Validate Succesful Login
    open the browser payment url
    fill the login Form
    wait until it checks and display error message
    verify error message is correct

    *** Keywords ***
      open the browser payment url