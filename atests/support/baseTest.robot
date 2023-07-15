*** Settings ***
Library             SeleniumLibrary
Variables           ../support/resource/setup.yml
Library             BrowserConfig.py
Library             LibraryHelper.py
Library             FakerLibrary    locale=pt_BR

*** Variables ***
${BROWSER}      Chrome

*** Keywords ***
Que Esteja Na Pagina Esqueci Minha Senha
    Go to                                ${URLESQUECISENHA}
    Maximize Browser Window
    Set Selenium Implicit Wait	         30

Que Esteja Na Pagina Cadastre-se
    Go to                                ${URLCADASTRO}
    Maximize Browser Window
    Set Selenium Implicit Wait	         30

Steps to Close Browser  
    Set Screenshot Directory       output/allure
    Capture Page Screenshot        EMBED
    Close All Browsers

You display the Login Page
        Open Browser     about:blank         ${BROWSER}
        Go to                                ${URL}
        Maximize Browser Window
        Set Selenium Implicit Wait	         ${WAIT_MAX}

Configuração Do Browser Chrome
        ${chrome_options}=       ch_instancia_start
        Open Browser       url=${URL}     browser=Headless Chrome      options=${chrome_options}
        Go to                                ${URL}
        Maximize Browser Window
        Set Selenium Implicit Wait	         ${WAIT_MAX}

Configuração Do Browser Edge
        ${chrome_options}=       edge_instancia_start
        Open Browser       url=${URL}     browser=Edge      options=${chrome_options}
        Go to                                ${URL}
        Maximize Browser Window
        Set Selenium Implicit Wait	         ${WAIT_MAX}

Configuração Do Browser Firefox
        ${profile_path}=     ff_instacia_start
        Open Browser     url=${URL}        browser=Headless Firefox       ff_profile_dir=${profile_path}
        Go to                                ${URL}
        Maximize Browser Window
        Set Selenium Implicit Wait	         ${WAIT_MAX}
