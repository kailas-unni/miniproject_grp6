import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:notify_v1/utils.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Container(
            // forgotpasswordXYU (16:34)
            padding:
                EdgeInsets.fromLTRB(20 * fem, 24 * fem, 20 * fem, 262 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff9c54d5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // gobackCec (16:54)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 121 * fem),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 45 * fem,
                      height: 45 * fem,
                      child: Image.asset(
                        'assets/log-in/images/go-back.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  // autogrouphsuxdE8 (JRBvZoB5w6vd7dZEFShSUx)
                  padding: EdgeInsets.fromLTRB(
                      47 * fem, 37 * fem, 74.97 * fem, 33 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffeee5e9),
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // recovery4KS (16:55)
                        margin: EdgeInsets.fromLTRB(
                            26.97 * fem, 0 * fem, 0 * fem, 38 * fem),
                        child: Text(
                          'Recovery',
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
                        // autogroupukek7Hi (JRBvidFi1k8z1Pkp77ukEk)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0.02 * fem, 31 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // useridoRS (16:36)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 23.98 * fem, 0 * fem),
                              child: Text(
                                'User ID',
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
                              // autogroupn63iGpp (JRBvp86Yk2k3Ae9M32n63i)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 3.5 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  1.02 * fem, 0 * fem, 0.02 * fem, 0 * fem),
                              width: 131.03 * fem,
                              height: 18.5 * fem,
                              child: Align(
                                // rectangle9LZn (16:65)
                                alignment: Alignment.topRight,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your username',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogrouppqq6Cbz (JRBvwHZH9VekC9SQRppQq6)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 61 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // emailJf2 (16:37)
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
                              // autogrouptktxbPE (JRBw2NF9TVBPPL6ok1tktx)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 2 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  1 * fem, 0 * fem, 0.03 * fem, 0 * fem),
                              width: 131.03 * fem,
                              height: 20 * fem,
                              child: Align(
                                // rectangle10sLk (16:132)
                                alignment: Alignment.topRight,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your username',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // buttonjtk (I16:56;16:27)
                        margin: EdgeInsets.fromLTRB(
                            45 * fem, 0 * fem, 18.03 * fem, 0 * fem),
                        width: double.infinity,
                        height: 36 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff2b2e4a)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(999 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Send Reset Link',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
