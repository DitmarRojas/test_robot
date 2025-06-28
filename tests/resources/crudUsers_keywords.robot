*** Settings ***
Documentation    Test     crud de usuario automatizado con Robot Framework y Selenium
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

Ir a la pagina de crud usuarios
    [Documentation]    Navega a la página de crud de usuarios del sistema
    Click Link    xpath=/html/body/div[2]/div/div/ul/li[2]/a
    Sleep    ${DELAY3}

#    Input Text    xpath=//*[@id="usuariosTable_filter"]/label/input    juan
#    Sleep    ${DELAY3}

Registrar nuevo usuario
    [Documentation]    Navega a la página de registro de usuario y completa el formulario
    Click Button    xpath=/html/body/div[2]/div/main/div[1]/div/button
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="nombre"]    esteban
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="apellido"]    DIDO
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="email"]    esteban@example.com
    Sleep    ${DELAY3}
    Select From List By Index    xpath=//*[@id="rol"]    1
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="password"]    ${PASSWORD_NORMAL}
    Sleep    ${DELAY3}
    Click Button    xpath=//*[@id="formNuevoUsuario"]/div[2]/button[2]
    Sleep    ${DELAY3}
Verificar Registro Exitoso
    Wait Until Page Contains Element    xpath=/html/body/div[6]/div/div[6]/button[1]
    Click Button    xpath=/html/body/div[6]/div/div[6]/button[1]
    Sleep    ${DELAY3}
    Wait Until Page Contains Element    xpath=//*[@id="usuariosTable_filter"]/label/input
Editar usuario
    [Documentation]    Edita un usuario existente en la lista de usuarios
    Click Button    xpath=//*[@id="usuariosTable"]/tbody/tr[1]/td[7]/button[1]
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="edit_nombre"]    esteban editado
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="edit_apellido"]    DIDO EDITADO
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="edit_email"]    esteban.editado@example.com
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="edit_password"]    ${PASSWORD_NORMAL}
    Sleep    ${DELAY3}
    Click Button    xpath=//*[@id="formEditarUsuario"]/div[2]/button[2]
    Sleep    ${DELAY3}
Verificar Edicion Exitosa
    Wait Until Page Contains Element    xpath=/html/body/div[6]/div/div[6]/button[1]
    Click Button    xpath=/html/body/div[6]/div/div[6]/button[1]
    Sleep    ${DELAY3}
    Wait Until Page Contains Element    xpath=//*[@id="usuariosTable_filter"]/label/input
Eliminar usuario
    [Documentation]    Elimina un usuario existente de la lista de usuarios
    Click Button    xpath=//*[@id="usuariosTable"]/tbody/tr[1]/td[7]/button[2]
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div[5]/div/div[6]/button[1]
    Sleep    ${DELAY3}
Error de eliminacion
    Wait Until Page Contains Element    xpath=/html/body/pre
    Sleep    ${DELAY3}
Volver a la lista de usuarios
    Go To    http://localhost/views/admin/usuarios.php
    Wait Until Page Contains Element    xpath=//*[@id="usuariosTable_filter"]/label/input
    Sleep    ${DELAY3}
Buscar usuario
    [Documentation]    Busca un usuario en la lista de usuarios
    Input Text    xpath=//*[@id="usuariosTable_filter"]/label/input    esteban
    Sleep    ${DELAY3}