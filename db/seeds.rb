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
  description: "Wood is a soft and living material rich in a multitude of essences. A natural product that must dry slowly before being shaped.",
  second_description: "“There is a magical, contemplative feeling
          in the forest. We encourage people to visit,
          to take this journey, and over the decades,
          watch the forest grow and change. Year by
          year, the writers' words forming invisible
          chapters in the trees whose narratives will
          be reconstituted a century later.”",
  third_description: "Since prehistoric times, wood has allowed the man to make fire, to build shelters or to make tools and weapons. Some of the most important inventions of the civilized world - the wheel, the printing press and the first computer, the abacus - were first made of wood. Nowadays, the uses of this material remain as varied as in the past.",
  fourth_description: "The more one knows about the unique characteristics of wood and its source, the better one can understand the degree of warmth and beauty that it brings to our everyday décor.Each grain pattern is a unique masterpiece of design, texture and splendor. Even what some may view as a defect, like a knot or other natural blemishes, can add more beauty and character to any given piece of furniture.",

  banner: open_photo("wood_univers.jpg"),
  banner_bottom: open_photo("copeaux.jpg"),
  collage: open_photo("background_wood.png"),
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

guillaume = Craftman.new(
  {
    email: "guillaume@exemple.com",
    password: "password",
    first_name: "Guillaume",
    last_name: "Bouvet",
    phone: "07 85 45 34 78",
    description: "We love wood because we have known it our entire life. From the forest we played in as children, to the calling to which we have dedicated our adulthood.",
    second_description: "Because we love wood, we want to share this love with you by producing furniture for people who share our passion for wood and top quality furniture.",
    address: "108 Rue Thimonnier, 69530 Brignais",
    locality: "Brignais",
    birth_date: "01/12/1970",
    job: carpenter,
    # avatar: open_photo("guillaume.jpg")
  })
guillaume.save

sarah = Craftman.new(
  {
    email: "sarah@exemple.com",
    password: "password",
    first_name: "Sarah",
    last_name: "Carrucan",
    phone: "61597946943",
    description: "Wood and life are inextricably connected, and wood is literally life to us. Therefore, we use solid wood from renewable resources in our production to reveal the oganic beauty of wood texture and that enable it to 'breathe' naturally.",
    second_description: "This emphasizes the natural colour diversity, while the use of harmful chemical substances for wood treatment is avoided by using vinyl-based glue.",
    address: "Warrnambool, VIC, 3280 Australia",
    locality: "Warrnambool",
    birth_date: "11/11/1987",
    job: carpenter,
    # avatar: open_photo("sarah.jpg")
  })
sarah.save

andrew = Craftman.new(
  {
    email: "andrew@exemple.com",
    password: "password",
    first_name: "Andrew",
    last_name: "Wainwright",
    phone: "(519) 575-9043",
    description: "The fundamental is my need to express myself using both my mind and my hands. For me, my work is as much about the process itself, whether it be designing, or solving technical challenges to realize my vision, as it is about the finished piece.",
    second_description: "As a woodworker, my intent is to convey to the viewer an awareness of the powerful synergies that develop between form and the inherently sensual nature of wood.",
    address: "44 Otonabee Dr Unit 3, Kitchener, ON N2C 1L6, Canada",
    locality: "Kitchener",
    birth_date: "03/08/1956",
    job: cabinetmaker,
    # avatar: open_photo("andrew.jpg")
  })
andrew.save

laura = Craftman.new(
  {
    email: "laura@exemple.com",
    password: "password",
    first_name: "Laura",
    last_name: "Mccuscker",
    phone: "0401 400 634",
    description: "We give our wood only into the hands of those designers who share our love of wood. Our plant and our artisans are equipped and trained to offer designers as much freedom and options as possible in order for them to realize their vision.",
    second_description: "Further more we encourage the designers to create each piece with their own artistic signature insisting that every such piece is worthy of the precious material it was made from, thus conveying our philosophy of love of wood.",
    address: "PO BOX 3089 WEST HOBART TASMANIA 7000",
    locality: "west hobart",
    birth_date: "10/12/1987",
    job: cabinetmaker,
    # avatar: open_photo("laura.jpg")
  })
laura.save

ernest = Craftman.new(
  {
  email: "ernest@exemple.com",
  password: "password",
  first_name: "Ernest",
  last_name: "Thompson",
  phone: "(505) 988–1229",
    description: "Hands are our basic equipment and the control point in our woodwork. From a tree to a chair, our wood travels from the hands of one artisan to another. Wood selection, its preparation for production, rough processing and assembling, finishing and protection...",
    second_description: "At every moment their sharp eye and infallible touch guarantee an individual approach that results in a top quality product or, more precisely, handicraft.",
  address: "1512 Pacheco St, Santa Fe, NM 87505, united states",
  locality: "Santa Fe",
  birth_date: "10/10/2000",
  job: framer,
  # avatar: open_photo("ernest.jpg")
  })
ernest.save

thomas = Craftman.new(
  {
  email: "thomas@exemple.com",
  password: "password",
  first_name: "Thomas",
  last_name: "Tauton",
  phone: "01 43 59 94 51",
    description: "Because we love wood, we collaborate with the best regional and global designers who are familiar with our technological advantages and who know how to convey the expertise into a vision that is worthy of this precious material.",
    second_description: "Because we love wood, our main production tools are the hands of our artisans, masters who daily turn designers’ visions into unique handicraft.",
  address: "15 rue Jean Mermoz, 75008 Paris",
  locality: "Paris",
  birth_date: "12/12/1937",
  job: framer,
  # avatar: open_photo("thomas.jpg")
  })
thomas.save

puts '6 craftmen created...'

##########################################

workshop_attributes = [
  {
    title:        "Your scandi style wooden table in 2 days",
    price:        2000,
    description:  "Curved lines at the corners of the dining table soften the silhouette, while the angled legs add a striking edge to the design.Crafted from robust solid oak legs, this table and bench set is made for everyday use. In a lacquer finish to protect it from wear and tear.",
    craftman:     laura,
    # artisan_pic:  open_photo("wood_workshop.jpg"),
    skills:       "Understand How Wood Works and Behaves, Use a Hand Plane, Cut a Mortise and Tenon Joint, master sharpen saws, Prep Lumber With Hand Tools, Cut a Mortise and Tenon Joint, surface finishing ."
  },
  {
    title:        "Create your own rocking chair in tropical wood",
    price:        3000,
    description:  "A hand carved seat and well balanced rockers make this a very comfortable chair. The rockers are constructed by way of lamination - timber is cut into thin strips and then glued together in the desired shape. This method provides exceptional strength. Joins are mortice and tenoned and the main joins are also dowelled for extra strength. The chair is handed sanded and finished with an oil and wax finish.",
    craftman:     sarah,
    # artisan_pic:  open_photo("chair_tropical.jpg"),
    # changer le nom
    skills:       "Understand How Wood Works and Behaves, Use a Hand Plane, Cut a Mortise and Tenon Joint, master sharpen saws."
  },
  {
    title:        "Create some wooden plays for your kid",
    price:        200,
    description:  "We are going to make possible your children to play with their favorite football team members made in the purest wood from Jura. With a striker and a goal keeper, marbles are being turned into ballon d'or! Each box includes 2 wooden players, 1 wooden goal, 3 colored marbles according to the team and 3 stickers to custom the wooden pieces.",
    craftman:     guillaume,
    artisan_pic:  open_photo("wooden-play.jpg"),
    skills:       "Understand How Wood Works and Behaves, Use Sharpen Saws, Furniture finishing."
  },
  {
    title:        "Your dream design desk in walnut made in 3 days",
    price:        3000,
    description:  "This is one of the best desk designs when it comes to storage space. This well-designed Desk holds stacks of paper and files in a neat compartment under the desk, helping you clear all the clutter on the desks` surface. Even if underneath the desk there are files and folders, this is not an impediment for a comfortable seating experience.",
    craftman:     guillaume,
    artisan_pic:  open_photo("wood_workshop.jpg"),
    skills:       "Understand How Wood Works and Behaves, Use Sharpen Saws, Planes, and Chisels, Cut Dovetail Joints, Furniture finishing."
  },
  {
    title:        "Bring to life a design bench for your garden",
    price:        2000,
    description:  "This simple bench or banquette is a stunner with it’s clean lines and slightly coastal feel! This is the perfect little seating piece for outside, perhaps with a dining table or even configured with a corner unit into a nook like arrangement. That would look equally as fabulous inside or out!",
    craftman:     andrew,
    artisan_pic:  open_photo("wood_workshop.jpg"),
    skills:       "Understand How Wood Works and Behaves, Use Sharpen Saws, Planes, and Chisels, Cut Dovetail Joints, Furniture finishing."
  },
  {
    title:        "Wood carving for beginners: how to get started !",
    price:        500,
    description:  "Wood carving is a fun, accessible, and creative craft that doesn’t require a fancy studio, or equipment. All you need is a piece of wood and something sharp to carve it with. Of course, what kind of wood and what kind of carving tools you pick will affect the difficulty, safety, and result of your wood carving endeavors. In this wood carving for beginners guide, we’ll go over some of the most important information a new craftsman or craftswoman needs to know to get started.",
    craftman:     guillaume,
    artisan_pic:  open_photo("wood_workshop.jpg"),
    skills:       "Understand How Wood Works and Behaves, Use Sharpen Saws, Planes, and Chisels."
  },
  {
    title:        "Minimalist framing for family pictures",
    price:        300,
    description:  "Many collectors and artists have an eye for selecting the right frame and can make sound decisions with little guidance from a professional. Don’t underestimate the importance of framing your pictures too in the most suitable and visually attractive way. We will learn how to make the right selections through minimalist examples, and your pictures will bring pleasure for generations.",
    craftman:     ernest,
    artisan_pic:  open_photo("wood_workshop.jpg"),
    skills:       "Understand How Wood Works and Behaves, Master Sharpen Saws, Planes, and Chisels, Cut Dovetail Joints, Lacquer your frame."
  },
  {
    title:        "learn how to frame your paintings with taste",
    price:        600,
    description:  "Like the setting for a diamond, the frame around a work of art is the finishing touch, the element that completes and elevates a painting, presenting it to the viewer in its best possible light. Framing, however, is an art in and of itself, and just as a good frame choice can greatly enhance the appearance of a work, a poor frame choice can drastically diminish a work.",
    craftman:     thomas,
    artisan_pic:  open_photo("wood_workshop.jpg"),
    skills:       "Understand How Wood Works and Behaves, Master Sharpen Saws, Planes, and Chisels, Cut Dovetail Joints, Finish your frame with the right wood spicies lacquer."
  },

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

glass = Universe.new({
  name: "Glass",
  code: "glass",
  banner: open_photo("glass_univers.jpg"),
  collage: open_photo("background_glass.png"),
})
glass.save!
puts 'Glass universe created...'

###############################

metal = Universe.new({
  name: "Metal",
  code: "metal",
  banner: open_photo("metal_univers.jpg"),
  collage: open_photo("background_metal.png"),
})
metal.save!
puts 'Metal universe created...'

###############################

clay = Universe.new({
  name: "Clay",
  code: "clay",
  banner: open_photo("clay_univers.jpg"),
  collage: open_photo("background_clay.png"),
})
clay.save!
puts 'Clay universe created...'

###############################

stone = Universe.new({
  name: "Stone",
  code: "stone",
  banner: open_photo("stone_univers.jpg"),
  collage: open_photo("background_stone.png"),
})
stone.save!
puts 'Stone universe created...'

###############################

fabric = Universe.new({
  name: "Fabric",
  code: "fabric",
  banner: open_photo("fabric_univers.jpg"),
  collage: open_photo("background_fabric.png"),
})
fabric.save!
puts 'Fabric universe created...'

###############################

leather = Universe.new({
  name: "Leather",
  code: "leather",
  banner: open_photo("leather_univers.jpg"),
  collage: open_photo("background_leather.png"),
})
leather.save!
puts 'Leather universe created...'

###############################

puts 'Finished!'
