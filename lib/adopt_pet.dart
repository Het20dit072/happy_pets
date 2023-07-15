import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:happy_pets/Add_Image.dart';

import 'package:happy_pets/widgets/pet_cards.dart';

class Pet_Details_Adopt extends StatefulWidget {
  const Pet_Details_Adopt({Key? key}) : super(key: key);

  @override
  State<Pet_Details_Adopt> createState() => _Pet_Details_AdoptState();
}

FirebaseAuth auth = FirebaseAuth.instance;
final TextEditingController _PetNameController = TextEditingController();
final TextEditingController _PetController = TextEditingController();
final TextEditingController _PetBreedController = TextEditingController();
final TextEditingController _AgeController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();

String fullName = '';
var dropdownvalue;
User? user = FirebaseAuth.instance.currentUser;

class _Pet_Details_AdoptState extends State<Pet_Details_Adopt> {
  @override
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkBox1 = false;
  bool checkBox2 = false;
  String _SelectedPetSex = "Male";
  List _petSex = ['Male', 'Female'];
  String _selectedPet = "Dog";
  var PetCategory = {
    'Dog': '1',
    'Cat': '2',
    'Bunny': '3',
    'Bird': '4',
    'Horse': '5'
  };

  List _pets = [];
  PetDependentDropDown() {
    PetCategory.forEach((key, value) {
      _pets.add(key);
    });
  }

  String _selectedBreed = "Beagles";
  var PetBreed = {
    'Beagles': '1',
    'German Shepherd': '1',
    'Great Dane': '1',
    'Boxer': '1',
    'Labrador Retriever': '1',
    'Rottweiler': '1',
    'Pug': '1',
    'Golden Retriever': '1',
    'Billy / Billi': '2',
    'Persian Cat': '2',
    'Bombay Cat': '2',
    'Himalayan Cat': '2',
    'British Shorthair': '2',
    'Egyptian Mau': '2',
    'Maine Coon': '2',
    'Siamese Cat': '2',
    'Mini Rex': '3',
    'Holland Lop': '3',
    'Dutch Lop': '3',
    'Dwarf Hotot': '3',
    'Mini Lop': '3',
    'Mini Satin': '3',
    'Netherland Dwarf': '3',
    'Polish': '3',
    'Parrot': '4',
    'Sparrow': '4',
    'Dove': '4',
    'Love Birds': '4',
    'Canary': '4',
    'Marwari Horse': '5',
    'Kathiawari Horse': '5',
    'Bhutia Horse': '5',
    'Spiti Horse': '5',
    'Arabian Horse': '5',
    'Polo Pony': '5 ',
  };

  List _breeds = [];
  BreedDropDown(PetId) {
    PetBreed.forEach((key, value) {
      if (PetId == value) {
        _breeds.add(key);
      }
    });
    _selectedBreed = _breeds[0];
  }

  @override
  void initState() {
    super.initState();
    PetDependentDropDown();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 114, 180, 255),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Pet Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        child: TextFormField(
                          controller: _PetNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff02AAB0))),
                            labelText: 'Pet Name',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        width: 400,
                        child: DropdownButtonFormField(
                          iconEnabledColor: Color(0xff02AAB0),
                          iconDisabledColor: Colors.red,
                          value: dropdownvalue,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff02AAB0))),
                            labelText: 'Pet',
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              _breeds = [];
                              BreedDropDown(PetCategory[newValue]);
                              _selectedPet = "$newValue";
                            });
                          },
                          items: _pets.map((Category1) {
                            return DropdownMenuItem(
                              child: new Text(Category1),
                              value: Category1,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        width: 400,
                        child: DropdownButtonFormField(
                          iconDisabledColor: Color(0xff02AAB0),
                          value: dropdownvalue,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff02AAB0))),
                            labelText: 'Pet Breed',
                          ),
                          onChanged: (newValue1) {
                            setState(() {
                              _selectedBreed = "$newValue1";
                            });
                          },
                          items: _breeds.map((Value) {
                            return DropdownMenuItem(
                              child: Text(Value),
                              value: Value,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: TextFormField(
                              controller: _AgeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Color(0xff02AAB0))),
                                labelText: 'Age in Months',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.38,
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: DropdownButtonFormField(
                            iconEnabledColor: Color(0xff02AAB0),
                            iconDisabledColor: Colors.red,
                            value: dropdownvalue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff02AAB0))),
                              labelText: 'Sex',
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                _SelectedPetSex = "$newValue";
                              });
                            },
                            items: _petSex.map((Category1) {
                              return DropdownMenuItem(
                                child: new Text(Category1),
                                value: Category1,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Color(0xff02AAB0),
                          value: this.checkBox1,
                          onChanged: (value) {
                            setState(() {
                              this.checkBox1 = value!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ), //SizedBox
                        Text(
                          'All Vaccination Done ? ',
                          style: TextStyle(fontSize: 17.0),
                        ), //Text
                        SizedBox(width: 10), //SizedBox
                        /* Checkbox Widget */
                      ], //<Widget>[]
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Color(0xff02AAB0),
                          value: this.checkBox2,
                          onChanged: (newValue) {
                            setState(() {
                              this.checkBox2 = newValue!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ), //SizedBox
                        Text(
                          'Know Essentials commands ? ',
                          style: TextStyle(fontSize: 17.0),
                        ), //Text
                        SizedBox(width: 10), //SizedBox
                        /* Checkbox Widget */
                      ], //<Widget>[]
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        height: 150,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 100,
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff02AAB0))),
                            labelText: 'Description About Pet',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        backgroundColor: Color.fromARGB(255, 114, 180, 255),
        onPressed: () async {
          User? user = await FirebaseAuth.instance.currentUser;
          FirebaseFirestore.instance
              .collection('Pet_Details')
              .doc(user?.uid)
              .set({
            'Pet Name': _PetNameController.text,
            'Pet Category': _selectedPet,
            'Pet Breed': _selectedBreed,
            'Age Of Pet': _AgeController.text,
            'Gender': _SelectedPetSex,
            'vaccination done': checkBox1,
            'Know Essential commands': checkBox2,
            'Description About Pet': _descriptionController.text,
          }).then((value) {
            print("success");
          });
          
          await Future.delayed(Duration(seconds: 2));

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ownerDetails()));
        },
        child:Icon(Icons.arrow_right_alt,
        size: 42,
        )
      ),
    );
  }
}

class ownerDetails extends StatefulWidget {
  const ownerDetails({Key? key}) : super(key: key);

  @override
  State<ownerDetails> createState() => _ownerDetailsState();
}

class _ownerDetailsState extends State<ownerDetails> {
  final TextEditingController _OwnerNameController = TextEditingController();
  final TextEditingController _Address1Controller = TextEditingController();
  final TextEditingController _Address2Controller = TextEditingController();
  final TextEditingController _CountryController = TextEditingController();
  final TextEditingController _StateController = TextEditingController();
  final TextEditingController _CityController = TextEditingController();
  final TextEditingController _PincodeController = TextEditingController();
  final TextEditingController _OwnerPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 114, 180, 255),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Owner Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        child: TextFormField(
                          controller: _OwnerNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff02AAB0))),
                            labelText: 'Owner Name',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        child: TextFormField(
                          controller: _Address1Controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff02AAB0))),
                            labelText: 'Address Line - 1',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        child: TextFormField(
                          controller: _Address2Controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff02AAB0))),
                            labelText: 'Address Line- 2',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            width: 170,
                            child: TextFormField(
                              controller: _CountryController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Color(0xff02AAB0))),
                                labelText: 'Country',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.38,
                            child: TextFormField(
                              controller: _StateController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Color(0xff02AAB0))),
                                labelText: 'State',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            width: 170,
                            child: TextFormField(
                              controller: _CityController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Color(0xff02AAB0))),
                                labelText: 'City',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.38,
                            child: TextFormField(
                              controller: _PincodeController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Color(0xff02AAB0))),
                                labelText: 'Pincode',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        child: TextFormField(
                          controller: _OwnerPhoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff02AAB0))),
                            labelText: 'Enter Phone No',
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        backgroundColor: Color.fromARGB(255, 114, 180, 255),
        onPressed: () async {
           User? user = await FirebaseAuth.instance.currentUser;
          FirebaseFirestore.instance
              .collection('Pet_Details')
              .doc(user?.uid)
              .update({
            'Owner Name': _OwnerNameController.text,
            'Adrees ': _Address1Controller.text +_Address2Controller.text,
            'Country': _CountryController.text,
            'State': _StateController.text,
            'City': _CityController.text,
            'Pincode': _PincodeController.text,
            'Phone Number': _OwnerPhoneController.text,
          }).then((value) {
            print("success");
          });
          await Future.delayed(Duration(seconds: 2));

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PetsImage()));
        },
        child: Icon(Icons.arrow_right_alt,
        size: 42,
        )
      ),
    );
  }
}
