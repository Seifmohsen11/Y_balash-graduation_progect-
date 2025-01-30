import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.hintText,
    this.onChange,
  });

  final String hintText;
  final Function(String)? onChange;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * (14 / 430)),
      child: SizedBox(
        height: screenHeight * (55 / 932),
        child: TextFormField(
          validator: (data) {
            if (data!.isEmpty) {
              return "field is required";
            }
            return null;
          },
          onChanged: widget.onChange,
          obscureText: secureText, // This controls the visibility of the text
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  secureText = !secureText; // Toggle the secureText value
                });
              },
              icon: Padding(
                padding: EdgeInsets.only(right: screenWidth * (8 / 430)),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xff8A8A8A), // Set the color to red
                    BlendMode.srcIn, // Apply the color filter
                  ),
                  child: Image.asset(
                    secureText
                        ? 'assets/icons/closedEyeIcon.png' // Icon when password is hidden
                        : 'assets/icons/openEyeIcon.png', // Icon when password is visible
                    width: screenWidth *
                        (24 / 430), // Adjust the icon size if needed
                    height: screenHeight * (24 / 932),
                  ),
                ),
              ),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: screenWidth * (16 / 430),
              color: kmainTextColor,
              fontFamily: kIneraFont,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * (50 / 430)),
                borderSide: BorderSide(
                  width: screenWidth * (2 / 430),
                  color: kTextFieldAndButtomColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * (50 / 430)),
                borderSide: const BorderSide(
                  color: kTextFieldAndButtomColor,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * (50 / 430)),
                borderSide: const BorderSide(
                  color: kTextFieldAndButtomColor,
                )),
          ),
        ),
      ),
    );
  }
}
