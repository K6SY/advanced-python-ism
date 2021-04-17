#Importation des fonctions utiles du module mysql-connector-python
from mysql.connector import connect, Error, errorcode

#Création d'un dictionnaire contenant la configuration de la base de données mysql
config = {
  'user': 'smc',
  'password': 'sco2019',
  'host': '127.0.0.1',
  'database': None,
  'raise_on_warnings': True
}

#Fonction permet d'établir une connexion à votre base de donnée
def dbConnect(yourconfig):
  cnx=''
  try:
    cnx = connect(**yourconfig)
  except Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
      print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
      print ("Database does not exist")
    else:
      print("Some errors are occured")
  return cnx

#Fonction permet de mettre à une connexion à votre base de donnée
def dbDisconnect(cnx):
    cnx.close()

#Cette fonction verifie l'existance d'une base de donnée
def isDatabaseExisting(mydb, db_name):
    #définir le cursor
    mycursor = mydb.cursor()
    #Création de la requete
    create_request="SHOW DATABASES"
    #Execution de la requete
    mycursor.execute(create_request)
    
    existing = False
    #Parcours des résultats - Chaque ligne représente un tuple
    for x in mycursor:
        #L'index 0 du tupe x contient le nom de la base
        if x[0] == db_name:
            existing = True
            break
    return existing

#Fonction permettant de créer d'une base de données
def createDatabase(mydb):
    #récupération du nom de la base de données
    db_name=input("Please give the database name? \t")
    #définir le cursor
    mycursor = mydb.cursor()
    #Vérification de l'existence d'une base de données portant le même nom
    if not isDatabaseExisting(mydb, db_name):
        #Ecriture de la requete
        create_request=f"CREATE DATABASE {db_name}"
        #Execution de la requête
        mycursor.execute(create_request)
        return True
    else:
        print("The database is already exist. ")
        return False


#Cette fonction verifie l'existance d'une table das la base de donnée
def isTableExisting(mydb, db_name):
    #définir le cursor
    mycursor = mydb.cursor()
    #Création de la requete
    create_request="SHOW TABLES"
    #Execution de la requete
    mycursor.execute(create_request)
    
    existing = False
    #Parcours des résultats - Chaque ligne représente un tuple
    for x in mycursor:
        print(x)
        #L'index 0 du tupe x contient le nom de la base
        if x[0] == db_name:
            existing = True
            break
    return existing

#Fonction permettant de créer une table dans une base de données existant
def createTable(mydb,yourconfig):
    #Récupération du nom de la base de données
    db_name=input("Please give the database name? \t")
    #Récupération du nom de la table
    table_name=input("Please give the table name? \t")

    #Vérification de l'existence de la base de données
    if isDatabaseExisting(mydb, db_name):
        #Mettre fin à la connexion à votre SGBD
        dbDisconnect(mydb)
        #connexion à votre base de donnée
        yourconfig['database']=db_name
        mydb=dbConnect(yourconfig)
        mycursor=mydb.cursor()
        #Vérification de l'existence de la table
        if not isTableExisting(mydb, table_name): 
            #Déclaration d'une table contenant les infos de chaque champ de la base
            tablefield=[]
            #Déclaration d'un dictionaire contenant les types d'u champ
            type_field={1:'INT',2:'VARCHAR(255)',3:'FLOAT',4:'DATETIME'}
            #Ecriture de la requête
            create_request=f"CREATE TABLE {table_name} (CONTENT_REPLACE)"
            content_value=""
            #Récupération des informations de la table
            while True:
                name=input("Please give field name? Press enter to quit\t")
                if name:
                    while True:
                        print("Choice Type of field {name}?")
                        type_choice=input(type_field)
                        if type_choice.isdigit():
                            if int(type_choice) in type_field.keys():
                                tablefield.append(name)
                                content_value+=f"{name} {type_field[int(type_choice)]},"
                                break
                            else:
                                print("Incorrect choice. please Try again")
                        else:
                            print("Choose an integer choice. please Try again")
                    print()
                else:    
                    break
            #Finalisation ecriture requête
            if len(content_value) >0:
                content_value=content_value[:len(content_value)-1]
                while True:
                    pk=input("Choose the primary key field?")
                    if pk in tablefield:
                        content_value+=f",PRIMARY KEY({pk})"
                        break
                    else:
                        print(f"The field {pk} is not existing please verify")
                create_request=create_request.replace('CONTENT_REPLACE',content_value)

                #Execution de la requête
                print("La requête executée : ",create_request)
                mycursor.execute(create_request)
                return True
            else:
                print("The request is not correct.")
                return False
        else:
            print("The table is already existing.")
            return false
    else:
        print(f"La base de données {db_name} est inexistante.")