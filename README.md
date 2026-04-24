# Little Lemon Database Engineering Project

Production-style capstone repository for Little Lemon database design, booking procedures, Python MySQL integration, and analytics artifacts.

## Repository structure

- `Data/` - source dataset notes and placement guide
- `LittleLemonDataModel/` - schema SQL and ER-model notes
- `LittleLemon_Store_Procedure/` - required booking stored procedures
- `PythonSQLConnector/` - Python client to execute procedures
- `Tableau/` - Tableau workbook placement and dashboard notes
- `ProjectSampleImg/` - screenshots placement guide for peer review
- `notes.txt` - rubric checklist for reviewers

## Required procedures implemented

- `GetMaxQuantity()`
- `ManageBooking()`
- `UpdateBooking()`
- `AddBooking()`
- `CancelBooking()`

## Quick start

1. Run `LittleLemonDataModel/little_lemon_schema.sql`.
2. Run `LittleLemon_Store_Procedure/little_lemon_stored_procedures.sql`.
3. Update database credentials in `PythonSQLConnector/little_lemon_db_client.py`.
4. Execute `python PythonSQLConnector/little_lemon_db_client.py`.

## Peer-review checklist mapping

- GitHub repo available and organized by deliverable type.
- SQL schema provided.
- All required procedures provided and callable.
- Python connector demonstrates procedure execution flow.
- Supporting notes included for ER and Tableau assets.

## Important rubric files

- `LittleLemonDM.png` (required filename for ER data model image check)
- `LittleLemonDataModel/little_lemon_schema.sql`
- `LittleLemon_Store_Procedure/little_lemon_stored_procedures.sql`
- `PythonSQLConnector/little_lemon_db_client.py`
