*** Settings ***
Library     SeleniumLibrary
Library     String
Library     OperatingSystem
Library     DateTime
Library     Collections
Library     XML
Library     Process
Library     os
Library     ../utils/CustomDateUtils.py

Resource    ./config.robot
Resource    ./hooks.robot

# Locators
Resource    ../locators/login.robot
Resource    ../locators/menu.robot
Resource    ../locators/home.robot
Resource    ../locators/detalhamento.robot/
Resource    ../locators/submission.robot
Resource    ../locators/graficos.robot

# Components
Resource    ../components/menu.robot
Resource    ../components/calendar.robot
Resource    ../components/filtro.robot
Resource    ../components/table.robot

# Pages
Resource    ../pages/LoginPage.robot
Resource    ../pages/DetalhamentoPage.robot
Resource    ../pages/SubmissionPage.robot
Resource    ../pages/ResubmissionPage.robot
Resource    ../pages/GraficoPage.robot
