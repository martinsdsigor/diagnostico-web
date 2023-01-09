*** Settings ***

Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DateTime
Library    Collections

Resource    ./config.robot
Resource    ./hooks.robot

# Componentes
Resource    ../locators/login.robot

# Pages
Resource    ../pages/LoginPage.robot