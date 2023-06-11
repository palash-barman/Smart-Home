import 'package:get/get.dart';
import 'package:smart_home/Utils/images.dart';

import '../Model/device_model.dart';

class HomeController extends GetxController{


    var roomList=[
      {
        "temprature":"19°c",
        "room_name":"Living Room",
        "image":AppImages.notoCouch,
        "devices":"5"

      },
      {
        "temprature":"12°c",
        "room_name":"Bedroom",
        "image":AppImages.bedRoom,
        "devices":"8"

      }
    ];

    var activeList=[
        DeviceModel(
          title:"Temprature",
        value:"19°c",
        roomName:"Living Room",
        deviceName:"AC",
        image:AppImages.ac,
        status:"Off",
        ),
         DeviceModel(
          title:"Colour",
        value:"White",
        roomName:"Dining room",
        deviceName:"Lamp",
        image:AppImages.lemp,
        status:"Off",
        ),
  DeviceModel(
          title:"Temprature",
        value:"19°c",
        roomName:"Living Room",
        deviceName:"AC",
        image:AppImages.ac,
        status:"Off",
        ),
         DeviceModel(
          title:"Colour",
        value:"White",
        roomName:"Dining room",
        deviceName:"Lamp",
        image:AppImages.lemp,
        status:"Off",
        ),
          DeviceModel(
          title:"Temprature",
        value:"19°c",
        roomName:"Living Room",
        deviceName:"AC",
        image:AppImages.ac,
        status:"Off",
        ),
         DeviceModel(
          title:"Colour",
        value:"White",
        roomName:"Dining room",
        deviceName:"Lamp",
        image:AppImages.lemp,
        status:"Off",
        ),
      


    ];



}