# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'start!'

User.destroy_all
Universe.destroy_all
Job.destroy_all
Craftman.destroy_all
Workshop.destroy_all

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

wood = Universe.new({ name: "Wood" })
wood.save
puts 'Wood universe created...'

##########################################
carpenter = Job.new({ name: "Carpenter", universe: wood })
carpenter.save

cabinetmaker = Job.new({ name: "Cabinetmaker", universe: wood })
cabinetmaker.save

framer = Job.new({ name: "Framer", universe: wood })
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
    address: "34 rue de la paix, Paris",
    birth_date: "",
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
    address: "34 rue de la paix, Paris",
    birth_date: "",
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
    address: "13 rue des meuniers, 94300 Vincennes",
    birth_date: "",
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
    address: "13 rue des meuniers, 94300 Vincennes",
    birth_date: "",
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
  address: "13 rue des meuniers, 94300 Vincennes",
  birth_date: "",
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
  address: "13 rue des meuniers, 94300 Vincennes",
  birth_date: "",
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
    craftman:     jaqueline
  },
  {
    title:        "Create you jewelery box in marquettry ",
    price:        600,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     emile
  },
  {
    title:        "Design and manufacture your own desktop",
    price:        1000,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     emile
  },
  {
    title:        "Create wooden play for your kid",
    price:        600,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     colin
  },
  {
    title:        "Create your dream furnitures in wood",
    price:        400,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     colin
  },
  {
    title:        "Manufacture a bench for your garden",
    price:        400,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     vincent
  },
  {
    title:        "Learn to sculpt wood",
    price:        500,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     colin
  },
  {
    title:        "Minimalist framing for your pics",
    price:        100,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     francis
  },
  {
    title:        "Frame yourself your paintings",
    price:        300,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     francis
  },
  {
    title:        "Frame your bedroom mirror",
    price:        300,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!",
    craftman:     thomas
  }

]
Workshop.create!(workshop_attributes)
puts '10 workshops created...'

###############################
# SEEDS FOR OTHER UNIVERSE... #
###############################

puts 'Finished!'
