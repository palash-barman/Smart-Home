import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.height,
    this.width,
    this.radius,
  });

  final Function() onTap;
  final Widget child;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 52.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 8.r),
              color: AppColors.main,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: AppColors.black.withOpacity(0.25))
              ]),
          alignment: Alignment.center,
          child: child),
    );
  }
}
