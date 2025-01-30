import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.onChange,
  });

  final String hintText;
  final IconButton? icon;
  final Function(String)? onChange;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
          decoration: InputDecoration(
            suffixIcon: widget.icon,
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
