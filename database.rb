require 'sqlite3'

class DBHandler
    def initialize
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "CREATE TABLE IF NOT EXISTS Students(id INTEGER PRIMARY KEY, FirstName TEXT, LastName TEXT, Email TEXT, Major TEXT, Status TEXT);"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
    
    def create(fname, lname, email, major, status)
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "INSERT INTO Students(FirstName, LastName, Email, Major, Status) VALUES('#{fname}', '#{lname}', '#{email}', '#{major}', '#{status}');"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
    
    def all
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "SELECT * FROM Students;"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
    
    def all_enrolled
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "SELECT * FROM Students WHERE Status='Enrolled';"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
  
    def all_graduated
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "SELECT * FROM Students WHERE Status='Graduated';"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
    
    def get(id)
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "SELECT * FROM Students WHERE Id='#{id}';"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end

    def get_enrolled(id)
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "SELECT * FROM Students WHERE Id='#{id}' AND Status = 'Enrolled';"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end

    def get_graduated(id)
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "SELECT * FROM Students WHERE Id='#{id}' AND Status = 'Graduated';"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
    
    def update(id, fname, lname, email, major, status)
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "UPDATE Students SET FirstName='#{fname}', LastName='#{lname}', Email='#{email}', Major='#{major}', Status='#{status}' WHERE Id='#{id}';"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
    
    def destroy(id)
       begin
         db = SQLite3::Database.open "student.db"
         dbstatement = "DELETE FROM Students WHERE Id='#{id}';"
         db.execute dbstatement
       rescue SQLite3::Exception => e
       puts "Exception Occurred"
       puts e
       ensure
        db.close if db
       end
    end
end