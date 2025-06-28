*** Settings ***
Documentation    Test vocacional de Selenium automatizado con Robot Framework
Library    SeleniumLibrary
Resource    ../resources/testVocacional_keywords.robot

*** Variables ***

*** Test Cases ***
Crear Test Vocacional
    [Documentation]    Verifica la creación de un test vocacional exitoso
    Abrir navegador
    Ingresar Credenciales Administrador
    Verificar Login Exitoso Administrador
    Ir a la pagina de test vocacional
    Crear nuevo test vocacional
    Ir a asignar preguntas
    Asignar preguntas al test vocacional
    Ir a la pagina de test vocacional
    Editar test vocacional
    Verificar que el test vocacional fue editado
    Buscar Test Vocacional Automatizado Editado
    Eliminar Test Vocacional Editado
    Ir a asignar test vocacional
    Asignar test vocacional a usuario
    Cerrar sesion
    Ingresar Credenciales Usuario Normal
    Verificar Login Exitoso Usuario Normal
    Verificar que el test vocacional fue asignado
    Cerrar navegador