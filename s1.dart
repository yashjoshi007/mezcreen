import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcreen/components/container.dart';

import 'components/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello Mateo,',
                    style: GoogleFonts.inter(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Icon(Icons.cloud, size: 36.0),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s weather',
                        style: GoogleFonts.inter(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '14°C',
                        style: GoogleFonts.inter(fontSize: 24.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Energy Saving',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                children: [
                  MyContainer(text: 'Today', text2: '96 kWh', icon: Icons.local_fire_department_rounded, onPressed: () {  },),
                  SizedBox(width: 10,),
                  MyContainer(text: 'This week', text2: '920 kWh', icon: Icons.surround_sound, onPressed: () {  },),
                ],
              ),
              SizedBox(height: 10,),
              Text('Rooms',style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                children: [
                  MyContainer2(text: 'Mom room', text2: '1 devices', icon: Icons.mobile_screen_share, onPressed: (){}),
                  SizedBox(width: 10,),
                  MyContainer2(text: 'Living room', text2: '2 devices', icon: Icons.account_balance, onPressed: (){}),
                  SizedBox(width: 10,),
                  MyContainer2(text: 'Kitchen', text2: '3 devices', icon: Icons.donut_small, onPressed: (){}),
                ],
              ),
              MyContainer2(text: '', text2: '', icon: Icons.add, onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MyDialog();
                  },
                );

              })






            ],
          ),
        ),
      ),
    );
  }
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

// Define a function to upload the data to the database
  void uploadDataToFirebase(String textField1Value, String textField2Value, String dropdownValue) {
    // Define a new child node under the "data" node with a unique ID
    DatabaseReference dataRef = databaseReference.child("data").push();

    // Set the values for the child node
    dataRef.set({
      "textField1Value": _tex,
      "textField2Value": textField2Value,
      "dropdownValue": dropdownValue,
    }).then((value) {
      print("Data uploaded to Firebase");
    }).catchError((error) {
      print("Failed to upload data: $error");
    });
  }
}


