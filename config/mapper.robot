*** Settings ***


Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DateTime
Library    Collections
Library     XML


Resource    ./config.robot
Resource    ./hooks.robot

# Locators
Resource    ../locators/login.robot
Resource    ../locators/menu.robot
Resource    ../locators/home.robot

# Components
Resource    ../components/menu.robot
Resource    ../components/calendar.robot
Resource    ../components/filtro.robot


# Pages
Resource    ../pages/LoginPage.robot
