import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phoneauthh/otp.dart';
import 'package:phoneauthh/reusable.dart';
// import 'verify_otp.dart'; // Import VerifyOTP screen

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  String phoneNumber = ''; // Variable to store phone number

  @override
  Widget build(BuildContext context) {
    String imgPath2 = 'assets/bg2.png';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please enter your mobile number',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenHeight * 0.009,
                  ),
                  Text("You'll receive a 4 digit code"),
                  Text("to verify next"),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    width: screenWidth * 0.85,
                    child: IntlPhoneField(
                      controller: phoneController,
                      showCountryFlag: true,
                      showDropdownIcon: false,
                      initialCountryCode: 'IN',
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 15),
                      ),
                      onChanged: (value) {
                        phoneNumber = value
                            .completeNumber; // Store the complete phone number
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  navigateButton(
                      context: context,
                      buttonText: 'CONTINUE',
                      destinationPage: VerifyOTP(phoneNumber: phoneNumber))
                ],
              ),
            ),
          ),
          PositionedBG(
            imagePath: imgPath2,
          )
        ],
      ),
    );
  }
}
