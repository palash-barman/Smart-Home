import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/Widgets/custom_padding.dart';

import '../Utils/colors.dart';
import '../Utils/text_style.dart';

class RoomCard extends StatelessWidget {
    const RoomCard({
    super.key,
    required this.data,
  });
 final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 190.h,
      margin:EdgeInsets.symmetric(horizontal:6.w,vertical:6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.surface2,
        boxShadow: [
          BoxShadow(
            offset:const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
            color:const Color(0xFF0E1F35).withOpacity(0.08)
          ),
            BoxShadow(
            offset:const Offset(0, 1),
            blurRadius: 4,
            spreadRadius: 0,
            color:const Color(0xFF0E1F35).withOpacity(0.12)
          )
        ]
        
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 14.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
               // width: 45.w,
                height: 21.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color:AppColors.main2
                  ),
                  alignment: Alignment.center,
                  child: Text(data["temprature"],style: CustomTextStyle.h6(fontWeight: FontWeight.w600,color: AppColors.white),overflow: TextOverflow.ellipsis,maxLines: 1,),
                ),
              const  Spacer()
            ],
          ),
       const  SizedPad(2),
          Image.asset(data["image"],height: 100.h,width: 100.w,),
        const  SizedPad(5),
          Text(data["room_name"],style: CustomTextStyle.h4(fontWeight: FontWeight.w600,color: AppColors.textColor),),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: const Color(0xFFFFE266),
                ),
                child: Text(data["devices"],style: CustomTextStyle.h7(fontWeight: FontWeight.w600),),

              ),
              SizedBox(width: 2.w,),
              Text("devices",style: CustomTextStyle.h7(color:AppColors.textColor),)
            ],
          )



        ],
      ),
    );
  }
}
