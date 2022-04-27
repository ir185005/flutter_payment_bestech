import 'package:flutter/material.dart';
import 'package:flutter_payment_bestech/component/colors.dart';

class Buttons extends StatelessWidget {
  final double? fontSize;
  final IconData icon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;
  const Buttons({
    Key? key,
    this.backgroundColor = AppColor.mainColor,
    this.textColor = Colors.white,
    this.onTap,
    required this.icon,
    this.iconColor,
    this.fontSize = 20,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor,
              ),
              child: Icon(
                icon,
                size: 30,
                color: iconColor,
              ),
            ),
            text != null
                ? Text(
                    text!,
                    style: TextStyle(
                      color: textColor,
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
