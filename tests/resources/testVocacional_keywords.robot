*** Settings ***
Documentation    Test vocacional automatizado con Robot Framework y Selenium
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
Ir a la pagina de test vocacional
    [Documentation]    Navega a la página del test vocacional
    Click Link    xpath=/html/body/div[2]/div/div/ul/li[3]/a
    Sleep    ${DELAY3}
Crear nuevo test vocacional
    [Documentation]    Crea un nuevo test vocacional
    Click Button    xpath=/html/body/div[2]/div/main/div[1]/div/button
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="nombre"]    Test Vocacional Automatizado
    Sleep    ${DELAY1}
    Input Text    xpath=//*[@id="descripcion"]    Descripción del test vocacional automatizado
    Sleep    ${DELAY1}
    Input Text    xpath=//*[@id="duracion_min"]    30    
    Sleep    ${DELAY1}
    Click Button    xpath=//*[@id="formNuevoTest"]/div[2]/button[2]
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div[6]/div/div[6]/button[1]
    Sleep    ${DELAY3}
Ir a asignar preguntas
    [Documentation]    Navega a la página de asignar preguntas al test vocacional
    Click Button    xpath=/html/body/div[2]/div/main/div[2]/div/div/div[3]/button[2]
    Sleep    ${DELAY3}
    Wait Until Page Contains Element    xpath=/html/body/div[2]/div/main/div[1]/button
Asignar preguntas al test vocacional
    [Documentation]    Asigna preguntas al test vocacional
    Sleep    ${DELAY1}
    Click Button    xpath=/html/body/div[2]/div/main/div[1]/button
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="texto"]    Pregunta de test vocacional automatizado
    Sleep    ${DELAY3}
    Select From List By Value    xpath=//*[@id="tipo"]    opcion_multiple
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="opciones-lista"]/div[1]/input    Opción 1
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="opciones-lista"]/div[2]/input    Opción 2
    Sleep    ${DELAY3}
    Click Button    xpath=//*[@id="btnAgregarOpcion"]
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="opciones-lista"]/div[3]/input    Opción 3
    Sleep    ${DELAY3}
    # Seleccionar el radio button de la primera opción como respuesta correcta
    Click Element    xpath=//*[@id="opciones-lista"]/div[1]/div/input
    Sleep    ${DELAY3}
    # Verificar que el radio button está seleccionado usando atributo checked
    Element Attribute Value Should Be    xpath=//*[@id="opciones-lista"]/div[1]/div/input    checked    true
    Sleep    ${DELAY3}
    Click Button    xpath=//*[@id="formNuevaPregunta"]/div[2]/button[2]
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div[6]/div/div[6]/button[1]
    Sleep    ${DELAY3}

Verificar que la pregunta fue asignada
    [Documentation]    Verifica que la pregunta fue asignada correctamente
    Wait until page contains element    xpath=//*[@id="preguntasTable"]/tbody/tr/td[4]/button[1]
Editar test vocacional
    [Documentation]    Edita el test vocacional creado recientemente
    Click Button    xpath=/html/body/div[2]/div/main/div[2]/div/div/div[3]/button[1]
    Sleep    ${DELAY3}
    Input Text    xpath=//*[@id="edit_nombre"]    Test Vocacional Automatizado Editado
    Sleep    ${DELAY3}
    Click Button    xpath=//*[@id="formEditarTest"]/div[2]/button[2]
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div[6]/div/div[6]/button[1]
    Sleep    ${DELAY3}
Verificar que el test vocacional fue editado
    [Documentation]    Verifica que el test vocacional fue editado correctamente
    Wait until page contains element    xpath=//*[@id="testsTable_filter"]/label/input
Buscar Test Vocacional Automatizado Editado
    [Documentation]    Busca el test vocacional editado
    Input Text    xpath=//*[@id="testsTable_filter"]/label/input    Test Vocacional Automatizado Editado
    Sleep    ${DELAY3}
Eliminar Test Vocacional Editado
    [Documentation]    Elimina el test vocacional editado
    Click Button    xpath=/html/body/div[2]/div/main/div[2]/div/div/div[3]/button[3]
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div[5]/div/div[6]/button[1]
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div[5]/div/div[6]/button[1]
Ir a asignar test vocacional
    [Documentation]    Navega a la página de asignar test vocacional
    Click Link    xpath=/html/body/div[2]/div/div/ul/li[5]/a
    Sleep    ${DELAY3}
    Wait Until Page Contains Element    xpath=/html/body/div[2]/div/main/div/div/div/div/h2
Asignar test vocacional a usuario
    [Documentation]    Asigna el test vocacional a un usuario
    Select From List By Index    xpath=//*[@id="id_usuario"]    1
    Sleep    ${DELAY3}
    Select From List By Index    xpath=//*[@id="id_test"]    1
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div[2]/div/main/div/div/div/div/form/div[3]/button
    Sleep    ${DELAY3}
Cerrar sesion
    [Documentation]    Cierra la sesión del administrador
    Click Element    xpath=//*[@id="userDropdown"]
    Sleep    ${DELAY3}
    Click Link    xpath=/html/body/header/div[2]/ul/li[6]/a
    Sleep    ${DELAY3}
Ingresar Credenciales Usuario Normal
    [Documentation]    Ingresa las credenciales de un usuario normal para verificar la asignación del test vocacional
    Wait Until Page Contains Element    name=email
    Input Text    name=email    ale1@example.com
    Sleep    ${DELAY3}
    Input Text    name=password    123456789
    Sleep    ${DELAY3}
    Click Button    xpath=/html/body/div/form/button
    Sleep    ${DELAY3}
Verificar Login Exitoso Usuario Normal
    Wait Until Page Contains Element    xpath=/html/body/div[1]/div[1]/div[2]/div/div[1]/h5
Verificar que el test vocacional fue asignado
    [Documentation]    Verifica que el test vocacional fue asignado correctamente en el usuario
    Click Link    xpath=//*[@id="navbarNav"]/ul/li[2]/a
    Sleep    ${DELAY3}
    Click Link    xpath=/html/body/div/div/div/div/div/div[3]/a
    Sleep    ${DELAY3}
    Wait Until Page Contains Element    xpath=/html/body/div/div/h2
    Sleep    ${DELAY3}