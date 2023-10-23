import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    Key? key,
    required this.label,
    this.heigth = 56,
    this.width = double.infinity,
    this.padding = 10,
    this.color,
    this.labelColor = Colors.white,
    this.borderRadius = 8,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final double heigth;
  final double width;
  final double padding;
  final Color? color;
  final Color? labelColor;
  final double borderRadius;
  final VoidCallback? onPressed;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.heigth,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.borderRadius,
            ),
          ), backgroundColor: widget.color ?? AppColors.primaryColor,
        ),
        child: Text(
          widget.label,
          style: TextStyles.textButton,
        ),
      ),
    );
  }
}