import 'package:flutter/material.dart';

class UserImageAndNameAndEmail extends StatelessWidget {
  const UserImageAndNameAndEmail({super.key});

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: getProportionalWidth(context, 18)),
        Container(
          height: getProportionalHeight(context, 76),
          width: getProportionalWidth(context, 76),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: .5),
            borderRadius: BorderRadius.circular(
              getProportionalWidth(context, 56),
            ), // Border radius for Container
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(getProportionalWidth(
                context, 56)), // Apply border radius to image
            child: Image.asset(
              'assets/images/user.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: getProportionalWidth(context, 18)),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seif Mohsen',
              style: TextStyle(
                  color: Color(0xff003366),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'seifmohsen@gmail.com',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
