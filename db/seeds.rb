# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'start!'

Booking.destroy_all
User.destroy_all
Universe.destroy_all
Job.destroy_all
Craftman.destroy_all
Workshop.destroy_all

def open_photo(filename)
   File.open(Rails.root.join("db", "images_seeds", filename))
end

puts 'database cleaned...'

##########################################

loic = User.new({
  email: "loic@exemple.com",
  password: "password",
  first_name: "Loïc",
  last_name: "Cessot",
  phone: "06 10 11 22 09"
  })
loic.save

kevin = User.new({
  email: "kevin@exemple.com",
  password: "password",
  first_name: "Kevin",
  last_name: "Berthier",
  phone: "07 65 34 39 45"
  })
kevin.save
puts '2 users created...'

###########################
# SEEDS FOR WOOD UNIVERSE #
###########################

wood = Universe.new({
  name: "Wood",
  code: "wood",
  banner: open_photo("wood_univers.jpg"),
  banner_bottom: open_photo("copeaux.jpg"),
  top_gallery: open_photo("wood_dentelle.jpg"),
  middle_gallery: [open_photo("wood_workshop.jpg"),open_photo("wood_sciure.jpg")],
  gallery: [open_photo("wood_art.jpg"), open_photo("wood_art.jpg"), open_photo("wood_art.jpg")],
  artisan_profile: open_photo("wood_workshop.jpg"),
  artisan_hands: open_photo("wood_hands.jpg")
})
wood.save!
puts 'Wood universe created...'

##########################################
carpenter = Job.new({
  name: "Carpenter",
  universe: wood,
  image: open_photo("carpenter.jpg")
  })
carpenter.save

cabinetmaker = Job.new({
  name: "Cabinetmaker",
  universe: wood,
  image: open_photo("wood_univers.jpg")
  })
cabinetmaker.save

framer = Job.new({
  name: "Framer",
  universe: wood,
  image: open_photo("framer.jpg")
  })
framer.save
puts '3 jobs created for wood universe...'

##########################################

colin = Craftman.new(
  {
    email: "colin@exemple.com",
    password: "password",
    first_name: "Colin",
    last_name: "Farel-williams",
    phone: "07 85 45 34 78",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    address: "Place Pey Berland, 33000 Bordeaux",
    birth_date: "01/12/1940",
    job: carpenter
  })
colin.save

vincent = Craftman.new(
  {
    email: "vincent@exemple.com",
    password: "password",
    first_name: "Vincent",
    last_name: "Timent",
    phone: "07 85 45 34 78",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    address: "Piazza del Duomo, 56126 Pisa PI, Italie",
    birth_date: "11/11/1987",
    job: carpenter
  })
vincent.save

emile = Craftman.new(
  {
    email: "emile@exemple.com",
    password: "password",
    first_name: "Emile",
    last_name: "Etimage",
    phone: "06 23 34 78 09",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    address: "1 Rue de Kiel, 29200 Brest",
    birth_date: "03/08/1956",
    job: cabinetmaker
  })
emile.save

jaqueline = Craftman.new(
  {
    email: "jaqueline@exemple.com",
    password: "password",
    first_name: "Jaqueline",
    last_name: "startoup",
    phone: "06 23 34 78 09",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    address: "Patio de Banderas, s/n, 41004 Sevilla, Espagne",
    birth_date: "10/12/1987",
    job: cabinetmaker
  })
jaqueline.save

francis = Craftman.new(
  {
  email: "francis@exemple.com",
  password: "password",
  first_name: "Francis",
  last_name: "Caterelle",
  phone: "07 56 45 23 11",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
  address: "55 Rue du Faubourg Saint-Honoré, 75008 Paris",
  birth_date: "10/10/2000",
  job: framer
  })
francis.save

thomas = Craftman.new(
  {
  email: "thomas@exemple.com",
  password: "password",
  first_name: "Thomas",
  last_name: "Tauton",
  phone: "06 16 55 23 21",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
  address: "17 Rue des Braves, 13007 Marseille",
  birth_date: "12/12/1937",
  job: framer
  })
thomas.save

puts '6 craftmen created...'

##########################################

workshop_attributes = [
  {
    title:        "Your wooden table in one day",
    price:        500,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     jaqueline,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Create you jewelery box in marquettry ",
    price:        600,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     emile,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Design and manufacture your own desktop",
    price:        1000,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     emile,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Create wooden play for your kid",
    price:        600,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     colin,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Create your dream furnitures in wood",
    price:        400,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     colin,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Manufacture a bench for your garden",
    price:        400,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     vincent,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Learn to sculpt wood",
    price:        500,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     colin,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Minimalist framing for your pics",
    price:        100,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     francis,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Frame yourself your paintings",
    price:        300,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     francis,
    artisan_pic:  open_photo("wood_workshop.jpg")
  },
  {
    title:        "Frame your bedroom mirror",
    price:        300,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     thomas,
    artisan_pic:  open_photo("wood_workshop.jpg")
  }

]
Workshop.create!(workshop_attributes)
puts "#{workshop_attributes.count} workshops created..."


first_booking = Booking.new({
  user: loic,
  workshop: Workshop.first,
  date_check_in: Date.today,
  date_check_out: Date.tomorrow + 1,
  status: :submitted,
  total_price: 3000,
  })
first_booking.save

second_booking = Booking.new({
  user: loic,
  workshop: Workshop.last,
  date_check_in: Date.today,
  date_check_out: Date.tomorrow + 1,
  status: :accepted,
  total_price: 4000,
  })
second_booking.save
puts '2 bookings created...'



###############################
# SEEDS FOR OTHER UNIVERSE... #
###############################

puts 'Finished!'
