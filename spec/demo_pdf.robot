*** Settings ***
Documentation     Example for file reader
Library           Collections
Library           ../src/PdfLibrary.py

*** Variables ***
${PDF}              ${CURDIR}/../data/resume.pdf
${ENCRYPTED_PDF}    ${CURDIR}/../data/encrypted_resume.pdf

*** Test Cases ***

Verify that library can read email
  ${actual_text}=    read_page    ${PDF}

  ${expected_text}=    Set Variable    yourname@gmail.com

  #assertion
  Should Contain    ${actual_text}    ${expected_text}


Verify that library can read from a page
  ${actual_text}=    read_page    ${PDF}    2

  ${expected_text}=    Set Variable    Studied abroad for 6 weeks in Costa Rica

  #assertion
  Should Contain    ${actual_text}    ${expected_text}


Verify that library can read from an encrypted page
  ${actual_text}=    read_page    ${ENCRYPTED_PDF}    2    key

  ${expected_text}=    Set Variable    Studied abroad for 6 weeks in Costa Rica

  #assertion
  Should Contain    ${actual_text}    ${expected_text}
