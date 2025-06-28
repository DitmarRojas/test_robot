*** Settings ***
Documentation    Test crud de registro de usuario automatizado con Robot Framework y Selenium
Library    SeleniumLibrary
Resource    ../resources/crudUsers_keywords.robot

*** Variables ***

*** Test Cases ***
Login con credenciales válidas
    [Documentation]    Verifica el login exitoso de una usuario administrador
    Abrir navegador
    Ir a la pagina de login
    Ingresar Credenciales Administrador
    Verificar Login Exitoso Administrador
Vista crud de usuarios
    Ir a la pagina de crud usuarios
    Registrar nuevo usuario
    Verificar Registro Exitoso
    Buscar usuario
    Editar usuario
    Verificar Edicion Exitosa
    Buscar usuario
    Eliminar usuario
    Error de eliminacion
    Volver a la lista de usuarios
    Cerrar navegador