import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/device_model.dart';
import '../Utils/colors.dart';
import '../Utils/icons.dart';
import '../Utils/text_style.dart';

class CustomDeviceCard extends StatelessWidget {
 const  CustomDeviceCard({
    super.key,
   required this.deviceModel
  });

  final DeviceModel deviceModel;

  @override
  Widget build(BuildContext context) {
    bool isDeviceOn=deviceModel.status=="Off"?false:true;
    return Container(
     //height: 141.h,
     width: double.infinity,
     padding: EdgeInsets.only(left:12.w,right: 12.w,bottom:16.h),
     margin: EdgeInsets.symmetric(horizontal:6.w,vertical: 6.h),
     
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(8.r),
       color:!isDeviceOn? AppColors.main:AppColors.surface
     ),
     child: Column(
       children: [
         Row(
           children: [
             Image.asset(deviceModel.image,height: 75.h,width: 76.w,),
            
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Text(deviceModel.title,style: CustomTextStyle.h7(color:isDeviceOn?AppColors.textColor: AppColors.white),overflow: TextOverflow.ellipsis,maxLines: 1,),
                   Text(deviceModel.value,style: CustomTextStyle.h5(color:isDeviceOn?AppColors.textColor:  AppColors.white,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,maxLines: 1)
                 ],
               ),
             )
           ],
         )
,  


 Row(
  crossAxisAlignment: CrossAxisAlignment.end,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(deviceModel.deviceName,style: CustomTextStyle.h3(color:isDeviceOn?AppColors.textColor:  AppColors.white,fontWeight: FontWeight.w600,),overflow: TextOverflow.ellipsis,maxLines: 1,),
          Text(deviceModel.roomName,style: CustomTextStyle.h7(color:isDeviceOn?AppColors.textColor:  AppColors.white,),overflow: TextOverflow.ellipsis,maxLines: 1,)
        ],
      ),
    ),
    
    Image.asset(isDeviceOn?AppIcons.on:AppIcons.off,width: 55.w,height: 24.h,)

  ],
)

       ],
     ),
    );
  }
}
