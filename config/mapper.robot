*** Settings ***
Library     SeleniumLibrary
Library     String
Library     OperatingSystem
Library     DateTime
Library     Collections
Library     XML

Resource    ./config.robot
Resource    ./hooks.robot

# Locators
Resource    ../locators/login.robot
Resource    ../locators/menu.robot
Resource    ../locators/home.robot
Resource    ../locators/detalhamento.robot
Resource    ../locators/submission.robot

# Components
Resource    ../components/menu.robot
Resource    ../components/calendar.robot
Resource    ../components/filtro.robot
Resource    ../components/table.robot

# Pages
Resource    ../pages/LoginPage.robot
Resource    ../pages/DetalhamentoPage.robot
Resource    ../pages/SubmissionPage.robot
