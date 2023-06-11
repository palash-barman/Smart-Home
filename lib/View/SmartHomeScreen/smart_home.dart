import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Utils/colors.dart';

import 'package:smart_home/Utils/text.dart';
import 'package:smart_home/Utils/text_style.dart';
import 'package:smart_home/Widgets/custom_padding.dart';
import 'package:smart_home/Widgets/heading_tile.dart';

import '../../Controller/smart_home_controller.dart';
import '../../Utils/icons.dart';
import '../../Widgets/smart_mode_card.dart';

class SmartHomeScreen extends StatelessWidget {
  SmartHomeScreen({super.key});

  final _smartHomeController = Get.put(SmartHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface2,
      appBar: _appBar(),
      body: _body(),
    );
  }

 _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.main2,
       leading:const SizedBox(),
      leadingWidth: 0,
      title: Text(
        AppText.smartHome,
        style: CustomTextStyle.h2(
            fontWeight: FontWeight.w600, color: AppColors.white),
      ),
      actions: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            AppIcons.filter,
            height: 20.h,
            width: 20.h,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 18.w,
        )
      ],
    );
  }

 _body() {
    return Column(
      children: [
        Container(
          height: 71.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.main2,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(40.r))),
          child: Container(
            height: 56.h,
            margin: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.surface2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Living Room",
                  style: CustomTextStyle.h5(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor),
                ),
                Image.asset(
                  AppIcons.dropDown,
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            //  height: double.maxFinite,
            color: AppColors.main2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              //   margin: EdgeInsets.only(top: 20.h),
              decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(40.r))),
              child: Column(
                children: [
                  const SizedPad(20),
                  HeadingTile(title: AppText.smartMode, value: "4"),
                  const SizedPad(8),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _smartHomeController.smartList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SmartModeCard(data: _smartHomeController.smartList[index]);
                        }),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

}






