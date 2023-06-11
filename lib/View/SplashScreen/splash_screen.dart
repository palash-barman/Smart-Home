import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Routes/routes.dart';
import 'package:smart_home/Utils/colors.dart';
import 'package:smart_home/Utils/icons.dart';
import 'package:smart_home/Utils/images.dart';
import 'package:smart_home/Utils/text.dart';
import 'package:smart_home/Utils/text_style.dart';
import 'package:smart_home/Widgets/custom_button.dart';
import 'package:smart_home/Widgets/custom_padding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),

    );
  }

   _body(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.splashBg),fit: BoxFit.fill)
      ),
      child: SafeArea(
        child: Padding(
          
          padding:  EdgeInsets.symmetric(horizontal:24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const   SizedPad(15),
            //<------------- text -------------->
            Text(AppText.smartme,style: CustomTextStyle.h5(color:AppColors.surface2,fontWeight: FontWeight.w600),)
            ,const   SizedPad(67),
            Text(AppText.wellcomeHome,style: CustomTextStyle.h1(fontWeight:FontWeight.w600,color:AppColors.surface2),)
          ,
           //<------------- text component -------------->
          const   SizedPad(12) ,Text(AppText.splashContent,style: CustomTextStyle.h6(color:AppColors.white,),),
          const   SizedPad(66),

          //<------------- image -------------->
          Image.asset(AppImages.splash,height: 260.h,fit:BoxFit.fill,width: double.infinity,),
          const SizedPad(70),

           //<------------- Button -------------->
        CustomButton(onTap: (){
            Get.toNamed(Routes.nevbarScreen);
          
        },
        height:48.h,
        radius: 8.r,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppText.getStarted,style:CustomTextStyle.h5(fontWeight: FontWeight.w600,color: AppColors.white),),
            Image.asset(AppIcons.next,color:AppColors.white,height:24.h,width:24.h,)

          ],
        ),)
            ],
          ),
        ),
      ),
      
    );
  }
}
