*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${VALID_USERNAME}    Admin
${VALID_PASSWORD}    admin123
${INVALID_USERNAME}  lethuy1308
${INVALID_PASSWORD}  bat3glen

*** Test Cases ***
Login Với Thông Tin Hợp Lệ
    [Documentation]    Kiểm tra đăng nhập thành công với thông tin hợp lệ
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']    timeout=20
    Input Text    xpath=//input[@name='username']    ${VALID_USERNAME}
    Input Text    xpath=//input[@name='password']    ${VALID_PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    timeout=10
    Page Should Contain Element      xpath=//h6[text()='Dashboard']
    Log To Console    Đăng nhập hợp lệ thành công
    Close Browser

Login Với Mật Khẩu Không Hợp Lệ
    [Documentation]    Kiểm tra đăng nhập thất bại với mật khẩu sai
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']    timeout=20
    Input Text    xpath=//input[@name='username']    ${INVALID_USERNAME}
    Input Text    xpath=//input[@name='password']    ${INVALID_PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Contains     xpath=//p[contains(@class,'oxd-alert-content-text')]    Invalid credentials    timeout=10
    Page Should Contain Element     xpath=//p[contains(@class,'oxd-alert-content-text')]
    Log To Console     Đăng nhập thất bại với mật khẩu sai
    Close Browser

