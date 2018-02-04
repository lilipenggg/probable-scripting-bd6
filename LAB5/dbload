#!/usr/bin/python
# Lili Peng
# Lab5 - Database Loader
# CS3030 - Scripting

import sqlite3
import csv
import random
import os
from sys import argv

# Make sure there are two arguments being passed in
if len(argv) != 3:
    print ("Usage: dbload CSVFILE DATABASEFILE")
    exit(1)

# Try openning the csv file
ch = ""
try:
    ch = open(argv[1], 'r')
except Exception as e:
    print "Error: {0}".format(e.args[0])
    exit(1)

# Try connecting to the database
conn = ""
try:
    conn = sqlite3.connect(argv[2])
except Exception as e:
    print "Error: {0}".format(e.args[0])
    exit(1)

# Drop the two tables if they already exist
curs = conn.cursor()
curs.execute('''drop table if exists classes''')
curs.execute('''drop table if exists students''')

# Create the classes and students tables
curs.execute('''create table classes (id text, subjcode text, coursenumber text, termcode text)''')
curs.execute('''create table students 
                (id text primary key unique, lastname text, firstname text, major text, 
                email text, city text, state text, zip text)''')

# Iterate through the csv file and load the data into database
reader = csv.reader(ch, delimiter=',', quotechar='"')
counter = 0
for row in reader:

    # Skip the header record
    counter += 1
    if counter == 1:
        continue

    # Insert record into students table if the student does not exist in the database
    wnumber = row[0]
    curs.execute("select * from students where id = '{0}'".format(wnumber))
    if not curs.fetchone():
        r = (wnumber, row[2], row[1], row[4], row[3], row[7], row[8], row[9])
        curs.execute('''insert into students (id, lastname, firstname, major, email, city, state, zip) 
                        values (?,?,?,?,?,?,?,?)''', r)

    # Insert record into classes table
    subjcode = str(row[5]).split(" ")[0]
    coursenumber = str(row[5]).split(" ")[1]
    r = (wnumber, subjcode, coursenumber, row[6])
    curs.execute('''insert into classes (id, subjcode, coursenumber, termcode) values (?,?,?,?)''', r)

conn.commit()
exit(0)
