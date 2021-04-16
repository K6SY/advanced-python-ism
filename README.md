# Gestion d'un SBGD MySQL

L'objectif est de voir comment se conecter à un SGBD Mysql et de créer une base de données et des tables.

* Le fichier **common.py** est un module contenant des fonctions permettant de faire des opérations sur une base mysql
* Le fichier **database-admin.py** est le programme principal à exécuter pour manager votre database 

## Préparation de l'environnement

1. Activation environnement virtuel

    1. **Windows cmd**

        *`.\evironment_name\Scripts\activate.bat`*

    2. **Windows Powershell**

        *`.\evironment_name\Scripts\Activate.ps1`*

        NB: Powershell bloque par défaut l'execution de scripts. Pour autoriser l'execution des scripts:
            * Executer powershell en tant qu'Administrateur 
            * Taper puis valider la commande suivante : *`Set-ExecutionPolicy RemoteSigned`*

    3. **Linux / Mac Terminal**

        *`source evironment_name/bin/activate`*

2. Installation du package mysql-connector-python

    *`pip install mysql-connector-python`*

3. Vérification que votre base de données est bien démarré 

4. Remplacement des caractères "*******" dans le dictionnaire config du fichier common.py 

## Administration de votre SBGD

Deux opérations sont disponibles à date. 
* Création d'une base de données
* Création d'une table simple (sans clé-étrangère)

1. Executer le programme principal: *`python database-admin.py`*
