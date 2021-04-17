#import du module commun
from common import *

print('#########################################################')
print('#          Welcome to MySQL Database Manager            #')
print('#########################################################')
print()

while True:
    print("* Tap 1 for inserting data")
    print("* Tap 2 for selecting all data in a table")
    print("* Tap 3 for searching specific data")
    print("* Tap any other key to quit")
    print()
    db_name=input("Please enter the database name?\t")
    mydb = dbConnect(config)
    if isDatabaseExisting(mydb, db_name):
        dbDisconnect(mydb)
        config['database']=db_name
        mydb = dbConnect(config)
        choix = input("Please make your choice ? \n")
        print()
        if choix == '1':
            if genericInsert(mydb):
                print("Insertion is sucessfully done")
                print()
            else:
                print("Some issues occured during insertion process. Please try again")
                print()
        elif choix == '2':
            result=getAllData(mydb)
            if result:
                for item in result:
                    print(item)
                print()
            else:
                print("Some issues occured during selection process. Please try again")
                print()
        elif choix == '3':
            result=getSpecificData(mydb)
            if result:
                for item in result:
                    print(item)
                print()
            else:
                print("Some issues occured during selection process. Please try again")
                print()
        else:
            print('---------------------')
            print("Thank's for using. Good bye")
            dbDisconnect(mydb)
            break
    else:
        print('Your database does not exist')