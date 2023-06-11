import 'package:get/get.dart';

import '../Utils/images.dart';

class SmartHomeController extends GetxController{

var smartList=[
  {
    "deviceName":"Smart Lamp",
    "roomName":"Dining Room",
    "day":"Tue Thu",
    "from":'8 pm',
    "to":"8 am",
    "status":"on",
    "image":AppImages.lempRoom
  },

  {
    "deviceName":"Air Conditioner",
    "roomName":"BedRoom",
    "day":"Sun",
    "from":'10 pm',
    "to":"11 am",
    "status":"off",
    "image":AppImages.acImage
  },
  {
    "deviceName":"Smart Lamp",
    "roomName":"Bedroom 2",
    "day":"Fri",
    "from":'8 pm',
    "to":"8 am",
    "status":"off",
    "image":AppImages.lempRoom
  },
  {
    "deviceName":"Television",
    "roomName":"Living Room",
    "day":"Tue Thu",
    "from":'8 pm',
    "to":"8 am",
    "status":"on",
    "image":AppImages.television
  }

];

  
}