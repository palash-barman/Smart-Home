import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:smart_home/Controller/room_details_controller.dart';
import 'package:smart_home/Utils/text.dart';
import 'package:smart_home/Widgets/custom_button.dart';
import 'package:smart_home/Widgets/custom_padding.dart';
import 'package:smart_home/Widgets/heading_tile.dart';

import '../../Utils/colors.dart';
import '../../Utils/icons.dart';
import '../../Utils/text_style.dart';
import '../../Widgets/custom_device_card.dart';

class RoomDetailsScreen extends StatelessWidget {
  RoomDetailsScreen({super.key});
  final _roomDetailsController = Get.put(RoomDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

   _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 270.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            decoration: BoxDecoration(
                color: AppColors.main2,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40.r))),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCard(),
               const SizedPad(10),
                _usageToday(),
               // const SizedPad(13),
                  Text("KwH",style: CustomTextStyle.h8(fontWeight: FontWeight.w600,color: AppColors.surface2),),
                   _lineChart(),
                    

                 

              ],
            ),
          ),
          _device()
        ],
      ),
    );
  }

   _lineChart() {
    return SizedBox(
                      height:100.h,
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
                      maxY: 60,
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
                  ));
  }

 _usageToday() {
    return Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Usage today",style: CustomTextStyle.h6(fontWeight: FontWeight.w600,color: AppColors.surface2),),
                  
                    Column(
                       //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("25",style: CustomTextStyle.h4(fontWeight: FontWeight.w600,color: AppColors.surface2),),
                   
                        Text("wait",style: CustomTextStyle.h6(color: AppColors.surface2),)
                      ],
                    )
                  ],
                );
  }

   _buildCard() {
    return Container(
                  height: 77.h,
                  padding: 
                  EdgeInsets.symmetric(horizontal: 9.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.surface2,
                      boxShadow: [
                        BoxShadow(blurRadius: 2, color: AppColors.shadowColor)
                      ]),
                  child: Row(
                 
                    children: [
                      Image.asset(
                        AppIcons.suhu,
                        height: 30.h,
                        width: 28.33.w,
                         color: AppColors.main2,
                      ),
                      Expanded(
                          child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "19°c",
                            style: CustomTextStyle.h4(
                                fontWeight: FontWeight.w600,
                                color: AppColors.main2),maxLines: 1,overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "AC",
                            style: CustomTextStyle.h7(color: AppColors.main2),maxLines: 1,overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                    SizedBox(
                        height: 41.h,
                        child: VerticalDivider(
                          color: AppColors.buttonDisable,
                        ),
                      ),
                      Image.asset(
                        AppIcons.lemp,
                        height: 30.h,
                        width: 28.33.w,
                         color: AppColors.main2,
                      ),
                       Expanded(
                          child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "18%",
                            style: CustomTextStyle.h4(
                                fontWeight: FontWeight.w600,
                                color: AppColors.main2),maxLines: 1,overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Light Lamp",
                            style: CustomTextStyle.h7(color: AppColors.main2),maxLines: 1,overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                      SizedBox(
                        height: 41.h,
                        child: VerticalDivider(
                          color: AppColors.buttonDisable,
                        ),
                      ),
                      Image.asset(
                        AppIcons.wifi,
                        height: 30.h,
                        width: 28.33.w,
                        color: AppColors.main2,
                      ),
                     Expanded(
                          child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "10 kb/s",
                            style: CustomTextStyle.h4(
                                fontWeight: FontWeight.w600,
                                color: AppColors.main2),maxLines: 1,overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "AC",
                            style: CustomTextStyle.h7(color: AppColors.main2),maxLines: 1,overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                    ],
                  ),
                );
  }

  _device() {
    return Container(
      color: AppColors.main2,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.r))),
        child: Column(
          children: [
            const SizedPad(16),
            _headerTile(),
            const SizedPad(8),
            MasonryGridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _roomDetailsController.deviceList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CustomDeviceCard(
                    deviceModel: _roomDetailsController.deviceList[index],
                  );
                }),
            const SizedPad(6),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                onTap: () {},
                child: Text(
                  AppText.turnOffAllDevices,
                  style: CustomTextStyle.h5(
                      color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _headerTile() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: HeadingTile(
        title: AppText.device,
        value: "4",
        trailing: Container(
          height: 32.h,
          width: 32.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.main,
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
            color: AppColors.white,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: AppColors.main2,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 100.w,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(children: [
            SizedBox(
              width: 16.w,
            ),
            Icon(
              Icons.arrow_back_ios,
              size: 12.h,
              color: AppColors.white,
            ),
            Text(
              "Back",
              style: CustomTextStyle.h7(color: AppColors.white),
            ),
          ])),
      title: Text(
        "Living Room",
        style: CustomTextStyle.h3(
            fontWeight: FontWeight.w600, color: AppColors.white),
      ),
      actions: [
        Container(
          height: 40.h,
          width: 40.h,
          margin: EdgeInsets.only(right: 16.w),
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
          FlSpot(1, 9),
          FlSpot(2, 40),
          FlSpot(3, 10),
          FlSpot(4, 2),
          FlSpot(5, 1),
          FlSpot(6, 2),
          FlSpot(7, 19),
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
        text = '50';
        break;
      case 20:
        text = '100';
        break;
      case 40:
        text = '150';
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
        text = Text('1pm', style: style);
        break;
      case 2:
        text = Text('2pm', style: style);
        break;
      case 3:
        text = Text('3pm', style: style);
        break;
      case 4:
        text = Text('4pm', style: style);
        break;
      case 5:
        text = Text('5pm', style: style);
        break;
      case 6:
        text = Text('6pm', style: style);
        break;
      case 7:
        text = Text('7pm', style: style);
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
