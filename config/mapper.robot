*** Settings ***

Library    SeleniumLibrary

Resource    ./config.robot
Resource    ./hooks.robot

# Componentes
Resource    ../components/login.robot

# Pages
Resource    ../pages/LoginPage.robot