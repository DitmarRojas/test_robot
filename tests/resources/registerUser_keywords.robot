*** Settings ***
Documentation    Test de registro de usuario automatizado con Robot Framework y Selenium
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
Ir a página de registro
    Go To    ${URL}
    Sleep    ${DELAY3}
    Click Link    xpath=/html/body/div/form/div[3]/a
    Sleep    ${DELAY3}
    Wait Until Page Contains Element    name=nombre
Registrar Usuario
    [Documentation]    Completa el formulario de registro y envíalo
    Input Text    name=nombre    Ale
    Sleep    ${DELAY1}
    Input Text    name=apellido    Ricaldez
    Sleep    ${DELAY1}
    Input Text    name=email    ale1@example.com
    Sleep    ${DELAY1}
    Input Text    name=password    password123
    Sleep    ${DELAY1}
    Input Text    name=confirm_password    password123
    Sleep    ${DELAY1}
    Click Button    xpath=/html/body/div/form/button
    Sleep    ${DELAY3}
Verificar Registro Exitoso
    [Documentation]    Verifica que el registro fue exitoso
    Wait Until Page Contains Element    xpath=/html/body/div/div[2]/div/span