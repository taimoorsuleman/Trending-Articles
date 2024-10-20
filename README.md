# Trending Articles

A simple app to hit the NY Times Most Popular Articles API 
* Show a list of articles newest first(sorted based on date)
* Shows details when items on the list are tapped. 
* A typical master/detail app


We'll be using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 

For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period
* we can update periods using enum PeriodEnum 

## Tools And Resources Used

- No third-party libraries used in this project

# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Press run icon in Xcode or command + R to run the project on Simulator

# Theme Change
This application supports both dark and light theme features of iOS.
To change the theme, go to Settings, then select Appearance.
From there, you can choose your preferred theme:
Light for a bright interface or Dark for a more subdued look.

## Running The Tests Manually 

Follow the steps to get test case reports:
* Enbale Coverage : Enable coverage Data under test schema section:
* Run Your Tests: Open the Test Navigator (Command + 5). Click the diamond icon next to your test target to run all tests.
* View Coverage Report: After the tests run, open the Report Navigator (Command + 9). Click on the latest test run (the one with a test icon). Switch to the Coverage tab to see your code coverage summary.
* Export the coverage data : You can copy the summary from the Coverage tab. However, Xcode does not have a built-in feature to export coverage reports directly as HTML or other formats without using command line tools.

# Architecture

 This project uses MVVM architecure and used protocols in ViewModel and Service classes, it likely adds flexibility and enhances testability by allowing you to easily mock or stub dependencies.



