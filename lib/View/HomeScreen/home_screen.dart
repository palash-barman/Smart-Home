import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:smart_home/Routes/routes.dart';
import 'package:smart_home/Utils/colors.dart';
import 'package:smart_home/Utils/icons.dart';
import 'package:smart_home/Utils/images.dart';
import 'package:smart_home/Utils/text.dart';
import 'package:smart_home/Utils/text_style.dart';
import 'package:smart_home/Widgets/custom_padding.dart';


import '../../Controller/home_controller.dart';

import '../../Widgets/custom_device_card.dart';

import '../../Widgets/custom_room_card.dart';
import '../../Widgets/heading_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            _headerPart(),
            Container(
              color: AppColors.main2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(40.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // <-------------- Rooms Section ------------>
                    const SizedPad(18),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.rooms,
                            style: CustomTextStyle.h4(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColor),
                          ),
                          InkWell(
                              onTap: () {
                                Get.toNamed(Routes.seeAllRoom);
                              },
                              child: Text(
                                "See all",
                                style: CustomTextStyle.h5(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.main2),
                              ))
                        ],
                      ),
                    ),

                    const SizedPad(2),
                    MasonryGridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:2,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Get.toNamed(Routes.roomDetailsScreen);
                            },
                            child: RoomCard(
                              data: _homeController.roomList[index],
                            ),
                          );
                        }),
                    // <-------------- Active Section ------------>
                    const SizedPad(14),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: HeadingTile(
                        title: AppText.active,
                        value: "6",
                        trailing: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.activeDevice);
                            },
                            child: Text(
                              "See all",
                              style: CustomTextStyle.h5(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.main2),
                            )),
                      ),
                    ),
                    const SizedPad(8),
                    MasonryGridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Get.toNamed(Routes.itemDetails);
                            },
                            child: CustomDeviceCard(
                              deviceModel: _homeController.activeList[index],
                            ),
                          );
                          
                        
                        }),
                  ],
                ),
              ),
            ),
            const SizedPad(88)
          ],
        ),
      ),
    );
  }

  _headerPart() {
    return Container(
      // height: 390.h,
      decoration: BoxDecoration(
          color: AppColors.main2,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r))),
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            AppImages.home,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Column(
            children: [
              const SizedPad(25),
              ListTile(
                dense: true,
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                title: Text(
                  "Good morning",
                  style: CustomTextStyle.h2(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                subtitle: Text(
                  "Kimberly Mastrangelo",
                  style: CustomTextStyle.h6(color: AppColors.textColor),
                ),
                trailing: Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(color: AppColors.main2, width: 0.5)),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppIcons.notification,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ),
              const SizedPad(16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                // height: 174.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                decoration: BoxDecoration(
                    color: AppColors.surface2,
                    borderRadius: BorderRadius.circular(28.r),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: AppColors.surface2.withOpacity(0.12))
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.sunBehindCloud,
                          height: 60.h,
                          width: 60.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "May 18,2023 10.05 am",
                              style: CustomTextStyle.h7(
                                  color: AppColors.textColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Cloudy",
                              style: CustomTextStyle.h4(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Jakarta, Indonesia",
                              style: CustomTextStyle.h7(
                                  color: AppColors.textColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 12.w,
                        ),
                        Row(
                          children: [
                            Text(
                              "19°",
                              style: CustomTextStyle.customSize(
                                  size: 40.sp,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "c",
                              style: CustomTextStyle.customSize(
                                  size: 30.sp,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedPad(9),
                    Divider(
                      height: 0.5,
                      color: AppColors.main2,
                    ),
                    const SizedPad(9),
                    Row(
                      children: [
                        Expanded(
                            child: _cloduyCard(
                                image: AppIcons.humidity,
                                title: "97",
                                subtitle: "%",
                                bodyText: "Humadity")),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                            child: _cloduyCard(
                                image: AppIcons.eyes,
                                title: "7",
                                subtitle: "km",
                                bodyText: "Visibility")),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                            child: _cloduyCard(
                                image: AppIcons.humidity,
                                title: "3",
                                subtitle: "km/h",
                                bodyText: "NE Wind"))
                      ],
                    )
                  ],
                ),
              ),
              const SizedPad(13),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                AppIcons.twemojiSun,
                height: 50.h,
                width: 50.h,
              ))
        ],
      ),
    );
  }

  _cloduyCard(
      {required String image,
      required String title,
      required String subtitle,
      required String bodyText}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.white.withOpacity(0.3)),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: AppColors.white,
                child: Image.asset(
                  image,
                  height: 20.r,
                  width: 20.r,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: title,
                    style: CustomTextStyle.h4(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                    children: [
                      TextSpan(
                          text: subtitle,
                          style: CustomTextStyle.h7(color: AppColors.textColor))
                    ]),
              )
            ],
          ),
          Text(
            bodyText,
            style: CustomTextStyle.h7(color: AppColors.textColor),
          )
        ],
      ),
    );
  }
}
