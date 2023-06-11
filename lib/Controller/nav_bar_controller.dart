import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_home/View/HomeScreen/home_screen.dart';

import '../View/SmartHomeScreen/smart_home.dart';
import '../View/UsageScreen/usage_screen.dart';

class NavBarController extends GetxController{

    var selectIndex=0.obs;


    List pageList=[
        HomeScreen(),
        SmartHomeScreen(),
        UsageScreen(),
        Container(),
    ];




}