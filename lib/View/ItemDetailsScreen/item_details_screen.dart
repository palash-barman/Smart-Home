import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Utils/colors.dart';
import 'package:smart_home/Widgets/custom_padding.dart';
import 'package:smart_home/Widgets/smart_mode_card.dart';

import '../../Controller/item_details_controller.dart';
import '../../Utils/icons.dart';
import '../../Utils/images.dart';
import '../../Utils/text.dart';
import '../../Utils/text_style.dart';
import '../../Widgets/heading_tile.dart';

class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen({super.key});

  final _itemDetailsController = Get.put(ItemDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 477.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.main2,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40.r))),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Align(
                        alignment: const Alignment(0.3, 5),
                        child: Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFA721).withOpacity(0.02),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(90, 80),
                                    color: const Color(0xFFFFA721)
                                        .withOpacity(0.01)),
                                const BoxShadow(
                                    blurRadius: 90,
                                    offset: Offset(50, 50),
                                    color: Color(0xFFFFA721)),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 0,
                      right: 10.w,
                      child: Image.asset(
                        AppImages.lempShow,
                        height: 206.h,
                        width: 147.w,
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 35.h, left: 16.w, right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _appBar(),
                          const SizedPad(10),
                          Text(
                            "Dining Room",
                            style: CustomTextStyle.h6(color: AppColors.white),
                          ),
                          const SizedPad(12),
                          Image.asset(
                            AppIcons.off,
                            width: 55.w,
                            height: 24.h,
                          ),
                          const SizedPad(26),
                          RichText(
                              text: TextSpan(
                                  text: "80",
                                  style: CustomTextStyle.customSize(
                                      size: 50.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                    text: "%",
                                    style: CustomTextStyle.h2(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                    ))
                              ])),
                          const SizedPad(12),
                          Text(
                            "Brightness",
                            style: CustomTextStyle.h5(color: AppColors.white),
                          ),
                          const SizedPad(12),
                          Text(
                            "Insensity",
                            style: CustomTextStyle.h6(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedPad(12),
                          Image.asset("assets/images/slider.png",height:42.h,width: double.infinity,fit: BoxFit.fill,),
                        const SizedPad(20),
                        Divider(
                         height:0.5, 
                         color: AppColors.surface2.withOpacity(0.5),
                        ),
                         const SizedPad(20),
                         Text("Usages",style: CustomTextStyle.h6(fontWeight: FontWeight.w600,color: AppColors.white),)
                        , 
                         _listTile("Use Today","50","watt"),
                            _listTile("Use Week","500","kwh"),
                               _listTile("Use Today","5000","kwh")

                        ],
                      ))
                ],
              ),
            ),
            _schedule()
          ],
        ),
      ),
    );
  }

   _listTile(String name,String value,String unit) {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(name,style: CustomTextStyle.h7(color: Colors.white),)
                           , RichText(text: TextSpan(
                            text: value,style: CustomTextStyle.h5(fontWeight: FontWeight.w600,color:AppColors.white)
                          ,children: [
                            TextSpan(
                            text: " $unit",style: CustomTextStyle.h6(color:AppColors.white)
                           )
                          ]
                          
                           ))
                          ],
                        );
  }

  _appBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Get.back();
            },
            child: Row(children: [
              Icon(
                Icons.arrow_back_ios,
                size: 12.h,
                color: AppColors.white,
              ),
              Text(
                "Back",
                style: CustomTextStyle.h7(color: AppColors.white),
              ),
              // ListTile(
              //   leading: Icon(Icons.arrow_back_ios,size:8.h,),
              //   title: Text("Back",style: CustomTextStyle.h7(color:AppColors.white),),
              // ),
            ])),
        Text(
          "Lamp",
          style: CustomTextStyle.h3(
              fontWeight: FontWeight.w600, color: AppColors.white),
        ),
        const SizedBox()
      ],
    );
  }

  _schedule() {
    return Container(
      color: AppColors.main2,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.surface2,
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.r))),
        child: Column(
          children: [
            const SizedPad(16),
            _headerTile(),
            const SizedPad(10),
            ListView.builder(
                itemCount: _itemDetailsController.smartList.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SmartModeCard(
                      data: _itemDetailsController.smartList[index]);
                }),
          ],
        ),
      ),
    );
  }

  _headerTile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: HeadingTile(
        title: AppText.schedule,
        value: "3",
        trailing: Container(
          height: 32.h,
          width: 32.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                    color: AppColors.black.withOpacity(0.3)),
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                    spreadRadius: 2,
                    color: AppColors.black.withOpacity(0.15))
              ]),
          child: Image.asset(
            AppIcons.addIcon,
            height: 16.h,
            width: 16.h,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
