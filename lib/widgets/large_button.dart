import 'package:flutter/material.dart';
import 'package:flutter_payment_bestech/component/colors.dart';

class LargeButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Function()? onTap;
  final bool? isBorder;

  const LargeButton({
    Key? key,
    required this.text,
    this.backgroundColor = AppColor.mainColor,
    this.onTap,
    this.isBorder = false,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          //margin: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: AppColor.mainColor,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ));
  }
}
