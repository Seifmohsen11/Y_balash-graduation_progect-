import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class TodaysOfferCard extends StatelessWidget {
  const TodaysOfferCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.firstColor,
    required this.secondColor,
    required this.icon,
    required this.title,
    required this.subject,
    required this.description,
    required this.imageUrl,
    required this.subjectColor,
  });

  final double screenHeight;
  final double screenWidth;
  final Color firstColor;
  final Color secondColor;
  final Color subjectColor;
  final AssetImage icon;
  final String title;
  final String subject;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    String formattedDescription = description.replaceFirstMapped(
      RegExp(
          r'([^,]*,[^,]*, )'), // Finds the first two segments separated by commas
      (match) =>
          '${match.group(0)}\n', // Adds a new line after the second comma
    );
    String formattedTitle = title; // Default to original title
    String formattedSubject = subject; // Default to original subject

    int maxChars = 25; // Maximum characters before inserting a new line

// Format title
    if (title.length > maxChars) {
      int breakPoint = title.lastIndexOf(
          ' ', maxChars); // Find the last space before maxChars
      if (breakPoint == -1) {
        breakPoint = maxChars; // If no space is found, break at maxChars
      }
      formattedTitle =
          '${title.substring(0, breakPoint)}\n${title.substring(breakPoint).trim()}';
    }

// Format subject
    if (subject.length > maxChars) {
      int breakPoint = subject.lastIndexOf(
          ' ', maxChars); // Find the last space before maxChars
      if (breakPoint == -1) {
        breakPoint = maxChars; // If no space is found, break at maxChars
      }
      formattedSubject =
          '${subject.substring(0, breakPoint)}\n${subject.substring(breakPoint).trim()}';
    }

    double cardHeight = screenHeight * (392 / 932);
    double cardWidth = screenWidth * (191 / 430);

    return Container(
      height: screenHeight * (392 / 932),
      width: screenWidth * (191 / 430),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(
          screenHeight * (18 / 932),
        ),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight / 2, // Half of parent height
                width: constraints.maxWidth, // Same width as parent
                decoration: BoxDecoration(
                  color: firstColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        screenHeight * (18 / 932),
                      ),
                      topRight: Radius.circular(screenHeight * (18 / 932))),
                ),
              );
            },
          ),
          Positioned(
            top: screenHeight * (12 / 932),
            left: screenWidth * (10 / 430),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: cardWidth * (130 / 191)),
                    ImageIcon(
                      icon,
                      size: cardWidth * (56 / 191),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      formattedTitle,
                      style: TextStyle(
                        color: const Color(0xFF393939),
                        fontSize: cardWidth * (17 / 191),
                        fontFamily: kInriaSansFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: cardHeight * (7 / 392)),
                Row(
                  children: [
                    Text(
                      formattedSubject,
                      style: TextStyle(
                        color: subjectColor,
                        fontSize: cardWidth * (14 / 191),
                        fontFamily: kInriaSansFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: cardHeight * (10 / 392)),
                Text(
                  formattedDescription,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: cardWidth * (14 / 191),
                      fontFamily: kInriaSansFont),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: cardHeight * (32 / 392),
            left: cardWidth * (26 / 191),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: cardHeight * (160 / 392),
                    width: cardWidth * (160 / 191),
                    child: Image.network(imageUrl)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
