*** Settings ***
Library    DateTime
Library    OperatingSystem

*** Keywords ***
Get First Day Of Current Month In Berlin
    [Documentation]    Returns the first day of the current month formatted as %Y-%m-%dT%H:%M:%SZ
    ${first_day}=    Get Current Date    result_format=%Y-%m-01T00:00:00z
    Set Variable    ${first_day}    # Store the value for later use
    RETURN    ${first_day}    # Return the value to the calling test case

Get First Day Of Next Month In Berlin
    [Documentation]    Returns the first day of the next month formatted as %Y-%m-%dT00:00:00z
    ${current_date}=    Get Current Date    result_format=%Y-%m-%d
    ${day_of_month}=    Evaluate    datetime.datetime.strptime('${current_date}', '%Y-%m-%d').day
    ${increment_days}=  Evaluate    32 if ${day_of_month} < 25 else 20
    ${next_month}=      Evaluate    (datetime.datetime.strptime('${current_date}', '%Y-%m-%d') + datetime.timedelta(days=${increment_days})).replace(day=1).strftime('%Y-%m-%dT00:00:00z')
    Set Variable        ${next_month}
    RETURN             ${next_month}

Get First Day Of Next Month to January In Berlin
    [Documentation]    Returns the first day of next month (February) formatted as %Y-%m-%dT00:00:00z
    ${current_date}=    Set Variable    2025-01-31  # test edge case where month of feb has less days
    ${day_of_month}=    Evaluate    datetime.datetime.strptime('${current_date}', '%Y-%m-%d').day
    ${increment_days}=  Evaluate    32 if ${day_of_month} < 25 else 20
    ${next_month}=      Evaluate    (datetime.datetime.strptime('${current_date}', '%Y-%m-%d') + datetime.timedelta(days=${increment_days})).replace(day=1).strftime('%Y-%m-%dT00:00:00z')
    Set Variable        ${next_month}
    RETURN            ${next_month}

*** Test Cases ***
Test Get First Day Of Current Month In Berlin
    ${validFrom}=    Get First Day Of Current Month In Berlin
    Log    ${validFrom}

Get First Day Of Next Month In Berlin
    ${validFrom}=    Get First Day Of Next Month In Berlin
    Log    ${validFrom}
Get First Day Of Next Month to January In Berlin
    ${validFrom}=    Get First Day Of Next Month to January In Berlin

    Log    ${validFrom}