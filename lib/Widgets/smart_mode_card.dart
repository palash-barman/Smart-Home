
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/Utils/icons.dart';
import 'package:smart_home/Widgets/custom_padding.dart';

import '../Utils/colors.dart';
import '../Utils/text_style.dart';

class SmartModeCard extends StatelessWidget {
  const SmartModeCard({super.key,required this.data});
   final dynamic data;
  @override
  Widget build(BuildContext context) {
    return  Container(
                           // height: 112.h,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 8.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: const Color(0xFF0E1F35)
                                          .withOpacity(0.12))
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

   //<------------  Divice Name ------------>
                                        Text(
                                          data["deviceName"],
                                          style: CustomTextStyle.h6(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textColor),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                     //<------------  Room Name ------------>
                                            Text(
                                              data["roomName"],
                                              style: CustomTextStyle.h7(
                                                  color: AppColors.textColor),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                              child: VerticalDivider(
                                                color: AppColors.textColor,
                                              ),
                                            ),
                             //<------------  Day Name ------------>
                                            Text(
                                              data["day"],
                                              style: CustomTextStyle.h7(
                                                  color: AppColors.textColor),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
 //<-----------------------------------  Switch  ------------>
                                    Image.asset(
                                    data["status"] =="on"? AppIcons.on:AppIcons.off,
                                      height: 24.h,
                                      width: 55.w,
                                      fit: BoxFit.fill,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
              //<----------------------------------- Device Image    ---------------------------------->
                                        Image.asset(
                                          data["image"],
                                          height: 40.h,
                                          width: 40.w,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
         //<-----------------------------------  From    ---------------------------------->
                                              Text(
                                                "from",
                                                style: CustomTextStyle.h7(
                                                    color:
                                                        AppColors.textColor),
                                              ),
                                              Text(
                                                data["from"],
                                                style: CustomTextStyle.h7(
                                                    color:
                                                        AppColors.textColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                overflow:
                                                    TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                    SizedBox(
                                      height: 56.h,
                                      child: VerticalDivider(
                                        color: AppColors.textColor,
                                      ),
                                    ),
       //<----------------------------------- To    ---------------------------------->                             
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "to",
                                          style: CustomTextStyle.h7(
                                              color: AppColors.textColor),
                                        ),
                                        Text(
                                          data["to"],
                                          style: CustomTextStyle.h7(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    )),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    SizedBox(
                                      height: 56.h,
                                      child: VerticalDivider(
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    //<----------------------------------- Delete and update    ---------------------------------->
                                    Column(
                                      children: [
                                        _delAndUpButton(AppIcons.deleteIcon),
                                        const SizedPad(8),
                                        _delAndUpButton(AppIcons.edit)
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
  
  }

  _delAndUpButton(String image) {
    return Container(
                                          height: 24.h,
                                          width: 24.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    color:
                                                        AppColors.shadowColor)
                                              ]),
                                          child: Image.asset(
                                            image,
                                            height: 16.h,
                                            width: 16.h,
                                          ),
                                        );
  }

}