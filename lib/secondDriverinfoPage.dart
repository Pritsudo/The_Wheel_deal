import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_wheel_deal/core/app_export.dart';
import 'package:the_wheel_deal/model/driver_info.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  // const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    var rand = Random();
    var driverid = rand.nextInt(10);
    final selectDriver = Driver_detial.firstWhere(
      (driver) {
        return driver.id == driverid;
      },
    );
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Stack(
              //   children: [],
              // ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    selectDriver.image,
                  ),
                ),
              ),
              Container(
                width: 290,
                height: 0,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                child: Container(
                  width: 290,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Name of Driver : ${selectDriver.name}',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          'Age of driver :${selectDriver.age}',
                          style:
                             TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          'Experience of driver : ',
                          style:
                              TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 85, 105, 0),
                        child: Text(
                          'Mobile number: ${selectDriver.mob_number}',
                          textAlign: TextAlign.end,
                          style:
                             TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF939292),
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
    );
  }
}