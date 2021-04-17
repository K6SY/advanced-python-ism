#Création d'un dictionnaire contenant la configuration de la base de données mysql
config = {
  'user': 'smc',
  'password': 'sco2019',
  'host': '127.0.0.1',
  'database': None,
  'raise_on_warnings': True
}

#Dictionnaire contenant la structure des tables
structureTable={
    'Categorie': ('nom','description'),
    'Produit': ('categorie_id','nom','marque','vendable','prix')
}