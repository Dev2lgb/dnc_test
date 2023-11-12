import 'dart:math';

import 'package:dnc_test/Utils/custom_dialog.dart';
import 'package:dnc_test/api/auth.dart';
import 'package:dnc_test/model/login_response_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/foundation.dart' as foundation;

class LoginIndex extends StatefulWidget{
  @override
  LoginIndexState createState() => new LoginIndexState();
}


class LoginIndexState extends State<LoginIndex> {
  // bool _isKakaoTalkInstalled = false;

  @override
  void initState() {
    // KakaoLogin.initKakaoTalkInstalled().then((result) {
    //   setState(() {
    //     _isKakaoTalkInstalled = result;
    //   });
    // });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        child: Scaffold(
          backgroundColor: HexColor('#0024EE'),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 50),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/intro', (route) => false);
                            },
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset('assets/images/close-icon.png'),
                            ),
                          ),
                          // SizedBox(
                          //   width: 30,
                          //   height: 30,
                          //   child: Image.asset('assets/images/close-icon.png'),
                          // ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/find/pw/step01');
                              },
                              child: Text('비밀번호 찾기',
                                style: TextStyle(
                                    color: Colors.white
                                ),)
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text('로그인',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text('로그인 계정 방법을 선택하여 주세요.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login/email');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                              decoration: BoxDecoration(
                                color: HexColor('#ffffff'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Image.asset('assets/images/login_email_icon.png'),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '이메일로 로그인',
                                      style: TextStyle(
                                        color: HexColor('#293bf0'),
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: HexColor('#ffffff'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Text('또는 아래 소셜 계정으로 로그인',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: HexColor('#ffffff'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            onPressed: () {
                              print('카카오 로그인');

                              // if (_isKakaoTalkInstalled) {
                              //   KakaoLogin.loginWithTalk().then((accessToken) {
                              //     if (accessToken != null) {
                              //       _snsLogin('kakao', accessToken);
                              //     }
                              //   });
                              // } else {
                              // KakaoLogin.loginWithKakao().then((accessToken) {
                              //   if (accessToken != null) {
                              //     _snsLogin('kakao', accessToken);
                              //   }
                              // });
                              // }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                              decoration: BoxDecoration(
                                color: HexColor('#ffe500'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Image.asset('assets/images/login_kakao_talk_icon.png'),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '카카오로 로그인',
                                      style: TextStyle(
                                        color: HexColor('#462b34'),
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            onPressed: () {
                              print('네이버 로그인');
                              //
                              // NaverLogin.login().then((accessToken) {
                              //   if (accessToken != null) {
                              //     _snsLogin('naver', accessToken);
                              //   }
                              // });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                              decoration: BoxDecoration(
                                color: HexColor('#2db400'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset('assets/images/login_naver_icon.png'),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '네이버로 로그인',
                                      style: TextStyle(
                                        color: HexColor('#ffffff'),
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            onPressed: () {
                              print('구글로 로그인');

                              // GoogleLogin.login().then((accessToken) {
                              //   if (accessToken != null) {
                              //     _snsLogin('google', accessToken);
                              //   }
                              // });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                              decoration: BoxDecoration(
                                color: HexColor('#e24939'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset('assets/images/login_google_icon.png'),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '구글로 로그인',
                                      style: TextStyle(
                                        color: HexColor('#ffffff'),
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                        foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS ?
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            onPressed: () {
                              print('Apple로 로그인');

                              // AppleLogin.login().then((accessToken) {
                              //   print('apple login result accessToken: $accessToken');
                              //
                              //   if (accessToken != null) {
                              //     _snsLogin('apple', accessToken);
                              //   }
                              // });
                              // AppleLogin.signInWithApple().then((accessToken) {
                              //   print('apple login result accessToken: $accessToken');
                              //
                              //   if (accessToken != null) {
                              //     _snsLogin('apple', accessToken);
                              //   }
                              // });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset('assets/images/apple_logo.png'),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Apple로 로그인',
                                      style: TextStyle(
                                        color: HexColor('#ffffff'),
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        )
                            :
                        Container(),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () => ({
                              Navigator.pushNamed(context, '/register')
                            }),
                            child: Text('회원가입',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/intro', (route) => false);

        return false;
      },
    );
  }
}