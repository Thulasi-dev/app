🏠 Real Estate Property Management System (Salesforce)

📌 Project Overview
This project is a Salesforce-based Real Estate Property Management System developed as part of an assignment. 
It manages properties, tenants, lease agreements, vendors, and maintenance requests with automation and reporting features.
________________________________________
🚀 Features Implemented
🏠 Property Management

•	Store property details (Address, City, State, Rent, Status, etc.)
•	Supports multiple image uploads using Salesforce Files
•	Tracks availability (Available / Occupied)
•	Includes required field validations
________________________________________
👤 Tenant Management

•	Store tenant details (Name, Phone, Email)
•	Supports multiple properties per tenant using a junction object
•	Property assignment triggers automatic task creation
________________________________________
🔗 Property-Tenant Relationship

•	Implemented using Tenant_Property__c (Junction Object)
•	Enables many-to-many relationship
________________________________________
📄 Lease Agreement Management

•	Stores agreement details:
o	Terms
o	Monthly Rent
o	Start Date / End Date
•	Linked to both Property and Tenant
•	Automated email reminder before 30 days of expiry
________________________________________
🔧 Vendor Management

•	Stores vendor details (Name, Phone, Email)
________________________________________
🛠 Maintenance Requests

•	Tracks maintenance issues
•	Automatically assigns vendor using least workload logic
•	Status tracking:
o	Open
o	In Progress
o	Completed
o	Cancelled
________________________________________
⚙️ Automation Implemented
🔹 1. Task Creation Trigger
•	Trigger: TenantPropertyTrigger
•	Function:
o	When a property is assigned to a tenant
o	Automatically creates a Task to generate lease agreement
________________________________________
🔹 2. Vendor Auto-Assignment Trigger
•	Trigger: MaintenanceRequestTrigger
•	Function:
o	Assigns maintenance request to vendor with least workload
________________________________________
🔹 3. Lease Expiry Email Scheduler
•	Class: LeaseReminderScheduler
•	Function:
o	Sends automated email reminder 30 days before lease expiry
•	Implemented using Scheduled Apex
________________________________________
🧪 Testing
•	Apex test class implemented
•	Covers:
o	Trigger execution
o	Record creation
________________________________________
🧱 Data Model (Custom Objects)
•	Property__c
•	Tenant__c
•	Tenant_Property__c (Junction)
•	Lease_Agreement__c
•	Vendor__c
•	Maintenance_Request__c
________________________________________
🛠 Technologies Used
•	Salesforce Platform
•	Apex (Triggers, Classes)
•	SOQL
•	Scheduled Apex
•	Salesforce Files (for image upload)
________________________________________
▶️ How to Run / Test
1.	Create sample records:
o	Property
o	Tenant
o	Vendor
2.	Link Tenant & Property:
o	Verify Task auto-created
3.	Create Maintenance Request:
o	Verify Vendor auto-assigned
4.	Create Lease Agreement:
o	Set End Date = Today + 30 days
o	Run scheduler manually to test email
________________________________________

📦 Submission Contents
•	Salesforce project (force-app folder)
•	Apex classes and triggers
•	Test classes
•	README file
•	Demo video link
________________________________________
💡 Notes
•	Image upload handled using Salesforce Files
•	Custom report type creation can be extended further
•	Focus was on core functionality and automation
________________________________________
👨‍💻 Author
Thulasi Perumal
________________________________________
🔥 Final Thought
This project demonstrates:
•	Strong understanding of Salesforce data modeling
•	Automation using Apex
•	Real-world problem-solving approach
________________________________________

