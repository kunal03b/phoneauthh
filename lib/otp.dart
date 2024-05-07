import 'package:flutter/material.dart';
import 'package:phoneauthh/profile.dart';
import 'package:phoneauthh/reusable.dart';
import 'package:pinput/pinput.dart';

class VerifyOTP extends StatefulWidget {
  final String phoneNumber;

  const VerifyOTP({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    String imgPath2 = 'assets/bg2.png';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify Phone',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    'Code is sent to ${widget.phoneNumber}',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Pinput(
                        length: 6,
                        closeKeyboardWhenCompleted: true,
                        controller: otpController,
                        defaultPinTheme: PinTheme(
                            width: screenWidth * 0.7,
                            height: screenHeight * 0.07,
                            textStyle: TextStyle(fontSize: 19),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(147, 210, 243, 0.5),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      // Add your logic here for requesting the code again
                      print('Request again pressed');
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Didn't receive a code? ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          WidgetSpan(
                            child: InkWell(
                              onTap: () {
                                // Add your logic here for requesting the code again
                                print('Request again pressed');
                              },
                              child: Text(
                                'Request again',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration:
                                      TextDecoration.none, // Remove underline
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  navigateButton(
                      context: context,
                      buttonText: 'VERIFY AND CONTINUE',
                      destinationPage: ProfilePage())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
