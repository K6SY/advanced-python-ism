#import du module commun
from common import *

print('#########################################################')
print('#          Welcome to MySQL Database Manager            #')
print('#########################################################')
print()

while True:
    print("* Tap 1 for creating a database")
    print("* Tap 2 for creating a table")
    print("* Tap any other key to quit")
    print()
    mydb = dbConnect(config)
    choix = input("Please make your choice ? \n")
    print()
    if choix == '1':
        if createDatabase(mydb):
            print("The database is creating sucessfully.")
            print()
        else:
            print("Some issues occured during creation process. Please try again")
            print()
    elif choix == '2':
        if createTable(mydb,config):
            print("The table is creating sucessfully.")
            print()
        else:
            print("Some issues occured during creation process. Please try again")
            print()

    else:
        print('---------------------')
        print("Thank's for using. Good bye")
        dbDisconnect(mydb)
        break
