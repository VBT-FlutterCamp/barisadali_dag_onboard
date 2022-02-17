import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function() ontap;
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: ontap,
        child: Text(title),
      ),
    );
  }
}
