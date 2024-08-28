*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
LoginTest
    Open Browser         https://demo.nopcommerce.com/    chrome
    click link    xpath://a[@class='ico-login']
    input text     id:Email pavanoltraining@{gmail.com
    input text    id: Pasword Test@123
    click element xpath://input[@class='button-1 login-button']
    Close Browser

*** Keywords ***


