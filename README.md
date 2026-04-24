# Little Lemon Database Project

This repository contains the Little Lemon booking database implementation for peer review.

## Included deliverables

- Database schema SQL: `little_lemon_schema.sql`
- Stored procedures SQL: `little_lemon_stored_procedures.sql`
- Python script for procedure calls: `little_lemon_db_client.py`
- Notes for reviewers: `notes.txt`

## Required stored procedures

- `GetMaxQuantity()`
- `ManageBooking()`
- `UpdateBooking()`
- `AddBooking()`
- `CancelBooking()`

## How to run

1. Execute `little_lemon_schema.sql` in MySQL Workbench.
2. Execute `little_lemon_stored_procedures.sql`.
3. Update credentials in `little_lemon_db_client.py`.
4. Run:
   - `python little_lemon_db_client.py`
