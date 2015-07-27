Spot.create address: 'Skatepark Manzanares, 28045 Madrid', latitude: 40.395473, longitude: -3.703388, level: 'Advanced', photo: 'http://www.streetboardermag.com/wp-content/uploads/2013/08/arg.jpg'
Spot.create address: 'Calle de Valdetorres de Jarama 1, 28043 Madrid', latitude: 40.472459, longitude: -3.6476884, level: 'Intermediate', photo: 'http://www.go-skateboarding.com/wp-content/uploads/2010/06/imagen-1.jpg'
Spot.create address: 'Calle Fco. de Goya, S/N 28660 Boadilla del Monte', latitude: 40.4037715, longitude: -3.8897478, level: 'Intermediate', photo: 'http://www.skateboard.com.au/images/matarord1.jpg'
#Spot.create address: 'Avenida Don Miguel Cervantes, S/N 28108 Alcobendas, Madrid', latitude: 40.5525222, longitude: -3.6477498, level: 'Advanced', photo: 'http://dailyskateboarding.com/wp-content/uploads/2013/09/IkerFsIndy.jpg'
#Spot.create address: 'Calle Telémaco 11, 28850 Torrejón de Ardoz, Madrid', latitude: 40.45123, longitude: -3.4739, level: 'Advanced', photo: 'http://spd.fotolog.com/photo/29/39/33/skateparks/1225055163780_f.jpg'

Skater.create name: 'JC', email: 'jc@gmail.com', password: 'jc'
Skater.create name: 'Sam', email: 'sam@gmail.com', password: 'sam'
Skater.create name: 'Matt', email: 'matt@gmail.com', password: 'matt'

Trick.create skater_id: 1, spot_id: 1, video: 'https://vine.co/v/OinxDXne6XO', average_rating: 4
Trick.create skater_id: 1, spot_id: 2, video: 'https://vine.co/v/OeUJLm2lJpI', average_rating: 3
Trick.create skater_id: 2, spot_id: 3, video: 'https://vine.co/v/OhDYv2v0xwe', average_rating: 5
Trick.create skater_id: 2, spot_id: 1, video: 'https://vine.co/v/ObbLUAqreDF', average_rating: 2
Trick.create skater_id: 3, spot_id: 2, video: 'https://vine.co/v/ObKD3Fjea2m', average_rating: 4
Trick.create skater_id: 3, spot_id: 3, video: 'https://vine.co/v/OqJTEEwUQDM', average_rating: 1

Jam.create name: 'Ironhack Meeting', spot_id: 2, date: 'Sat, 11 Jul 2015', time: '16:00:00 UTC', info: 'Ironhack best developers'
Jam.create name: 'Sk8 Punx', spot_id: 3, date: 'Sat, 11 Jul 2015', time: '16:00:00 UTC', info: 'You will need to carry a skateboard with you'

Attendance.create jam_id: 1, skater_id: 2, role: 'Teacher'
Attendance.create jam_id: 1, skater_id: 3, role: 'Spectator'

Challenge.create challenger_id: 2, skater_id: 1, challenge_spot: 1, challenge: 'Ollie', state: 'pending'
Challenge.create challenger_id: 2, skater_id: 1, challenge_spot: 1, challenge: 'Manual', state: 'completed'
Challenge.create challenger_id: 2, skater_id: 1, challenge_spot: 2, challenge: 'Heelflip', state: 'pending'
Challenge.create challenger_id: 1, skater_id: 2, challenge_spot: 2, challenge: 'No Comply 180', state: 'completed'
Challenge.create challenger_id: 2, skater_id: 1, challenge_spot: 3, challenge: 'Hard Flip', state: 'pending'
Challenge.create challenger_id: 1, skater_id: 2, challenge_spot: 1, challenge: 'Kickflip', state: 'pending'
Challenge.create challenger_id: 1, skater_id: 2, challenge_spot: 2, challenge: 'Pop Shove-It', state: 'pending'