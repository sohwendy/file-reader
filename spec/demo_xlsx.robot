*** Settings ***
Documentation     Example for xlsx reader
Library           Collections
Library           ../src/XlsxLibrary.py

*** Variables ***
${FRUIT_XLSX}    ${CURDIR}/../data/fruit.xlsx
${EMPTY_XLSX}    ${CURDIR}/../data/empty.xlsx


&{HEADER}   no=No    fruit=Fruit   price=Price    country=Country
&{APPLE_RECORD}    no=1    fruit=Apple    price=10.00    country=Japan
&{ORANGE_RECORD}   country=America    price=2.00    fruit=Orange    no=2
&{DURIAN_RECORD}   country=Malaysia    price=15.00    fruit=Durian    no=3

&{APPLE_RECORD_SHORT}    price=10.00    fruit=Apple
&{ORANGE_RECORD_SHORT}   price=2.00    fruit=Orange
&{DURIAN_RECORD_SHORT}   price=15.00    fruit=Durian

@{APPLE_ROW}     1    Apple     Japan       10.00
@{ORANGE_ROW}    2    Orange    America     2.00
@{DURIAN_ROW}    3    Durian    Malaysia    15.00

*** Test Cases ***
Verify that library can read all records in xlsx
  ${dictionary}=    Create Dictionary    A=no    B=fruit    C=country    D=price
  ${actual_record}=    read_multiple_records    ${FRUIT_XLSX}    ${dictionary}

  ${expected_record}=    Create List    ${APPLE_RECORD}
  Append To List    ${expected_record}    ${ORANGE_RECORD}
  Append To List    ${expected_record}    ${DURIAN_RECORD}

  #assertion
  Lists Should Be Equal    ${actual_record}    ${expected_record}


Verify that library can read all records and header in xlsx
  ${dictionary}=    Create Dictionary    A=no    B=fruit    C=country    D=price
  ${actual_record}=    read_multiple_records    ${FRUIT_XLSX}    ${dictionary}    ${FALSE}

  ${expected_record}=    Create List    ${HEADER}
  Append To List    ${expected_record}    ${APPLE_RECORD}
  Append To List    ${expected_record}    ${ORANGE_RECORD}
  Append To List    ${expected_record}    ${DURIAN_RECORD}

  #assertion
  Lists Should Be Equal    ${actual_record}    ${expected_record}


Verify that library can read the first record in xlsx
  ${dictionary}=    Create Dictionary    A=no    B=fruit    C=country    D=price
  ${actual_record}=    read_single_record    ${FRUIT_XLSX}    ${dictionary}

  ${expected_record}=    Create List    ${HEADER}

  #assertion
  Lists Should Be Equal    ${actual_record}    ${expected_record}


Verify that library can read any record in xlsx
  ${dictionary}=    Create Dictionary    A=no    B=fruit    C=country    D=price
  ${actual_record}=    read_single_record    ${FRUIT_XLSX}    ${dictionary}    3

  ${expected_record}=    Create List    ${ORANGE_RECORD}

  #assertion
  Lists Should Be Equal    ${actual_record}    ${expected_record}


Verify that library can read multiple records from xlsx
  ${dictionary}=    Create Dictionary    B=fruit    D=price
  ${actual_record}=    read_multiple_records    ${FRUIT_XLSX}    ${dictionary}

  ${expected_record}=    Create List    ${APPLE_RECORD_SHORT}
  Append To List    ${expected_record}    ${ORANGE_RECORD_SHORT}
  Append To List    ${expected_record}    ${DURIAN_RECORD_SHORT}

  #assertion
  Lists Should Be Equal    ${actual_record}    ${expected_record}


Verify that library can read single row from xlsx
  ${dictionary}=    Create Dictionary    A=no    B=fruit    C=country    D=price
  ${actual_list}=    read_single_row    ${FRUIT_XLSX}    ${dictionary}    4

  Set Test Variable    ${expected_list}    ${DURIAN_ROW}

  #assertion
  Lists Should Be Equal    ${actual_list}    ${expected_list}


Verify that library returns empty list from empty xlxs for read_multiple_records
  ${dictionary}=    Create Dictionary    B=fruit    D=price
  ${actual_record}=    read_multiple_records    ${EMPTY_XLSX}    ${dictionary}

  ${expected_record}=    Create List

  #assertion
  Lists Should Be Equal    ${actual_record}    ${expected_record}


Verify that library returns empty list from empty xlxs for read_single_record
  ${dictionary}=    Create Dictionary    B=fruit    D=price
  ${actual_record}=    read_single_record    ${EMPTY_XLSX}    ${dictionary}    3    ${FALSE}

  ${expected_record}=    Create List

  #assertion
  Lists Should Be Equal    ${actual_record}    ${expected_record}


Example on reading record(s)
  ${list}=    Create List    ${ORANGE_RECORD}
  Append To List    ${list}    ${APPLE_RECORD}
  Append To List    ${list}    ${DURIAN_RECORD}

  #Get Item
  ${orange}=    Get From List    ${list}    0
  Dictionaries Should Be Equal    ${orange}    ${ORANGE_RECORD}

  #Get Value
  ${country}=    Get From Dictionary    ${orange}    country
  Should Be Equal    ${country}    America


Example on reading row(s)
  Set Test Variable    ${orange}    ${ORANGE_ROW}

  #Assertions for Attribute
  ${no}=    Get From List    ${orange}    0
  Should Be Equal    ${no}    2

  ${fruit}=    Get From List    ${orange}    1
  Should Be Equal    ${fruit}    Orange

  ${country}=    Get From List    ${orange}    2
  Should Be Equal    ${country}    America

  ${price}=    Get From List    ${orange}    3
  Should Be Equal    ${price}    2.00
