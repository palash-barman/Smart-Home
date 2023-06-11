import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/colors.dart';
import '../Utils/text_style.dart';

class HeadingTile extends StatelessWidget {
   const HeadingTile({
    super.key,
  required  this.title,
   required this.value,
    this.trailing
  });

 final String title;
 final String value;
 final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    
    return Row(
      
      children: [
      Text(title,style: CustomTextStyle.h4(fontWeight: FontWeight.w600,color: AppColors.textColor),),

      Container(
       margin: EdgeInsets.only(left:4.w ),
                    padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.main2,
                    ),
                    child: Text(value,style: CustomTextStyle.h6(fontWeight: FontWeight.w600,color: AppColors.white),),

                  ),

      const Spacer(),
      trailing ?? const SizedBox(),
    
    ],);
  }
}

