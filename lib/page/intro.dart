import 'package:dnc_test/Utils/custom_dialog.dart';
import 'package:dnc_test/Utils/shared_pref_utils.dart';
import 'package:dnc_test/api/auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class IntroPage extends StatefulWidget {
  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/introback.png"),
            fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.8),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Text('유휴공간 중개플랫폼', style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('노는공간 찾아보고', style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                    Container(
                      child: Text('인테리어하고', style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                    Container(
                      child: Text('등록하세요', style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, bottom: 50),
                      child: Text('놀고있는 빈공간 간편하게 공유하세요', style: TextStyle(fontSize: 15, color: Colors.white),),
                    ),
                    Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: HexColor('#293bf0')
                          ),
                          onPressed: () {
                            CustomDialog.showProgressDialog(context);
                            SharedPrefUtils.clearAccessToken().then((value) {
                              SharedPrefUtils.clearUser().then((value) {
                                CustomDialog.dismissProgressDialog();
                                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                              });
                            });
                          },
                          child: Text('시작하기', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('이미 사용중이신가요?', style: TextStyle(color: HexColor('#c3c3c3')), textAlign: TextAlign.center,),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                              },
                              child: Text('로그인', style: TextStyle(color: HexColor('#c3c3c3')), textAlign: TextAlign.center,)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text('계속 진행시, 서비스 이용약관 및 개인정보 취급방침에 동의하게 됩니다',
                        style: TextStyle(color: Colors.white),),
                    )
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