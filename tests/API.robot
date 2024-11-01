*** Settings ***
Library     Collections
Library           RequestsLibrary
Library     SeleniumLibrary
*** Variables ***

${BASE_URL} =      https://pokeapi.co/api/v2
${POKEMON}        ditto
${POKEMONS}       bulbasaur, charmander, squirtle

*** Test Cases ***
Get_test

   ${response}     GET        ${BASE_URL} /pokemon/pikachu

  log to console    ${response.status_code}

Get Pokemon Details
    Create Session    pokeapi    ${BASE_URL}
    ${response}=      Get Request    pokeapi    /pokemon/${POKEMON}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}
Get Multiple Pokemon Details
    Create Session    pokeapi    ${BASE_URL}
    FOR    ${pokemon}    IN    @{POKEMONS}
        ${response}=    Get Request    pokeapi    /pokemon/${pokemon}
        Should Be Equal As Strings    ${response.status_code}    200
        ${json}=        Evaluate    ${response.json()}    json
        Log    Name: ${json['name']}
        Log    Height: ${json['height']}
        Log    Weight: ${json['weight']}
        Should Be True    ${json['base_experience']} > 0
    END


