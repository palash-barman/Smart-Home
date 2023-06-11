import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Controller/usage_controller.dart';
import 'package:smart_home/Widgets/custom_padding.dart';
import 'package:smart_home/Widgets/heading_tile.dart';

import '../../Utils/colors.dart';
import '../../Utils/icons.dart';
import '../../Utils/text.dart';
import '../../Utils/text_style.dart';

class UsageScreen extends StatelessWidget {
   UsageScreen({super.key});

  final _usageController=Get.put(UsageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body:_body()
    );
  }

   _body() {
    return SingleChildScrollView(
      child: Column(children: [
        _lineChart(),
         _totalToday(),
    
      ],
    ),);
  }

    _totalToday() {
     return Container(
         width: double.infinity,
         
         color: AppColors.main2,
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 16.w),
           
           decoration: BoxDecoration(
               color: AppColors.white,
               borderRadius:
                   BorderRadius.only(topRight: Radius.circular(40.r))),
                   child: Column(
                     children: [
                   const   SizedPad(16),
                       HeadingTile(title: AppText.totaltoday, value:"4",trailing:Text("See All",style: CustomTextStyle.h5(fontWeight: 
                       FontWeight.w600,color: AppColors.main2),),),
                   const   SizedPad(4),
                       ListView.builder(
                        itemCount: _usageController.usagePowerList.length,
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          
                          return _usageCard(_usageController.usagePowerList[index]);



                       })
                     ],
                   ),
                   
                   
                   ));
   }

   _usageCard(var data) {
    return Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                              decoration: BoxDecoration(
                                color: AppColors.surface2,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: AppColors.shadowColor
                                  )
                                ]
                              ),
                              margin: EdgeInsets.symmetric(vertical: 4.h),
                              child: Row(
                                children: [
                                
                                  Container(
                                    height: 56.h,
                                    width: 56.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(data["image"],height:46.h,width: 46.h,fit: BoxFit.fill,),
                                  ),
                                   SizedBox(width: 20.w,),
                                  Expanded(child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(child: Text(data["deviceName"],style: CustomTextStyle.h6(fontWeight: FontWeight.w600,color:AppColors.textColor),overflow: TextOverflow.ellipsis,maxLines: 1,))
                                          ,Text(data["kwh"],style:  CustomTextStyle.h6(fontWeight: FontWeight.w600,color:AppColors.main2),)
                                       
                                        ],
                                      ),
                                      Row(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(child: Text(data["roomName"],style: CustomTextStyle.h7(fontWeight: FontWeight.w400,color:AppColors.textColor),overflow: TextOverflow.ellipsis,maxLines: 1,))
                                          ,
                                          Row(
                                            children: [
                                              Image.asset(data["status"]=="up"?AppIcons.up: AppIcons.downIcon,height:14.h,width: 14.h,fit: BoxFit.fill,color: data["status"]=="up"?AppColors.main2:AppColors.main,),
                                              Text(data["persent"],style:  CustomTextStyle.h7(color:data["status"]=="up"?AppColors.main3:AppColors.main),)
                                       
                                            ],
                                          ),
                                          
                                        ],
                                      ),
                                      Text("${data["unit"]} | ${data["jam"]}",style: CustomTextStyle.h7(color:const Color(0xFF878787)),)

                                    ],
                                  ))


                                ],
                              ),
                            );
  }

 _lineChart() {
    return Container(
          height: 236.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppColors.main2,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(40.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const SizedPad(15),
                      Row(
                        children: [
                          Text(AppText.usageThisWeek,style: CustomTextStyle.h6(fontWeight: FontWeight.w600,color: AppColors.surface2),)
                     ,
                   const  Spacer(),
                       Text("25000",style: CustomTextStyle.h5(fontWeight: FontWeight.w600,color: AppColors.surface2),)
                     ,
                       Text("watt",style: CustomTextStyle.h6(fontWeight: FontWeight.w600,color: AppColors.surface2),)
                     
                     
                        ],
                      ),
                     const SizedPad(7),
                      Text("KwH",style:CustomTextStyle.h8(fontWeight: FontWeight.w600,color: AppColors.surface2),),
                    const SizedPad(4),
                      SizedBox(
                        height:158.h,
                        width: double.infinity,
                        child:  LineChart(
                      LineChartData(
                        
                        lineTouchData: LineTouchData(
                          enabled: true,
                          handleBuiltInTouches: false,
                          touchCallback: (FlTouchEvent event,
                              LineTouchResponse? response) {
                          
                          },
                          
                          getTouchedSpotIndicator: (LineChartBarData barData,
                              List<int> spotIndexes) {
                            return spotIndexes.map((index) {
                              return TouchedSpotIndicatorData(
                                FlLine(
                                  color: Colors.transparent,
                                ),
                                FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) =>
                                          FlDotCirclePainter(
                                    radius: 3,
                                    color: Colors.white,
                                    strokeWidth: 3,
                                    strokeColor: Colors.red,
                                  ),
                                ),
                              );
                            }).toList();
                          },
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.amber,
                            tooltipRoundedRadius: 20,
                            getTooltipItems:
                                (List<LineBarSpot> lineBarsSpot) {
                              return lineBarsSpot.map((lineBarSpot) {
                                return LineTooltipItem(
                                  "${lineBarSpot.x.toInt()} mins ago",
                                  const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                        lineBarsData: lineBarsData1,
                        minY: -0.5,
                        maxY: 110,
                        titlesData: FlTitlesData(
                            show: true,
                            rightTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                            bottomTitles: AxisTitles(
                              sideTitles: bottomTitles,
                            ),
                            leftTitles: AxisTitles(
                            
                              sideTitles: leftTitles,
                            )),
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: true,
                          horizontalInterval: 20,
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: AppColors.buttonDisable,
                              strokeWidth: 1,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    )),
                      

                    ],
                  ),
        );
  }
  
 _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.main2,
      leading:const SizedBox(),
      leadingWidth: 0,
      title: Text(
        AppText.powerUsage,
        style: CustomTextStyle.h2(
            fontWeight: FontWeight.w600, color: AppColors.white),
      ),
      actions: [
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            AppIcons.filter,
            height: 20.h,
            width: 20.h,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 18.w,
        )
      ],
    );
  }


 List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: AppColors.surface2,
        // gradient: LinearGradient(colors: [
        //   AppColors.surface2,
        //   AppColors.surface2
        // ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 4,
            color:AppColors.surface2,
           // strokeWidth: 0,
           // strokeColor:Colors.pink,
          ),
        ),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 35),
          FlSpot(5, 37),
          FlSpot(6, 60),
          FlSpot(7, 35),
        ],
      );

  SideTitles get leftTitles => SideTitles(
        getTitlesWidget: laftTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize:25,
      );

  Widget laftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '50';
        break;
      case 40:
        text = '100';
        break;
      case 60:
        text = '150';
        break;
      case 80:
        text = '200';
        break;
      case 100:
        text = '250';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color:AppColors.surface2,
          fontSize: 10.sp,
        ),
        
        
        );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: AppColors.surface2,
      fontSize: 10.sp,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}