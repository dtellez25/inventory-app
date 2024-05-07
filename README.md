# Food Pantry Inventory Scanner

## Team Members
- Cordelia Campbell
- Shaochen Huang
- Dago Tellez
- Ibsa Tassew Geleta
- Jeff Cui
- Myri Ayala

## Point of Contact for the TC'S Food Pantry
Hayley Berliner

## Project Overview
Our project aims to develop a simple inventory management system tailored for Trinity College Food Pantry, addressing the unique challenges faced by the organization in manually tracking and managing its inventory of donated food and hygiene items. By offering a simple solution, our system will enable rapid updates to the inventory, empowering administrators to promptly replenish stock levels as needed.

## Objectives
### Primary Goal
Develop a user-friendly inventory scanner to simplify monitoring and restocking. 
### Secondary Goals
Incorporate a database for the login page on the admin side and add Multi-Factor Authentication for security 

## User Stories

## Main story: 
As the Food Pantry Coordinator at Trinity, I want to automate how we track inventory to save time. I would like a system where I can easily add items and students can use a QR code to record items they take out [inspired from talk given by Hayley Berliner] 

## Additional User story: 
Add a donation bottom to the app that lets users donate items through the Food Pantry Amazon Wishlist. When users pick an item to donate, the destination details like the name, location, and box number of the Food Pantry representative will automatically populate. The manager's email will be included to send a confirmation of the donation.  


## Feature 1: 

User-end application scanner and counter: Include a button to open a QR code scanner. Users can scan the QR code of the item they want to retrieve. After scanning, they will use a counter to specify the quantity they are taking. This information will automatically update our database.  

## Feature 2: 

Login Page for food pantry administrator & inventory section: Implement basic login page to confirm credentials of administrator to access basic inventory. This section of the application allows users to download .CSV files of the current inventory and manually update the database in case needed.  

## Feature 3: 

Authentication implementation: Implement Multi-Factor authentication for admin user for identity verification [ to be implemented] 


## Technical Requirements
### Programming Language(s)
- Dart
- JavaScript

### Frameworks and Libraries
- Flutter
- HTTP library for Flutter
- Node.js
- Expandable_datatable for Flutter

### Database Systems
- Firebase Realtime Database (backend maintained in additional repository)
- Front-End in Flutter using Dart language: https://github.com/dtellez25/TcFoodnStuff_Inventory
  
### Development Tools
- Visual Studio

## Security Aspect of Project
- Access Control
- User Privacy Protection
- Secure Authentication


## Constraints and Assumptions
### Constraints
- TBD (List any constraints like budget, time, resources)

### Assumptions
- There is only one administrator who needs to access the inventory page to manually update the database and check the number of items available based on the category. 
- They have organized the food pantry room by category, such as chips, noodles, popcorn, and sanitary items.  

## Backend
### Technology Type
- Technology Name
  - Programming Language
    - JavaScript
  - Runtime Environment
    - Node.js
  - Development Framework
    - Express

### File Structure
- .gitignore
  - Declare what don’t need to be pushed to the GitHub repo
- README.md
  - Instructions for developers
- App.js
  - Configures and initializes the Express application, sets up middleware, initializes Firebase connection, and configures Swagger documentation for testing
- routes.js
  - Defines the server's routing logic, handling API requests to manage data CRUD operations and file downloads
- server.js
  - Launches the Express server, listening on a specific port to accept and process incoming client requests
- app.test.js
  - Contains 3 tests to 3 routes, based on Jest
- jest.config.js
  - Declare the testing environment as Node.js
- package.json
  - Contain all dependencies
- package-lock.json
  - A file automatically generated by npm (Node Package Manager) based on package.json
- foodpantry-xxx-firebase-adminsdk-xxx
  - The Firebase Admin SDK private key
- dockerfile
  - Creates docker image for the application

## API Endpoints in the Backend
1. POST /updateData/{type}/{category}/{brand}
   - Description: Updates or creates an inventory item. Use query parameter quantity to specify the amount to add (can be negative or positive).
   - Parameters:
     - name: The name of the item. (path parameter)
     - quantity: The latest quantity of the item. (query parameter)
   - Responses:
     - `200`: Successfully updated the inventory.
     - `400`: Invalid input, quantity must be an integer.
     - `500`: Server error or transaction failed.

2. GET /getAllData
   - Description: Gets all data in the database in JSON form.
   - Parameters: No parameters required for this endpoint.
   - Responses:
     - `200`: Successfully retrieved all data from Firebase database.
     - `500`: Failed to retrieve data from Firebase database.

3. GET /downloadData
   - Description: Downloads all data as an Excel file.
   - Parameters: No parameters required for this endpoint.
   - Responses:
     - `200`: Successfully created, downloaded, and deleted the Excel file. The response includes the Excel file containing the structured data.
     - `500`: An error occurred on the server, preventing the creation or download of the Excel file. This might be due to issues in data fetching from the database or file handling on the server.

## Testing
- Jest + Supertest + GitHub action
  - Jest provides the testing framework and assertion capabilities, organizing tests and verifying outcomes.
  - Supertest handles the simulation of HTTP requests, directly testing the API endpoints of the Express application.
  - GitHub action runs backend tests on Ubuntu when changes are pushed or pulled to the Backend directory in the main branch.
- Three Tests:
  1. Test for updateData/:name API
     - Purpose: Ensures the API updates the quantity of a specific item correctly.
     - Process:
       - Sends a POST request with a name (test) and quantity (1).
       - Checks that the response status is 200 and the body contains a quantity field of
