import 'package:flutter/material.dart';
import 'package:flutter_payment_bestech/component/colors.dart';
import 'package:flutter_payment_bestech/controllers/data_controllers.dart';
import 'package:flutter_payment_bestech/pages/payment_page.dart';
import 'package:flutter_payment_bestech/widgets/butttons.dart';
import 'package:flutter_payment_bestech/widgets/large_button.dart';
import 'package:flutter_payment_bestech/widgets/text_size.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.loading == false) {
                return Center(child: CircularProgressIndicator());
              } else {
                return _listBills();
              }
            }),
            _payButton(),
          ],
        ),
      ),
    );
  }

  Widget _headSection() {
    return Container(
      height: 220,
      //color: Colors.red.withOpacity(0.2),
      child: Stack(
        children: [
          _mainBackGround(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  Widget _buttonContainer() {
    return Positioned(
      right: 58,
      bottom: 5,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              barrierColor: Colors.transparent,
              backgroundColor: Colors.grey.withOpacity(0.5),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 530,
                  child: Stack(
                    children: [
                      Positioned(
                          right: 53,
                          child: Container(
                            width: 60,
                            height: 250,
                            decoration: BoxDecoration(
                              color: AppColor.mainColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Buttons(
                                  icon: Icons.clear,
                                  iconColor: Colors.white,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Buttons(
                                  icon: Icons.add,
                                  iconColor: Colors.white,
                                  onTap: () {},
                                  text: 'Add Bill',
                                ),
                                Buttons(
                                  icon: Icons.history,
                                  iconColor: Colors.white,
                                  onTap: () {},
                                  text: 'History',
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              });
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/lines.png',
                ),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: Offset(0, 1),
                  color: Color(0xff11324d).withOpacity(0.2),
                )
              ]),
        ),
      ),
    );
  }

  Widget _mainBackGround() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 210,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/background.png'),
        )),
      ),
    );
  }

  Widget _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -2,
        bottom: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/curve.png'),
          )),
        ));
  }

  Widget _listBills() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 240,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
              itemCount: _controller.list.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 15,
                    right: 10,
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffd8dbe0),
                          offset: Offset(1, 1),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ]),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.pink.shade600,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            _controller.list[index]['img']),
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _controller.list[index]["brand"],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text('ID: 1111111'),
                                  ],
                                ),
                              ],
                            ),
                            SizedText(
                              text: _controller.list[index]['more'],
                              color: AppColor.green,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.list[index]['status'] =
                                    !_controller.list[index]['status'];
                                _controller.list.refresh();
                              },
                              child: Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      _controller.list[index]['status'] == false
                                          ? AppColor.selectBackground
                                          : Colors.green,
                                ),
                                child: Center(
                                    child: Text(
                                  'Select',
                                  style: TextStyle(
                                    color: _controller.list[index]['status'] ==
                                            false
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                )),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$${_controller.list[index]['due']}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Due in 3 days'),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  Widget _payButton() {
    return Positioned(
      bottom: 0,
      left: 10,
      right: 10,
      child: LargeButton(
        onTap: () {
          Get.to(() => PaymentPage());
        },
        text: 'Pay all bills',
        textColor: Colors.white,
      ),
    );
  }

  Widget _textContainer() {
    return Stack(
      children: const [
        Positioned(
          left: 0,
          top: 70,
          child: Text(
            'My Bills',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Color(0xff293952),
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 50,
          child: Text(
            'My Bills',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
