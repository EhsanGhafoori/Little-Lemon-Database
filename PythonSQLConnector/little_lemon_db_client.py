import mysql.connector as connector
from mysql.connector import Error


dbconfig = {
    "host": "localhost",
    "user": "root",
    "password": "YOUR_ROOT_PASSWORD",
    "database": "LittleLemonDB",
}


def call_procedure(cursor, name, args=None):
    args = args or []
    print(f"Calling procedure: {name}({', '.join(map(str, args))})")
    cursor.callproc(name, args)
    for result in cursor.stored_results():
        print(result.fetchall())
    print("-" * 50)


def main():
    connection = None
    cursor = None
    try:
        connection = connector.connect(**dbconfig)
        cursor = connection.cursor()
        print("Connected to LittleLemonDB")

        call_procedure(cursor, "GetMaxQuantity")
        call_procedure(cursor, "ManageBooking", ["2026-02-11", 5])
        call_procedure(cursor, "UpdateBooking", [1, "2026-02-15"])
        call_procedure(cursor, "AddBooking", [10, 1, "2026-02-20", 4])
        call_procedure(cursor, "CancelBooking", [10])

        connection.commit()
        print("All changes committed.")
    except Error as err:
        print("Error code:", err.errno)
        print("Error message:", err.msg)
        if connection:
            connection.rollback()
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
            print("Connection closed.")


if __name__ == "__main__":
    main()
