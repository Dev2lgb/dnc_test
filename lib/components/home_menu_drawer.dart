import 'package:dnc_test/Utils/custom_dialog.dart';
import 'package:dnc_test/Utils/shared_pref_utils.dart';
import 'package:dnc_test/api/auth.dart';
import 'package:dnc_test/api/setting.dart';
import 'package:dnc_test/model/app_config.dart';
import 'package:dnc_test/model/user.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dnc_test/components/highlight_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeMenuDrawer extends StatefulWidget {
  @override
  _HomeMenuDrawerState createState() => _HomeMenuDrawerState();
}

class _HomeMenuDrawerState extends State<HomeMenuDrawer> {
  User? myUser;
  // String userType = SharedPrefUtils.userTypeNormal;

  AppConfig? appConfig;

  String? version;

  @override
  void initState() {
    print('_HomeMenuDrawerState - initState()');

    _initMyUser();
    // _initMyUserType();
    _initAppConfig();

    super.initState();
  }

  void _initAppConfig() {
    getAppConfig().then((response) {
      if (response.status == 'success') {
        AppConfig resultData = AppConfig.fromJSON(response.data);

        setState(() {
          appConfig = resultData;
        });
      }
    });

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;

      print('appName: $appName');
      print('packageName: $packageName');
      print('version: $version');
      print('buildNumber: $buildNumber');

      setState(() {
        this.version = version;
      });
    });
  }
  //
  //
  // _initMyUserType() {
  //   SharedPrefUtils.getUserType().then((userType) {
  //     setState(() {
  //       this.userType = userType;
  //     });
  //   });
  // }

  void _initMyUser() {
    SharedPrefUtils.getUser().then((value) {
      setState(() {
        myUser = value;
      });

      getMyUser().then((response) {
        if (response.status == 'success') {
          User user = User.fromJSON(response.data);

          SharedPrefUtils.setUser(user).then((value) {
            SharedPrefUtils.getUser().then((user) {
              setState(() {
                myUser = user;
              });
            });
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: ListView(
          children: [
            Container(
              height: 0,
              child: DrawerHeader(
                child: Text('title', style: TextStyle(color: Colors.white)),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/images/logo-gray.png', fit: BoxFit.cover),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset('assets/images/menu-close-icon.png', fit: BoxFit.cover),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '프로필 및 계정',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#9e9e9e'),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '고객지원',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#9e9e9e'),
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
    );
  }
}