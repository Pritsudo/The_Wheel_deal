import 'package:flutter/material.dart';
import 'package:the_wheel_deal/Rent%20car/selected_car_detail.dart';
import '../core/app_export.dart';

class Car_List extends StatelessWidget {
  final String image;
  final String price;
  final String year;
  final String model;
  final String brand;

  const Car_List({
    Key? key,
    required this.image,
    required this.price,
    required this.year,
    required this.model,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  176.00,
                ),
                width: getHorizontalSize(
                  417.00,
                ),
                margin: EdgeInsets.symmetric(
                  // left: getHorizontalSize(
                  //   5.00,
                  // ),
                  // top: getVerticalSize(
                  //   91.00,
                  // ),
                  // right: getHorizontalSize(
                  //   6.00,
                  // ),
                  // bottom: getVerticalSize(
                  //   659.00
                 
                  // ),
horizontal: 10,
vertical: 20
                   
                  
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: getVerticalSize(
                            10.00,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.lightGreen100,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              20.00,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: getVerticalSize(
                                  63.00,
                                ),
                                width: getHorizontalSize(
                                  186.00,
                                ),
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    222.00,
                                  ),
                                  top: getVerticalSize(
                                    17.00,
                                  ),
                                  right: getHorizontalSize(
                                    9.00,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: getHorizontalSize(
                                          186.00,
                                        ),
                                        margin: EdgeInsets.only(
                                          bottom: getVerticalSize(
                                            10.00,
                                          ),
                                        ),
                                        child: Text(
                                          model,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              20,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: getVerticalSize(
                                          24.00,
                                        ),
                                        width: getHorizontalSize(
                                          49.00,
                                        ),
                                        margin: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            10.00,
                                          ),
                                          top: getVerticalSize(
                                            10.00,
                                          ),
                                          right: getHorizontalSize(
                                            3.00,
                                          ),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                year,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray500,
                                                  fontSize: getFontSize(
                                                    20,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                year,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray500,
                                                  fontSize: getFontSize(
                                                    20,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    16.00,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          25.00,
                                        ),
                                        top: getVerticalSize(
                                          12.00,
                                        ),
                                        bottom: getVerticalSize(
                                          12.00,
                                        ),
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '\$${price}',
                                              style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(
                                                  20,
                                                ),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '/day',
                                              style: TextStyle(
                                                color: ColorConstant.gray700,
                                                fontSize: getFontSize(
                                                  20,
                                                ),
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      // color: Color.fromARGB(255, 72, 146, 75),
                                      width: getHorizontalSize(
                                        155.00,
                                      ),
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          30.00,
                                        ),
                                        top: getVerticalSize(
                                          12.00,
                                        ),
                                        bottom: getVerticalSize(
                                          12.00,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        // color: ColorConstant.indigoA700Aa,
                                        color: Color.fromARGB(255, 72, 146, 75),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            getHorizontalSize(
                                              20.00,
                                            ),
                                          ),
                                          topRight: Radius.circular(
                                            getHorizontalSize(
                                              0.00,
                                            ),
                                          ),
                                          bottomLeft: Radius.circular(
                                            getHorizontalSize(
                                              0.00,
                                            ),
                                          ),
                                          bottomRight: Radius.circular(
                                            getHorizontalSize(
                                              20.00,
                                            ),
                                          ),
                                        ),

                                      ),
                                      child: InkWell(
                                        
                                        highlightColor: Color.fromARGB(255, 72, 146, 75),
                                        onTap: (() => 
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectedCarDetail(
                                                      model:
                                                          
                                                              model,
                                                      brand:
                                                          brand)))
                                        
                                  
                                                          ),

                                        child: Text(
                                          "Detailes",
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.whiteA700,
                                            fontSize: getFontSize(
                                              20,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            24.00,
                          ),
                          right: getHorizontalSize(
                            24.00,
                          ),
                          bottom: getVerticalSize(
                            10.00,
                          ),
                        ),
                        child: Image.asset(
                          image,
                          height: getVerticalSize(
                            109.00,
                          ),
                          width: getHorizontalSize(
                            194.00,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
