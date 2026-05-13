# Si deseo correrlo por fuera
# path: C:\Apps\sqlite 
# G:\Mi unidad\home\core\code\2026-2-TIID5-DB2\src\data>sqlite3 rh_sqlite.db "select * from users"

# https://github.com/jpwhite3/northwind-SQLite3
# https://www.kaggle.com/datasets/munawarsaudagar/northwind-2000-sqlite-database-simplified/data


import os
import sys
import sqlite3
con = sqlite3.connect(os.path.join(os.path.dirname(__file__), '..', 'data', 'rh_sqlite.db'))

cur = con.cursor()
sql ='''
CREATE TABLE IF NOT EXISTS users(
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
email TEXT UNIQUE NOT NULL)
'''

cur.execute(sql)
con.commit()

def add_user(name, email):
    # sql = f'INSERT INTO users (name, email) VALUES ({name}, {email})'
    # cur.execute(sql)
    try:
        cur.execute("INSERT INTO users (name, email) VALUES (?, ?)", (name, email))
        con.commit()
        print("User added successfully.")
    except sqlite3.IntegrityError:
        print("Error: Email already exists.")

def get_users():
    cur.execute("SELECT * FROM users")
    return cur.fetchall()

def get_user_by_email(email):
    cur.execute("SELECT * FROM users WHERE email = ?", (email,))
    return cur.fetchone()

def delete_user(user_id):
    cur.execute("DELETE FROM users WHERE id = ?", (user_id,))
    if cur.rowcount == 0:
        print("Error: User not found.")
        return
    con.commit()
    print("User deleted successfully.")

def update_user(user_id, name=None, email=None):
    if name and email:
        try:
            cur.execute("UPDATE users SET name = ?, email = ? WHERE id = ?", (name, email, user_id))
        except sqlite3.IntegrityError:
            print("Error: Email already exists.")
            return
    elif name:
        cur.execute("UPDATE users SET name = ? WHERE id = ?", (name, user_id))
    elif email:
        try:
            cur.execute("UPDATE users SET email = ? WHERE id = ?", (email, user_id))
        except sqlite3.IntegrityError:
            print("Error: Email already exists.")
            return
    con.commit()
    print("User updated successfully.")

if __name__ == "__main__":
    cur.execute('insert into users values(NULL, "carlos", "carlos@gmail.com")')
    add_user("Alice", "alice@example.com")
    add_user("Bob", "bob@example.com")
    
    print("All users:")
    for user in get_users():
        print(user)
    
    user = get_user_by_email("alice@example.com")
    print("\nUser with email 'alice@example.com':")
    print(user)
    
    delete_user(2)
        
    update_user(3, name="Esponja", email="esponja@example.com")
    
    print("\nAll users:")
    for user in get_users():
        print(user)
    print()
    result =cur.execute('select count(*) from users')
    rows = result.fetchone()
    print(f"Total users: {rows[0]}")
    con.close()


    
