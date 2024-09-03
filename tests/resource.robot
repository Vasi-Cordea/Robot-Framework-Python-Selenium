*** Settings ***

Documentation     Are source file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${username}     valenciano
${password}     @1234p
${invalidPassword}     @1234T
${url}    https://automationteststore.com/
${element}   //a[normalize-space()='Flash Bronzer Body Gel']
${flashB element}     //ul[@id='main_menu_top']//span[contains(@class,'menu_text')][normalize-space()='Specials']

*** Keywords ***
Close Browser session
    Close Browser


