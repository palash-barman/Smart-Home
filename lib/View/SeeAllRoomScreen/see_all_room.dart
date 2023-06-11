import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:smart_home/Routes/routes.dart';
import 'package:smart_home/Utils/text.dart';


import 'package:smart_home/Widgets/custom_appbar.dart';
import 'package:smart_home/Widgets/custom_padding.dart';
import 'package:smart_home/Widgets/heading_tile.dart';

import '../../Controller/see_all_room_controller.dart';
import '../../Utils/colors.dart';
import '../../Utils/icons.dart';
import '../../Widgets/custom_room_card.dart';

class SeeAllRoomScreen extends StatelessWidget {
   SeeAllRoomScreen({super.key});
   final _seeAllRoomController = Get.put(SeeAllRoomController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
           Container(
      height: 87.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w,),
      decoration: BoxDecoration(
        color: AppColors.main2,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r))
      ),
      width: double.infinity,
      child:Padding(
        padding:  EdgeInsets.only(top:10.h),
        child:   CustomAppBar(titile:AppText.room,),

      ),

    ),
    Expanded(child: 
    Container(
      color: AppColors.main2,
       width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40.r))
                ),
               // padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: HeadingTile(title:AppText.yourRooms, value:"6",trailing:Container(
                height: 32.h,
                width: 32.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:AppColors.white,
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      offset:const Offset(0, 1),
                      blurRadius: 2,
                      color:AppColors.black.withOpacity(0.3)
                    ),
                     BoxShadow(
                      offset:const Offset(0, 2),
                      blurRadius: 6,
                      spreadRadius: 2,
                      color:AppColors.black.withOpacity(0.15)
                    )
                  ]
                ),
                child: Image.asset(AppIcons.addIcon,height: 16.h,width: 16.h,fit: BoxFit.fill,),
              ),),
            ),

            Expanded(child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
               const   SizedPad(10),
                  MasonryGridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _seeAllRoomController.roomList.length,
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
                              data: _seeAllRoomController.roomList[index],
                            ),
                          );
                        }),
                        
                       

                ],
              ),
            ),),
                        
          ],
        )
        ,
      ),
    ))
        


        ],
      ),
    );
  }
}



