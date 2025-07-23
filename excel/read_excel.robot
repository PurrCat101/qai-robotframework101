*** Settings ***
Library    RPA.Excel.Files

*** Test Cases ***
Read And Log Excel Data
    Open Workbook    excel/mock_data.xlsx
    ${rows}=    Read Worksheet    header=True
    Log To Console   ${rows}
    Close Workbook
