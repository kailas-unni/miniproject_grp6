import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:notify_v1/utils.dart';
//import 'package:myapp/log-in/home.dart';
import 'package:notify_v1/forgot-password.dart';
import 'package:notify_v1/sign-up.dart';

import 'home.dart';

class LogIn extends StatelessWidget {
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
              // loginJCp (5:32)
              padding:
                  EdgeInsets.fromLTRB(17 * fem, 136 * fem, 17 * fem, 159 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff9c54d5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroup92cxX5a (JRBrhA8PbVgXvB8oSy92cx)
                    margin: EdgeInsets.fromLTRB(
                        102 * fem, 0 * fem, 103 * fem, 176 * fem),
                    width: double.infinity,
                    height: 65 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // notifyzzk (5:48)
                          left: 0 * fem,
                          top: 16 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 121 * fem,
                              height: 49 * fem,
                              child: Text(
                                'Notify',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.2125 * ffem / fem,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // notificationsactiven9v (16:127)
                          left: 67 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 34.15 * fem,
                              height: 34.15 * fem,
                              child: Image.asset(
                                'assets/log-in/images/notifications-active-z3a.png',
                                width: 34.15 * fem,
                                height: 34.15 * fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupr7uj1YU (JRBrsQLKVwMVtxQRztr7uJ)
                    width: double.infinity,
                    height: 264 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle1JnU (5:33)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 326 * fem,
                              height: 201 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  color: Color(0xffeee5e9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle2Apg (5:34)
                          left: 69 * fem,
                          top: 40 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 215 * fem,
                              height: 35 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  color: Color(0x336b728e),
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
                        Positioned(
                          // rectangle3QDE (5:35)
                          left: 69 * fem,
                          top: 93 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 215 * fem,
                              height: 35 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  color: Color(0x336b728e),
                                ),
                                child: TextField(
                                  obscureText: true,
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
                        Positioned(
                          // rectangle4DgU (5:36)
                          left: 104 * fem,
                          top: 146 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 118 * fem,
                              height: 35 * fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home();
                                  }));
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    color: Color(0x336b728e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // login4SC (5:43)
                          left: 144 * fem,
                          top: 156 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 38 * fem,
                              height: 15 * fem,
                              child: Text(
                                'LOGIN',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // accountboxhk4 (5:37)
                          left: 19 * fem,
                          top: 41 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 34 * fem,
                              height: 34 * fem,
                              child: Image.asset(
                                'assets/log-in/images/account-box.png',
                                width: 34 * fem,
                                height: 34 * fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // lockkiL (5:40)
                          left: 19 * fem,
                          top: 91 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 34 * fem,
                              height: 34 * fem,
                              child: Image.asset(
                                'assets/log-in/images/lock.png',
                                width: 34 * fem,
                                height: 34 * fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // forgotpasswordENc (5:45)
                          left: 221 * fem,
                          top: 219 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 105 * fem,
                              height: 15 * fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ForgotPassword();
                                  }));
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'Forgot Password?',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // newuserd9r (16:130)
                          left: 221 * fem,
                          top: 249 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 63 * fem,
                              height: 15 * fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignUp();
                                  }));
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'New User?',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // polygon1eak (5:47)
                          left: 25 * fem,
                          top: 139.0000076294 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 112.48 * fem,
                              height: 124.73 * fem,
                              child: Image.asset(
                                'assets/log-in/images/polygon-1.png',
                                width: 112.48 * fem,
                                height: 124.73 * fem,
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
      ),
    );
  }
}
