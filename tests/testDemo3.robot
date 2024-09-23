*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary    
#//FIX NEEDED: options.add_argument("--disable-search-engine-choice-screen")
Test Setup        open browser URL
Test Teardown    Close Browser session
Resource         resource.robot

*** Variables ***


*** Test Cases ***


Validate child window Functionality

    fill login details      ${username}     ${password}
 #    wait 90 sec for further instruction
    open special items page
    wait until elements are visible on page    ${element}
   # Verify items title in the Shopp page
    Select an item from list
   
*** Keywords ***


     