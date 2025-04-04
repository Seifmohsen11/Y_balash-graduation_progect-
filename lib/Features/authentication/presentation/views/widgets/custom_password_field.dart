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

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionalWidth(context, 14),
      ),
      child: SizedBox(
        height: getProportionalHeight(context, 55),
        child: TextFormField(
          textInputAction: TextInputAction.next,
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
                padding: EdgeInsets.only(
                  right: getProportionalWidth(context, 8),
                ),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xff8A8A8A), // Set the color to red
                    BlendMode.srcIn, // Apply the color filter
                  ),
                  child: Image.asset(
                    secureText
                        ? 'assets/icons/closedEyeIcon.png' // Icon when password is hidden
                        : 'assets/icons/openEyeIcon.png', // Icon when password is visible
                    width: getProportionalWidth(
                        context, 24), // Adjust the icon size if needed
                    height: getProportionalHeight(context, 24),
                  ),
                ),
              ),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: getProportionalWidth(context, 16),
              color: kmainTextColor,
              fontFamily: kInriaSansFont,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  getProportionalWidth(context, 50),
                ),
                borderSide: BorderSide(
                  width: getProportionalWidth(context, 2),
                  color: kTextFieldAndButtomColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  getProportionalWidth(context, 50),
                ),
                borderSide: const BorderSide(
                  color: kTextFieldAndButtomColor,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  getProportionalWidth(context, 50),
                ),
                borderSide: const BorderSide(
                  color: kTextFieldAndButtomColor,
                )),
          ),
        ),
      ),
    );
  }
}
