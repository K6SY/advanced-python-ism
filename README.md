# Gestion d'un SBGD MySQL

L'objectif est de voir comment se conecter à une base de données et d'effectuer des requêtes (select, insert, delete,update).

* Le fichier **common.py** est un module contenant des fonctions permettant de faire des opérations sur une base mysql
* Le fichier **database-admin.py** est le programme principal à exécuter pour manager votre database
* Le fichier **database-admin.py** est le programme principal à exécuter pour l'exploitation votre database

## Préparation de l'environnement

1. Recréer l'evironnement virtuel

    *`python -m venv environment_name`*

2. Activation environnement virtuel

    1. **Windows cmd**

        *`.\environment_name\Scripts\activate.bat`*

    2. **Windows Powershell**

        *`.\environment_name\Scripts\Activate.ps1`*

        NB: Powershell bloque par défaut l'execution de scripts. Pour autoriser l'execution des scripts:
            * Executer powershell en tant qu'Administrateur 
            * Taper puis valider la commande suivante : *`Set-ExecutionPolicy RemoteSigned`*

    3. **Linux / Mac Terminal**

        *`source environment_name/bin/activate`*

3. Installation des dépendances

    *`pip install -r requirements.txt`*

4. Vérification que votre base de données est bien démarré 

5. Remplacement des caractères "*******" dans le dictionnaire config du fichier common.py 

## Administration de votre SBGD

Vous pouvez executer les requêtes contenues dans le fichier **eshop.sql** afin de poursuivre.

Deux opérations sont disponibles à date. 
* Création d'une base de données
* Création d'une table simple (sans clé-étrangère)
* Selection de données dans une table
* Insertion de données dans une table
* Mise à jour des données dans une table

1. Pour l'administration, Executer le programme principal: *`python database-admin.py`*

1. Pour l'exploitation, Executer le programme principal: *`python database-use.py`*

