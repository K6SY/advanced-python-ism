# Environnement virtuel

Les programmes Python utilisent souvent des paquets et modules qui ne font pas partie de la bibliothèque standard. Ils nécessitent aussi, parfois, une version spécifique d'une bibliothèque, par exemple parce qu'un certain bogue a été corrigé ou encore que le programme a été implémenté en utilisant une version obsolète de l'interface de cette bibliothèque.

Cela signifie qu'il n'est pas toujours possible, pour une installation unique de Python, de couvrir tous les besoins de toutes les applications. Basiquement, si une application A dépend de la version 1.0 d'un module et qu'une application B dépend de la version 2.0, ces dépendances entrent en conflit et installer la version 1.0 ou 2.0 laisse une des deux applications incapable de fonctionner.

Le module utilisé pour créer et gérer des environnements virtuels s'appelle venv.

## Gestion d'un environnement virtuel

1. Création environnment virtuel

    *python -m venv evironment_name*

2. Activation environnement virtuel

    1. **Windows cmd**

        `*.\evironment_name\Script\activate.bat*`

    2. **Windows Powershell**

        ` *.\evironment_name\Script\Activate.ps1*`

        NB: Powershell bloque par défaut l'execution de scripts. Pour autoriser l'execution des scripts:
            * Executer powershell en tant qu'Administrateur 
            * Taper puis valider la commande suivante : `*Set-ExecutionPolicy RemoteSigned*`

    3. **Linux / Mac Terminal**

        `*source evironment_name/bin/activate*`

Le nom choisi pour l'environnement virtuel dans cet espace est : *advanced-training*
