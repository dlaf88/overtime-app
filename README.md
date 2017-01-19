# Overtime app

This app was created using the Professional Rails Code Along Course. The instructor of this course is Jordan Hudgens.

## Problems
- A client needs to have documentation regarding employees' overtime hours. 
- Employees need to be reminded to log in any overtime hours.

## Solutions
- App allows employees to log in any overtime performed.
- App reminds employees, on a weekly basis, to log in any overtime hours or to log in that no overtime hours were worked.
- App allows managers to keep track of overtime hours.
- App allows managers to approve or deny overtime hours.

##Technical Highlights
- The use of TDD using rspec-rails,capybara,and database_cleaner gem
- Single Table Inheritance
- The use of Twilio API
- The use of Enums 
- Working with the Administrate gem

## Features
- Admin Dashboard which allows client to create,update,or delete admins and employees.
- Twilio API to send text messages.

## Models 
- Posts 
- Users
- Admin < Users
- Employee < Users