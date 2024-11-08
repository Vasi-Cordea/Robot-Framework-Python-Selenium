*** Settings ***
Library     Collections
Library           RequestsLibrary
Library     SeleniumLibrary
*** Variables ***

${BASE_URL}       https://pokeapi.co/api/v2
${POKEMON}        ditto

*** Test Cases ***
Get_test

   ${response}     GET        ${BASE_URL} /pokemon/pikachu

  log to console    ${response.status_code}

Get Pokemon Details
    Create Session    pokeapi1    ${BASE_URL}
    ${response}=      Get Request    pokeapi1    /pokemon/${POKEMON}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}


