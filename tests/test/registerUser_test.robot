*** Settings ***
Documentation    Test de registro de usuario automatizado con Robot Framework y Selenium
Library    SeleniumLibrary
Resource    ../resources/registerUser_keywords.robot

*** Variables ***

*** Test Cases ***
Registrar Usuario
    [Documentation]    Verifica el registro exitoso de un usuario
    Abrir navegador
    Ir a página de registro
    Registrar Usuario
    Verificar Registro Exitoso
    Cerrar navegador
