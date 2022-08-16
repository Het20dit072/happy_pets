import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_pets/widgets/pet_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int selectedCategory = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        backgroundColor: Color(0xffDFF8EB),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xffDFF8EB),
          elevation: 0.0,
          title: Text('HAPPY PETS', style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
          leading: IconButton(
          icon: Image.asset("assets/HomePage/menu.png",
          color: Color(0xFF214E34),

          
           height: 22,),
          onPressed: (){
            scaffoldKey.currentState?.openDrawer();
          }
      
        ),
        
    ), 
    body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(30.0),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(15.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      suffixIcon: Icon(Icons.sort,color: Colors.white,),
                      filled: true,
                      fillColor: Color.fromRGBO(33, 78, 52, 0.757),
                      hintText: 'Search Pet',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
      height: 120,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: customShadow,
                      border: selectedCategory == index
                          ? Border.all(
                              color: secondaryGreen,
                              width: 3,
                            )
                          : Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      categories[index]['iconPath'],
                      scale: 1.8,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  categories[index]['name'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    )
          ]
        ),
    ),
    drawer: SafeArea(
        child: Drawer(
          child: Container(
      color: Color.fromARGB(255, 175, 202, 143),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              20,40,20,0
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Het Prajapati',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.brown,
                      ),
                    ),
                    Text(
                      'Active status',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: drawerItems
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            e['icon'],
                            color: Colors.black,
                            size: 24,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            e['title'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.gear_alt,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 20,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ))
    )));
  }
}