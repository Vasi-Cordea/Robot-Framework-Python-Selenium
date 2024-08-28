*** Settings ***

Documentation     Are source file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${username}     valenciano
${password}     @1234p
${url}    https://automationteststore.com/

*** Keywords ***
Close Browser session
    Close Browser


