*** Settings ***

Documentation     Are source file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${username}     valenciano
${password}     @1234p
${invalidPassword}     @1234T
${url}    https://automationteststore.com/
${element}   //a[normalize-space()='Flash Bronzer Body Gel']

*** Keywords ***
Close Browser session
    Close Browser


