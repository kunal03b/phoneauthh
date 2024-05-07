import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phoneauthh/login.dart';
import 'package:phoneauthh/reusable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LanguageSelector(),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String? _selectedLanguage = 'English'; // Default selected language

  void _handleNextButton(BuildContext context) async {
    // Get a reference to the Firestore database
    final firestore = FirebaseFirestore.instance;

    // Create a new document (or update an existing one)
    await firestore.collection('language').doc('NNqZzjX4TWn2Vs7Sum67').set({
      'language': _selectedLanguage,
    });
    print("Language sent");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String imgPath1 = 'assets/bg1.png';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double gapHeight = MediaQuery.of(context).size.height * 0.03;
    double textGap = MediaQuery.of(context).size.height * 0.01;
    double dropdownWidth =
        MediaQuery.of(context).size.width * 0.6; // Decreased width

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                  ),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/image.png')),
                      SizedBox(height: gapHeight),
                      Text(
                        'Please select your Language',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: textGap,
                      ),
                      Text('You can change the language'),
                      Text(' at any time.'),
                      SizedBox(
                        height: gapHeight,
                      ),
                      Container(
                        width: dropdownWidth, // Set the width
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            value: _selectedLanguage,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLanguage = newValue;
                              });
                            },
                            items: <String>[
                              'English',
                              'Spanish',
                              'French',
                              'German'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ), // Add space between dropdown and button
                      Container(
                        width: dropdownWidth,
                        child: TextButton(
                          onPressed: () => _handleNextButton(context),
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF2E3B62),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Container(
                            height: screenHeight * 0.04,
                            // width: screenWidth * 0.7,
                            child: Center(
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedBG(
          imagePath: imgPath1,
        ),
      ]),
    );
  }
}
