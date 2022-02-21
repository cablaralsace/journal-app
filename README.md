# README

**Ruby version** <br/>
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]

**Rails version** <br/>
Rails 6.1.4.6

**Deployment instructions** <br/>
Heroku

**Journal App - User Stories** <br/>

User Story #1: As a User, I want to create a category that can be used to organize my tasks. <br/>
User Story #2: As a User, I want to edit a category to update the category's details. <br/>
User Story #3: As a User, I want to view a category to show the category's details. <br/>
User Story #4: As a User, I want to create a task for a specific category so that I can organize tasks quicker. <br/>
User Story #5: As a User, I want to edit a task to update task's details. <br/>
User Story #6: As a User, I want to view a task to show task's details. <br/>
User Story #6: As a User, I want to delete a task to lessen my unnecessary daily tasks. <br/>
User Story #7: As a User, I want to view my tasks for today for me to remind what are my priorities for today. <br/>
User Story #8: As a User, I want to create my account so that I can have my own credentials. <br/>
User Story #9: As a User, I want to login my account so that I can access my account and link my own tasks. <br/>


**Summary of Constraints**

1. Use devise gem for authentication.
   - A user shouldn't be able to view other users' tasks and categories.
2. A task cannot be under multiple categories.
3. Include automated tests (we'll discuss this and TDD).
4. Include model-level validations.
   - For example, should we allow duplicate categories or not?
5. Deploy app to Heroku.
6. Add a README file.


