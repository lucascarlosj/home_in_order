import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    this.isCenterTitle = false,
    this.isCenterSubtitle = false,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final bool isCenterTitle;
  final bool isCenterSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isCenterTitle ? Alignment.center : Alignment.centerLeft,
          child: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          subTitle,
          maxLines: 4,
          textAlign: isCenterSubtitle ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.withOpacity(0.8),
            height: 1.5,
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
