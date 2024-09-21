from connector import DatabaseConn

class EventBookingSystem():

    def __init__(self):
        self.db_con = DatabaseConn()

    def initialise_database(self):
        self.db_con.create_db_tables("event_management.db")



if __name__=="__main__":
    booking_system = EventBookingSystem()

    booking_system.initialise_database()
