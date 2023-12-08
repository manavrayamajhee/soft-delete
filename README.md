# Soft Delete Functionality in Rails

This project demonstrates the implementation of soft delete functionality in a Rails application. Soft delete allows items to be marked as deleted without removing them from the database.

## Setup

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/soft-delete-rails.git
   cd soft-delete-rails
   ```

Install Dependencies
->bundle install

Database Setup->
rails db:create
rails db:migrate

Open a web browser and go to http://localhost:3000
This should take you to add items page go to http://localhost:3000
To soft delete items you can go to http://localhost:3000/items
To restore items go to http://localhost:3000/restore_items

Run Tests
rspec

### Soft Deleting an Item

- Use the `soft_delete` method in the controller to mark an item as soft-deleted.
- Soft-deleted items are excluded from normal queries.

### Restoring Soft-Deleted Items

- Utilize the `restore` method in the controller to restore a single soft-deleted item.
- The "Restore Soft-Deleted Items" page allows restoring single or multiple soft-deleted items simultaneously.

### Viewing Soft-Deleted Items

- Access the "Restore Soft-Deleted Items" page to view and restore soft-deleted items.

## Running Tests

Run RSpec tests to ensure the correct implementation of soft delete functionality.
