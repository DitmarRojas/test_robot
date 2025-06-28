*** Settings ***
Documentation     Test de login automatizado con Robot Framework y Selenium
Library    SeleniumLibrary
resource    ../resources/login_keywords.robot

*** Variables ***

*** Test Cases ***
Login con credenciales válidas
    [Documentation]    Verifica el login exitoso de una usuario administrador
    Abrir navegador
    Ir a la pagina de login
    Ingresar Credenciales Administrador
    Verificar Login Exitoso Administrador
    Cerrar navegador

Login con credenciales usuario normal
    [Documentation]    Verifica el login exitoso de un usuario normal            
    Abrir navegador
    Ir a la pagina de login
    Ingresar Credenciales Usuario Normal
    Verificar Login Exitoso Usuario Normal
    Cerrar navegador

Login con credenciales invalidas
    [Documentation]    Verifica que no se puede ingresar al sistema con credenciales invalidas
    Abrir navegador
    Ir a la pagina de login
    Ingresar Credenciales Invalidas
    Verificar Error Exitoso
    Cerrar navegador