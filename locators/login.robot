*** Settings ***
Documentation       Locators para a funcionalidade Login

*** Variables ***
#Login
${txt_email}        css:body > app-root > app-login > div > div > app-auth > form > div:nth-child(1) > input
${txt_senha}        css:body > app-root > app-login > div > div > app-auth > form > div:nth-child(2) > input
${btn_login}        css:body > app-root > app-login > div > div > app-auth > form > div.box-option > button

#Home
${txt_bem_vindo}    css:body > app-root > app-dashboard > div > header > div.box-welcome > div.left-component > h1
${produtos}         css:.content-products