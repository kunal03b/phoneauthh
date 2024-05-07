import 'package:flutter/material.dart';

class PositionedBG extends StatelessWidget {
  final String imagePath;

  const PositionedBG({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Image(image: AssetImage(imagePath)),
    );
  }
}

Widget navigateButton({
  required BuildContext context,
  required String buttonText,
  required Widget destinationPage,
}) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    height: screenHeight * 0.07,
    width: screenWidth * 0.85,
    decoration: BoxDecoration(
      color: Color(0xFF2E3B62),
    ),
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destinationPage,
          ),
        );
      },
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Widget profileOption({
  required BuildContext context,
  required String imgPath,
  required String title,
  required String subtitle,
  required String? selectedProfile,
  required void Function(String?) onChanged,
}) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    width: screenWidth * 0.8,
    height: screenHeight * 0.11,
    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: InkWell(
      onTap: () {
        onChanged(title);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Radio<String>(
              value: title,
              groupValue: selectedProfile,
              onChanged: onChanged,
            ),
            Container(
              child: Image(
                image: AssetImage(imgPath),
                // fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
