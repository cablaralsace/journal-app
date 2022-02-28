# README

Ruby version
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]

Rails version
Rails 6.1.4.6

Deployment instructions
Heroku

Journal App - User Stories

User Story #1: As a User, I want to create a category that can be used to organize my tasks.
User Story #2: As a User, I want to edit a category to update the category's details.
User Story #3: As a User, I want to view a category to show the category's details.
User Story #4: As a User, I want to create a task for a specific category so that I can organize tasks quicker.
User Story #5: As a User, I want to edit a task to update task's details.
User Story #6: As a User, I want to view a task to show task's details.
User Story #6: As a User, I want to delete a task to lessen my unnecessary daily tasks.
User Story #7: As a User, I want to view my tasks for today for me to remind what are my priorities for today.
User Story #8: As a User, I want to create my account so that I can have my own credentials.
User Story #9: As a User, I want to login my account so that I can access my account and link my own tasks.

Summary of Constraints

Use devise gem for authentication.
A user shouldn't be able to view other users' tasks and categories.
A task cannot be under multiple categories.
Include automated tests (we'll discuss this and TDD).
Include model-level validations.
For example, should we allow duplicate categories or not?
Deploy app to Heroku.
Add a README file.