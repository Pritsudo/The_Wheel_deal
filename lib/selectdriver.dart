import 'dart:math';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_wheel_deal/core/app_export.dart';
import 'package:the_wheel_deal/model/driver_info.dart';
import 'package:flutter/material.dart';

class SelectDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rand = Random();
    var driverid = rand.nextInt(10);
    final selectDriver = Driver_detial.firstWhere(
      (driver) {
        return driver.id == driverid;
      },
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.yellow200,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 216, 165),
                // color: Color.fromARGB(255, 72, 146, 75),
                // gradient: LinearGradient(

                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                  
                //   colors:<Color> [
                //    Colors.green,
                //    Colors.blue

                //   ])
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        18.00,
                      ),
                      top: getVerticalSize(
                        81.00,
                      ),
                      right: getHorizontalSize(
                        18.00,
                      ),
                    ),
                    child: Text(
                      "Profile",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: getFontSize(
                          40,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        18.00,
                      ),
                      top: getVerticalSize(
                        15.00,
                      ),
                      right: getHorizontalSize(
                        18.00,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getSize(
                          200.00,
                        ),
                      ),
                      child: Image.network(
                        selectDriver.image,
                        height: getVerticalSize(
                          310.00,
                        ),
                        width: getHorizontalSize(
                          310.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: getHorizontalSize(
                        18.00,
                      ),
                      top: getVerticalSize(
                        26.00,
                      ),
                      right: getHorizontalSize(
                        18.00,
                      ),
                      bottom: getVerticalSize(
                        223.00,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 228, 191, 137),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              6.00,
                            ),
                          ),
                          child: Text(
                            "Name: ${selectDriver.name} ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                40,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              6.00,
                            ),
                            right: getHorizontalSize(
                              10.00,
                            ),
                          ),
                          child: Text(
                            "Age: ${selectDriver.age}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                40,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              6.00,
                            ),
                            top: getVerticalSize(
                              7.00,
                            ),
                            right: getHorizontalSize(
                              10.00,
                            ),
                          ),
                          child: Text(
                            "Experince: ${selectDriver.exp} Years",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                40,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              5.00,
                            ),
                            bottom: getVerticalSize(
                              14.00,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 7,
                                  left: getHorizontalSize(
                                    19.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    30.00,
                                  ),
                                  width: getHorizontalSize(
                                    30.00,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.imgVector2,
                                    fit: BoxFit.fill,
                                   
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    8.00,
                                  ),
                                  right: getHorizontalSize(
                                    55.00,
                                  ),
                                  bottom: getVerticalSize(
                                    5.00,
                                  ),
                                ),
                                child: Text(
                                  selectDriver.mob_number,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      40,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
