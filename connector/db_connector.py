"""
Connect and query database.
"""

import sqlite3
import os
from pathlib import Path
class DatabaseConn():

    def __init__(self):
        self.sqlite = sqlite3

    def create_database(self, database: str):
        """ 
        Create a database connection to an SQLite database
        """
        conn = None
        try:
            conn = self.sqlite.connect(database)
            print(sqlite3.sqlite_version)
        except sqlite3.Error as e:
            print(e)

        return conn

    # create tables
    def create_db_tables(self, database: str):

        script_path = Path('/Users/qlfzn/software-project/event-management/sql/db_tables.sql')

        if not script_path.exists():
            print(f"SQL script not found: {script_path}")
            return

        conn = self.create_database(database)
        cursor = conn.cursor()

        try:
            # Open and read the SQL file
            with open(script_path, 'r') as sql_file:
                sql_script = sql_file.read()

            # Execute the SQL script
            cursor.executescript(sql_script)
            conn.commit()
            print("Tables created successfully.")

        except sqlite3.Error as e:
            print(f"Error executing script: {e}")
        
        finally:
            # Close the connection
            if conn:
                conn.close() 




    # get table data

    # 
    

