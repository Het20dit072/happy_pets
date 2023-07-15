enum Category { CAT, DOG, BUNNY, HAMSTER }
enum Condition { Adoption, shelter }

class Pet {

  String name;
  String location;
  String distance;
  String condition;
  Category category;
  String imageUrl;
  bool favorite;
  bool newest;
  String months;
  String color;
  String weight;
  String username;
  String userimage;
  String usernumber;
  

  Pet(this.name, this.location, this.distance, this.condition, this.category, this.imageUrl, this.favorite, this.newest,this.color,this.months,this.weight,this.username,this.userimage, this.usernumber);

}


List<Pet> getPetList(){
  return <Pet>[
    Pet("Abyssinian Cats", "petlad", "7", "Adoption", Category.CAT, "images/cats/cat_1.jpg", true, true,"Brown","3" , "15","sahil Patel","images/user1.png","8238498758"),
    Pet("Scottish Fold", "petlad", "7", "Adoption", Category.CAT, "images/cats/cat_2.jpg", false, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9586829533"),
    Pet("Ragdoll", "anand", "17", "Adoption", Category.CAT, "images/cats/cat_3.jpg", false, false,"Brown","3" , "15","dhruvin Patel","images/userm2.png","9099030299"),
    Pet("Burmés", "anand", "17", "shelter", Category.CAT, "images/cats/cat_4.jpg", true, true,"Brown","3" , "15","riya Patel","images/userf3.png","9426920533"),
    Pet("American Shorthair", "anand", "18", "Adoption", Category.CAT, "images/cats/cat_5.jpg", true, false,"Brown","3" , "15","sahil Patel","images/user1.png","8238498758"),
    Pet("British Shorthair", "noida", "390", "shelter", Category.CAT, "images/cats/cat_6.jpg", false, false,"Brown","3" , "15","raj Patel","images/userm2.png","9426920533"),
    Pet("Abyssinian Cats", "nadiad", "15", "Adoption", Category.CAT, "images/cats/cat_7.jpg", true, false,"Brown","3" , "15","kunj Patel","images/user1.png","9426920533"),
    Pet("Scottish Fold", "nadiad", "15", "shelter", Category.CAT, "images/cats/cat_8.jpg", false, false,"Brown","3" , "15","het Patel","images/userm2.png","9426920533"),
    Pet("Ragdoll", "changa", "1.2", "Adoption", Category.CAT, "images/cats/cat_9.jpg", false, true,"Brown","3" , "15","sahil Patel","images/user1.png","8238498758"),

    Pet("Roborowski", "mumbai", "400", "Adoption", Category.HAMSTER, "images/hamsters/hamster_1.jpg", true, true,"Brown","3" , "15","sahil Patel","images/user1.png","9099030299"),
    Pet("Ruso", "nagpur", "500", "shelter", Category.HAMSTER, "images/hamsters/hamster_2.jpg", false, false,"Brown","3" , "15","dhruvin Patel","images/userm2.png","9099030299"),
    Pet("Golden", "changa", "2", "Adoption", Category.HAMSTER, "images/hamsters/hamster_3.jpg", false, false,"Brown","3" , "15","rahul Patel","images/user1.png","9099030299"),
    Pet("Chinese", "surat", "200", "Adoption", Category.HAMSTER, "images/hamsters/hamster_4.jpg", true, true,"Brown","3" , "15","rishi Patel","images/userm2.png","9099030299"),
    Pet("Dwarf Campbell", "noida", "400", "Adoption", Category.HAMSTER, "images/hamsters/hamster_5.jpg", true, false,"Brown","3" , "15","aum Patel","images/userm2.png","9099030299"),
    Pet("Syrian", "mumbai", "400", "Adoption", Category.HAMSTER, "images/hamsters/hamster_6.jpg", false, false,"Brown","3" , "15","aum yadav","images/user1.png","9099030299"),
    Pet("Dwarf Winter", "changa", "0", "shelter", Category.HAMSTER, "images/hamsters/hamster_7.jpg", true, false,"Brown","3" , "15","raj Patel","images/user1.png","9099030299",),

    Pet("American Rabbit", "mumbai", "100", "Adoption", Category.BUNNY, "images/bunnies/bunny_1.jpg", true, true,"Brown","3" , "15","kedar Patel","images/userm2.png","9099030299"),
    Pet("Belgian Hare Rabbit", "nagpur", "100", "shelter", Category.BUNNY, "images/bunnies/bunny_2.jpg", false, false,"Brown","3" , "15","kedar dave","images/userm2.png","9099030299"),
    Pet("Blanc de Hotot", "changa", "100", "Adoption", Category.BUNNY, "images/bunnies/bunny_3.jpg", false, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("mumbain Rabbits", "surat", "100", "Adoption", Category.BUNNY, "images/bunnies/bunny_4.jpg", true, true,"Brown","3" , "15","sahil Patel","images/userm2.png","9099030299"),
    Pet("Checkered Giant Rabbit", "noida", "100", "Adoption", Category.BUNNY, "images/bunnies/bunny_5.jpg", true, false,"Brown","3" , "15","pranshu Patel","images/userm2.png","9099030299"),
    Pet("Dutch Rabbit", "mumbai", "100", "Adoption", Category.BUNNY, "images/bunnies/bunny_6.jpg", false, false,"Brown","3" , "15","krishna Patel","images/userf3.png","9099030299"),
    Pet("English Lop", "changa", "100", "shelter", Category.BUNNY, "images/bunnies/bunny_7.jpg", true, false,"Brown","3" , "15","krish shah","images/userm2.png","9099030299"),
    Pet("English Spot", "mumbai", "100", "Adoption", Category.BUNNY, "images/bunnies/bunny_8.jpg", true, true,"Brown","3" , "15","mukund Patel","images/userm2.png","9099030299"),

    Pet("Affenpinscher", "mumbai", "100", "Adoption", Category.DOG, "images/dogs/dog_1.jpg", true, true,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Akita Shepherd", "nagpur", "100", "shelter", Category.DOG, "images/dogs/dog_2.jpg", false, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("American Foxhound", "changa", "100", "Adoption", Category.DOG, "images/dogs/dog_3.jpg", false, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Shepherd Dog", "surat", "100", "Adoption", Category.DOG, "images/dogs/dog_4.jpg", true, true,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Australian Terrier", "noida", "100", "Adoption", Category.DOG, "images/dogs/dog_5.jpg", true, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Bearded Collie", "mumbai", "100", "Adoption", Category.DOG, "images/dogs/dog_6.jpg", false, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Belgian Sheepdog", "changa", "100", "shelter", Category.DOG, "images/dogs/dog_7.jpg", true, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Bloodhound", "mumbai", "100", "Adoption", Category.DOG, "images/dogs/dog_8.jpg", true, true,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299",),
    Pet("Boston Terrier", "mumbai", "100", "Adoption", Category.DOG, "images/dogs/dog_9.jpg", true, true,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Chinese Shar-Pei", "nagpur", "100", "shelter", Category.DOG, "images/dogs/dog_10.jpg", false, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Border Collie", "changa", "100", "adoption", Category.DOG, "images/dogs/dog_11.jpg", false, false,"Brown","3" , "15","varshil Patel","images/userm2.png","9099030299"),
    Pet("Chow Chow", "surat", "100", "shelter", Category.DOG, "images/dogs/dog_12.jpg", true, true,"Brown","3" , "15","Het Prajapati","images/userm2.png","9426920533"),
  ];
}

class user {

  String name;
  String imageurl;
  user(this.name,this.imageurl,);

}
List<user> getuserList(){
  return <user>[
    user("Sahil Patel", "images/cats/cat_1.jpg", ),
    user("varshil Patel", "images/cats/cat_1.jpg", ),
    user("Dhruvin Patel", "images/cats/cat_1.jpg", ),
    user("Riya Patel", "images/cats/cat_1.jpg", ),
    user("preshna Patel", "images/cats/cat_1.jpg", ),
    user("keval Patel", "images/cats/cat_1.jpg", ),
    user("Het Prajapati", "images/cats/cat_1.jpg", ),
    user("Niyati Shah", "images/cats/cat_1.jpg", ),
    user("kedar dave", "images/cats/cat_1.jpg", ),
    user("aalisha desai", "images/cats/cat_1.jpg", ),
    user("Jeel joshi", "images/cats/cat_1.jpg", ),
    user("pranshu patel", "images/cats/cat_1.jpg", ),
    user("kunj shah", "images/cats/cat_1.jpg", ),
    
  ];
}