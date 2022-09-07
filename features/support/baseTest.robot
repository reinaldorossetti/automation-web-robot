*** Settings ***
Library             SeleniumLibrary
Variables           ../support/resource/setup.yml
Library             BrowserConfig.py
Library             LibraryHelper.py
Library             FakerLibrary    locale=pt_BR

*** Variables ***
${BROWSER}      Chrome

*** Keywords ***
Que Esteja No Site
    Go to                                ${URL}
    Maximize Browser Window
    Set Selenium Implicit Wait	         30

Que Esteja Na Pagina Esqueci Minha Senha
    Go to                                ${URLESQUECISENHA}
    Maximize Browser Window
    Set Selenium Implicit Wait	         30

Que Esteja Na Pagina Cadastre-se
    Go to                                ${URLCADASTRO}
    Maximize Browser Window
    Set Selenium Implicit Wait	         30

Fechando O Browser
    Set Screenshot Directory       output/allure
    Capture Page Screenshot        EMBED
    Close All Browsers

Dado ${keyword}
    Run keyword   ${keyword}

Quando ${keyword}
    Run keyword   ${keyword}

Então ${keyword}
    Run keyword   ${keyword}

E ${keyword}
    Run keyword   ${keyword}

Configuração Do Browser
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
