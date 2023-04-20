import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:notify_v1/utils.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Container(
              // signupyw6 (8:33)
              width: double.infinity,
              height: 800 * fem,
              decoration: BoxDecoration(
                color: Color(0xff9c54d5),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // autogroupzrh2UN4 (JRBsfoAgZY2jNuvfCxzRh2)
                    left: 20 * fem,
                    top: 145 * fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          47 * fem, 10 * fem, 74 * fem, 99 * fem),
                      width: 320 * fem,
                      height: 472 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffeee5e9),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // signupSy6 (16:2)
                            margin: EdgeInsets.fromLTRB(
                                27 * fem, 0 * fem, 0 * fem, 34 * fem),
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 25 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.2125 * ffem / fem,
                                fontStyle: FontStyle.italic,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupsosgVwN (JRBt2xE6e6J85n2XhAsoSg)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1 * fem, 33 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // nameCKz (8:35)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 31 * fem, 0 * fem),
                                  child: Text(
                                    'Name',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupbka85Pn (JRBtBCVMjXChpecL63BKA8)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                                  width: 133 * fem,
                                  height: 18.5 * fem,
                                  child: Align(
                                    // rectangle8yVA (16:64)
                                    alignment: Alignment.topLeft,
                                    child: SizedBox(
                                      width: 130 * fem,
                                      height: 17 * fem,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffeee5e9),
                                        ),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupa2ksoyz (JRBtKhFCgKxLLm2cFYA2KS)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 36 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // branchJfr (8:36)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                  child: Text(
                                    'Branch',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogrouphz4uPSQ (JRBtSGta6aZGDNhtBXHZ4U)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                                  width: 132 * fem,
                                  height: 17.5 * fem,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogrouppvtvqZJ (JRBtY74Bxhd3kGsiocPVTv)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 36 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // batchYTi (16:3)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 33 * fem, 0 * fem),
                                  child: Text(
                                    'Batch',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupnd92CoA (JRBtfmW64vDrLFqjjfnD92)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                                  width: 132 * fem,
                                  height: 17.5 * fem,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupqxmwGHE (JRBtkw29fNNB7rSxyQQxMW)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 36 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // adnoANc (16:18)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 24 * fem, 0 * fem),
                                  child: Text(
                                    'Ad. No.',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupshegF9A (JRBtsGAwEF84DEHm8ksHeg)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                                  width: 132 * fem,
                                  height: 17.5 * fem,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogrouphaiuioS (JRBu4WMCYCBDJxuJmDHAiU)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 36 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // phno2ZE (16:21)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 25 * fem, 0 * fem),
                                  child: Text(
                                    'Ph. No.',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupej3zWzC (JRBuBRKM6HEsZEMtPNeJ3z)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                                  width: 132 * fem,
                                  height: 17.5 * fem,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogrouprrujnRv (JRBuHVyYon9hsNNCn6RRuJ)
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  // emailWcp (16:24)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 35 * fem, 0 * fem),
                                  child: Text(
                                    'Email',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogrouprartCEk (JRBuP5eapXNSd2hZdYrArt)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 2.5 * fem),
                                  width: 132 * fem,
                                  height: 17.5 * fem,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
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
                  Positioned(
                    // gobackfe8 (8:53)
                    left: 20 * fem,
                    top: 23 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 45 * fem,
                        height: 45 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/log-in/images/go-back-Bi8.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // smallbuttonfalseJh6 (16:29)
                    left: 144 * fem,
                    top: 554 * fem,
                    child: Container(
                      width: 85 * fem,
                      height: 36 * fem,
                      child: Container(
                        // buttonotk (16:27)
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff2b2e4a)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(999 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1 * ffem / fem,
                              color: Color(0xff2b2e4a),
                            ),
                          ),
                        ),
                      ),
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
