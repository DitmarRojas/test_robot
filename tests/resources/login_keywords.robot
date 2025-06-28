*** Settings ***
Documentation     Test de login automatizado con Robot Framework y Selenium
Library    SeleniumLibrary
Resource    ../variables/variables.robot

*** Variables ***

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}    Chrome
    Sleep    ${DELAY3}
    Maximize Browser Window

Cerrar navegador
    Close Browser

Ir a la pagina de login
    [Documentation]    Navega a la página de login del sistema
    Go To    ${URL}
    Sleep    ${DELAY3}

Ingresar Credenciales Administrador
    [Documentation]    Ingresa las credenciales del administrador para verificar el login exitoso
    Wait Until Page Contains Element    name=email
    Input Text    name=email    ${EMAIL}
    Sleep    ${DELAY3}
    Input Text    name=password    ${PASSWORD}
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div/form/button
    Sleep    ${DELAY3}
Verificar Login Exitoso Administrador
    Wait Until Page Contains Element    xpath=/html/body/div[2]/div/main/div[1]/h1
Ingresar Credenciales Usuario Normal
    [Documentation]    Ingresa las credenciales de un usuario normal para verificar el login exitoso
    Wait Until Page Contains Element    name=email
    Input Text    name=email    ${EMAIL_NORMAL}
    Sleep    ${DELAY3}
    Input Text    name=password    ${PASSWORD_NORMAL}
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div/form/button
    Sleep    ${DELAY3}
Verificar Login Exitoso Usuario Normal
    Wait Until Page Contains Element    xpath=/html/body/div[1]/div[1]/div[2]/div/div[1]/h5
Ingresar Credenciales Invalidas
    [Documentation]    Ingresa credenciales invalidas para verificar que no ingresa al sistema
    Wait Until Page Contains Element    name=email
    Input Text    name=email    ${EMAIL_INVALIDO}
    Sleep    ${DELAY3}
    Input Text    name=password    ${PASSWORD_INVALIDO}
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div/form/button
    Sleep    ${DELAY3}
Verificar Error Exitoso
    Wait Until Page Contains Element    xpath=/html/body/div/form/div[4]/div/span