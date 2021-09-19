# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Venue.create(
  name: 'Marousi Tennis Club',
  short_description: 'Χώρος για τένις',
  long_description:
    'Πλήρεις εγκαταστάσεις με γήπεδα τένις, πισίνα και εστιατόριο',
  address: 'Σισμανόγλειου 74, Μαρούσι 151 26',
  lat: '38.048581',
  lng: '23.815902',
)

Venue.create(
  name: 'Γήπεδο Ποδοσφαίρου 5Χ5',
  short_description: 'Προπονήσεις 5x5',
  long_description: 'Μοντέρνα εγκατάσταση με γρασίδι',
  address: 'Ηλείας 14, Μεταμόρφωση 144 51',
  lat: '38.056495',
  lng: '23.766847',
)
