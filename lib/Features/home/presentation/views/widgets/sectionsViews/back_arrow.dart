import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * (8 / 430)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * (42 / 932),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const ImageIcon(
              AssetImage('assets/icons/Arrow.png'),
            ),
          ),
        ],
      ),
    );
  }
}
