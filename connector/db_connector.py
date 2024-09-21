"""
Connect and query database.
"""

import sqlite3

class DatabaseConn():

    def __init__(self):
        self.sqlite = sqlite3()

    def create_database(self, filename):
        """ 
        Create a database connection to an SQLite database
        """
        conn = None
        try:
            conn = self.sqlite.connect(filename)
            print(sqlite3.sqlite_version)
        except sqlite3.Error as e:
            print(e)
        finally:
            if conn:
                conn.close()

    # create tables

    # get table data

    # 
    

