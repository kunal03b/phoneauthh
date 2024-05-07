import 'package:flutter/material.dart';
import 'package:phoneauthh/reusable.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? selectedProfile; // Variable to store selected profile

  @override
  Widget build(BuildContext context) {
    String shipper = 'assets/shipper.png';
    String transporter = 'assets/transporter.png';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please select your profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                profileOption(
                    context: context,
                    imgPath: shipper,
                    title: 'Shipper',
                    subtitle:
                        'Lorem lpsum dolor sit amet, \n consectetur adipiscing elit',
                    selectedProfile: selectedProfile,
                    onChanged: (value) {
                      setState(() {
                        selectedProfile = value;
                      });
                    }),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                profileOption(
                    context: context,
                    imgPath: transporter,
                    title: 'Transporter',
                    subtitle:
                        'Lorem ipsum dolor sit amet \nconsectetur adipiscing',
                    selectedProfile: selectedProfile,
                    onChanged: (value) {
                      setState(() {
                        selectedProfile = value;
                      });
                    }),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                navigateButton(
                    context: context,
                    buttonText: 'CONTINUE',
                    destinationPage: ProfilePage())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
