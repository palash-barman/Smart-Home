import 'package:get/get.dart';
import 'package:smart_home/Utils/images.dart';

class UsageController extends GetxController{

  var usagePowerList=[
    {
      "deviceName":"Lamp",
      "roomName":"Kitchen-Bedroom",
      "kwh":"1000 kw/h",
      "unit":"8 Unit",
      "jam":"12 Jam",
      "image":AppImages.lempRoom,
      "status":"down",
      "persent":"-11.2%"
    },
    {
      "deviceName":"Air Cinditioner",
      "roomName":"Kitchen-Living Room",
      "kwh":"1000 kw/h",
      "unit":"8 Unit",
      "jam":"12 Jam",
      "image":AppImages.acImage,
      "status":"up",
      "persent":"-10.2%"
    },
    {
      "deviceName":"Wireless Speaker",
      "roomName":"Bedroom",
      "kwh":"1090 kw/h",
      "unit":"2 Unit",
      "jam":"3 Jam",
      "image":AppImages.wirelessSpeaker,
      "status":"up",
      "persent":"-10.2%"
    },
    {
      "deviceName":"Television",
      "roomName":"Living Room",
      "kwh":"1000 kw/h",
      "unit":"1 Unit",
      "jam":"12 Jam",
      "image":AppImages.television,
      "status":"down",
      "persent":"-100.2%"
    }

  ];


}