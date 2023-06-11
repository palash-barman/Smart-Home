import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Utils/colors.dart';

import '../Utils/icons.dart';
import '../Utils/text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.image,required this.titile
  });
  final String titile;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:10.h),
      child: Row(
    children: [
      InkWell(
        onTap: (){
          Get.back();
        },
        child: Row(
          children: [
          
          Icon(Icons.arrow_back_ios,size:12.h,color: AppColors.white,),
          Text("Back",style: CustomTextStyle.h7(color:AppColors.white),),
          // ListTile(
          //   leading: Icon(Icons.arrow_back_ios,size:8.h,),
          //   title: Text("Back",style: CustomTextStyle.h7(color:AppColors.white),),
          // ),
          ])),
          Expanded(child:Center(child: Text(titile,style: CustomTextStyle.h3(fontWeight: FontWeight.w600,color: AppColors.white),))),
           Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            AppIcons.search,
            height: 20.h,
            width: 20.h,
            fit: BoxFit.fill,
          ),
          ),
          
         
      
    ],
      ),
    );
  }
}