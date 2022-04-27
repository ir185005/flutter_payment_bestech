import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payment_bestech/component/colors.dart';
import 'package:flutter_payment_bestech/widgets/butttons.dart';
import 'package:flutter_payment_bestech/widgets/large_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.only(
          top: 65,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/paymentbackground.png'),
        )),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h * 0.10,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('images/success.png'),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Success !',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Payment is completed for 2 bills',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
            ),
            Container(
              margin: EdgeInsets.all(h * 0.01),
              height: 125,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5),
                  )),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'KenGen Power',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'ID 111111',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              '\$1248.00',
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Column(
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$2840.00',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * 0.13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Buttons(
                  icon: Icons.share_sharp,
                  text: 'share',
                  iconColor: Colors.white,
                  textColor: AppColor.mainColor,
                ),
                Buttons(
                  icon: Icons.print_outlined,
                  text: 'print',
                  iconColor: Colors.white,
                  textColor: AppColor.mainColor,
                ),
              ],
            ),
            Spacer(),
            LargeButton(
              onTap: () {
                Get.back();
              },
              text: 'Done',
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
