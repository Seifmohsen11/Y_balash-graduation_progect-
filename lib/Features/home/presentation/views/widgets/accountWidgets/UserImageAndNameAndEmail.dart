import 'package:flutter/material.dart';

class UserImageAndNameAndEmail extends StatelessWidget {
  const UserImageAndNameAndEmail(
      {super.key,
      required this.image,
      required this.userName,
      required this.email});
  final String? image;
  final String userName;
  final String email;

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
          width: getProportionalHeight(context, 76),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: .5),
            borderRadius: BorderRadius.circular(
              getProportionalWidth(context, 56),
            ), // Border radius for Container
          ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(getProportionalWidth(context, 56)),
            child: image != null
                ? Image.network(
                    image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(
                    'assets/images/user.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(width: getProportionalWidth(context, 18)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: TextStyle(
                  color: const Color(0xff003366),
                  fontSize: getProportionalWidth(context, 12),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionalWidth(context, 12),
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
