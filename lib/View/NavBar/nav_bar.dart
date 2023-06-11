import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Controller/nav_bar_controller.dart';
import 'package:smart_home/Utils/colors.dart';
import 'package:smart_home/Utils/icons.dart';
import 'package:smart_home/Utils/text.dart';
import 'package:smart_home/Utils/text_style.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({super.key});
  final _navController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBody: true,
        body: Obx(
            () => _navController.pageList[_navController.selectIndex.value]),
        bottomNavigationBar: Container(
          height: 88.h,
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColors.main2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                    color: AppColors.black.withOpacity(0.30)),
                BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                    color: AppColors.black.withOpacity(0.15))
              ]),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navBarItem(
                    onTap: () {
                      _navController.selectIndex.value = 0;
                    },
                    icon: _navController.selectIndex.value == 0
                        ? AppIcons.homeFill
                        : AppIcons.home,
                    isSelect:
                        _navController.selectIndex.value == 0 ? true : false,
                    label: AppText.home),
                _navBarItem(
                    onTap: () {
                      _navController.selectIndex.value = 1;
                    },
                    icon: _navController.selectIndex.value == 1
                        ? AppIcons.netFill
                        : AppIcons.net,
                    isSelect:
                        _navController.selectIndex.value == 1 ? true : false,
                    label: AppText.smart),
                _navBarItem(
                    onTap: () {
                      _navController.selectIndex.value = 2;
                    },
                    icon: _navController.selectIndex.value == 2
                        ? AppIcons.pieFill
                        : AppIcons.pie,
                    isSelect:
                        _navController.selectIndex.value == 2 ? true : false,
                    label: AppText.usage),
                _navBarItem(
                    onTap: () {
                      _navController.selectIndex.value = 3;
                    },
                    icon: _navController.selectIndex.value == 3
                        ? AppIcons.userFill
                        : AppIcons.user,
                    isSelect:
                        _navController.selectIndex.value == 3 ? true : false,
                    label: AppText.profile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navBarItem(
      {required Function() onTap,
      required String icon,
      required String label,
      required bool isSelect}) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
        alignment: Alignment.center,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 24.h,
              width: 24.h,
            ),
            isSelect
                ? SizedBox(
                    width: 8.w,
                  )
                : const SizedBox(),
            isSelect
                ? Text(
                    label,
                    style: CustomTextStyle.h6(
                        fontWeight: FontWeight.w600, color: AppColors.main2),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
