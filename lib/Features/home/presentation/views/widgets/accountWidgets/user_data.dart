import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final String image;
  final String label;
  final String data;
  final VoidCallback onTap;
  const UserData(
      {super.key,
      required this.image,
      required this.label,
      required this.data,
      required this.onTap});
  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionalHeight(context, 54),
      width: getProportionalWidth(context, 398),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionalWidth(context, 16)),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: getProportionalWidth(context, 32),
                      height: getProportionalHeight(context, 32),
                      child: Image.asset(image)),
                  SizedBox(
                    width: getProportionalWidth(context, 16),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: getProportionalWidth(context, 12),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff223263)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    data,
                    style: TextStyle(
                        fontSize: getProportionalWidth(context, 12),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    width: getProportionalWidth(context, 8),
                  ),
                  SizedBox(
                      height: getProportionalHeight(context, 16),
                      width: getProportionalHeight(context, 16),
                      child: Image.asset('assets/images/Vector.png')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
