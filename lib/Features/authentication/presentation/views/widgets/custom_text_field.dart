import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.onChange,
    required this.backgroundColor,
    required this.borderColor,
    this.horizontalPadding,
  });

  final String hintText;
  final IconButton? icon;
  final Function(String)? onChange;
  final Color backgroundColor;
  final Color borderColor;
  final double? horizontalPadding;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              getProportionalWidth(context, widget.horizontalPadding ?? 14)),
      child: SizedBox(
        height: getProportionalHeight(context, 55),
        child: TextFormField(
          validator: (data) {
            if (data!.isEmpty) {
              return "field is required";
            }
            return null;
          },
          onChanged: widget.onChange,
          decoration: InputDecoration(
            fillColor: widget.backgroundColor,
            filled: true,
            suffixIcon: widget.icon,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: getProportionalWidth(context, 16),
              color: kmainTextColor,
              fontFamily: kInriaSansFont,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(getProportionalWidth(context, 50)),
              borderSide: BorderSide(
                width: getProportionalWidth(context, 2),
                color: widget.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(getProportionalWidth(context, 50)),
              borderSide: BorderSide(
                color: widget.borderColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(getProportionalWidth(context, 50)),
              borderSide: BorderSide(
                color: widget.borderColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
