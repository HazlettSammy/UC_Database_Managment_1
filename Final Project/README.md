# Organizational Management Database System

## Overview

The Organizational Management Database System is a relational database application designed to manage the details of organizations, staff members, departments, products, orders, and projects. The system is structured around multiple interconnected tables that store essential data for effective management of various organizations and their related entities. This database is ideal for companies or agencies looking to track and organize their internal operations.

## Features

- **Organizations**: Store information about various organizations, including their name, country, and address.
- **Staff**: Manage staff information such as staff IDs, full names, titles, roles, emails, and phone numbers.
- **Departments**: Keep track of department-specific information including department names, locations, and budgets.
- **Products**: Catalog products, their prices, and types (e.g., Fighter, Transport).
- **Orders**: Store order details such as contract lengths, establishment dates, and product associations with organizations.
- **Projects**: Link staff members to projects and keep track of the associated products and organizations.

## Database Structure

The database is designed with several interconnected tables. Each table is related to others via **foreign keys**. Here is a breakdown of the key tables and their relationships:

1. **Organizations**
   - Holds the core information of the organization, including the `OrganizationID` as a unique identifier.
   - Foreign Key: `OrderID` links to the `OrderDetails` table.

2. **Staff**
   - Contains details about staff members, including their roles and department affiliations.
   - Foreign Key: `DepartmentID` links to the `Departments` table.

3. **Departments**
   - Stores data on departments within an organization, such as the department's name, location, and budget.

4. **Products**
   - Catalogs the products the organization deals with, including prices and types.

5. **OrderDetails**
   - Contains details of the orders placed by organizations for different products.
   - Foreign Keys: `ProductID` and `OrganizationID` link to the `Products` and `Organizations` tables respectively.

6. **Projects**
   - Represents ongoing or completed projects within an organization.
   - Foreign Keys: `StaffID`, `ProductID`, and `OrganizationID` link to the `Staff`, `Products`, and `Organizations` tables respectively.
  


 ## Contributors

   - Samuel Hazlett
   - Aleu Aleu
   - Vi Dao
   - Scott Browning
   - Alix Spahr
