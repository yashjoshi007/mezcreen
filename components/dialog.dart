import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mezcreen/components/textfield.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  String _selectedOption = 'Bedroom';
  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Room'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MyTextField(controller: _textField1Controller, hintText: "Device Name", obsecureText: false,
              validator: (value) {
                RegExp regex = new RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("First Name cannot be Empty");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid name(Min. 3 Character)");
                }
                return null;
              }, onSaved: (value) {
                _textField1Controller.text = value!;
              },icon: Icons.device_hub),

          DropdownButton<String>(
            value: _selectedOption,
            onChanged: (newValue) {
              setState(() {
                _selectedOption = newValue!;
              });
            },
            items: <String>['Bedroom', 'Living room', 'Kitchen', 'Bathroom']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () {
            String textField1Value = _textField1Controller.text;
            String textField2Value = _textField2Controller.text;
            String textField3value = _selectedOption;
            uploadDataToFirebase(textField1Value,_selectedOption);
            // Do something with the values
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

// Define a function to upload the data to the database
  void uploadDataToFirebase(String textField1Value, String dropdownValue) {
    // Define a new child node under the "data" node with a unique ID
    DatabaseReference dataRef = databaseReference.child("data").push();

    // Set the values for the child node
    dataRef.set({
      "textField1Value": _textField1Controller,
      "dropdownValue": _selectedOption,
    }).then((value) {
      print("Data uploaded to Firebase");
    }).catchError((error) {
      print("Failed to upload data: $error");
    });
  }
}

