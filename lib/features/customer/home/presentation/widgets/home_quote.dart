import 'package:flutter/material.dart';
import '../../../../../core/constants/strings/home_strings.dart';

class HomeQuote extends StatelessWidget {
  const HomeQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 32,
          color: Colors.black87,
          height: 1.2,
        ),
        children: [
          TextSpan(
            text: HomeStrings.quotePart1,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: HomeStrings.quotePart2,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextSpan(
            text: HomeStrings.quotePart3,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          TextSpan(
            text: HomeStrings.quotePart4,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
