import 'package:flutter/material.dart';

import 'periksaemail.dart';

void main() {
  runApp(Lupakatasandi());
}

class Lupakatasandi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the back arrow is pressed
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                SizedBox(
                    height: 20), // Add some space between the app bar and texts
                Text(
                  'Lupa Kata Sandi', // Added text here
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Set to bold
                    fontSize: 18, // Adjust the font size as needed
                    fontFamily: 'Poppins', // Set to Poppins font
                  ),
                ),
                SizedBox(height: 10), // Add some space between the texts
                Text(
                  'Masukkan email Anda untuk mengatur ulang kata sandi',
                  style: TextStyle(
                    fontFamily: 'Poppins', // Set to Poppins font
                  ),
                ),
                SizedBox(
                    height:
                        5), // Add some space between the texts and the "Your Email" text
                Text(
                  'Your Email', // Added text here
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Set to bold
                    fontSize: 14, // Adjust the font size as needed
                    fontFamily: 'Poppins', // Set to Poppins font
                  ),
                ),
                SizedBox(
                    height:
                        10), // Add some space between the "Your Email" text and the text field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.green),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        20), // Add some space between the text field and the button
                Container(
                  width: double.infinity, // Make the button take the full width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Periksaemail(),
                        ),
                      );
                    },
                    child: Text(
                      'Reset Kata Sandi',
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                        fontFamily: 'Poppins', // Set to Poppins font
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
