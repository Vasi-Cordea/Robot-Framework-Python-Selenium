*** Settings ***
Library    DateTime
Library    OperatingSystem
Library    Collections

*** Keywords ***
Get First Day Of Current Month In Berlin
    [Documentation]    Returns the first day of the current month in Berlin time zone formatted as %Y-%m-%dT%H:%M:%SZ
    ${first_day}=    Evaluate    datetime.datetime.now(pytz.timezone('Europe/Berlin')).replace(day=1, hour=0, minute=0, second=0, microsecond=0).strftime('%Y-%m-%dT%H:%M:%SZ')    modules=datetime,pytz
    RETURN    ${first_day}

Get First Day Of Next Month In Berlin
    [Documentation]    Returns the first day of the next month in Berlin time zone formatted as %Y-%m-%dT%H:%M:%SZ
    ${current_date}=    Evaluate    datetime.datetime.now(pytz.timezone('Europe/Berlin'))    modules=datetime,pytz
    ${year}=            Set Variable    ${current_date.year}
    ${month}=           Set Variable    ${current_date.month}
    ${next_month_date}= Evaluate    datetime.datetime(${year} + (1 if ${month} == 12 else 0), (${month} % 12) + 1, 1, tzinfo=pytz.timezone('Europe/Berlin')).strftime('%Y-%m-%dT%H:%M:%SZ')    modules=datetime,pytz
    RETURN              ${next_month_date}

Get First Day Of Next Month to January In Berlin
    [Documentation]    Returns the first day of next month (February) in Berlin time zone formatted as %Y-%m-%dT%H:%M:%SZ
    ${current_date}=    Set Variable    2025-01-31
    ${current_date_dt}= Evaluate    datetime.datetime.strptime('${current_date}', '%Y-%m-%d').replace(tzinfo=pytz.timezone('Europe/Berlin'))    modules=datetime,pytz
    ${year}=            Set Variable    ${current_date_dt.year}
    ${month}=           Set Variable    ${current_date_dt.month}
    ${next_month_date}= Evaluate    datetime.datetime(${year} + (1 if ${month} == 12 else 0), (${month} % 12) + 1, 1, tzinfo=${current_date_dt}.tzinfo).strftime('%Y-%m-%dT%H:%M:%SZ')    modules=datetime,pytz
    RETURN              ${next_month_date}

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

    robot ./tests/BerlinTZ.robot
