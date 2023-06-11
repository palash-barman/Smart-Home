import 'package:get/get.dart';

import '../Model/device_model.dart';
import '../Utils/images.dart';

class RoomDetailsController extends GetxController{


  
    var deviceList=[
        DeviceModel(
          title:"Channel",
        value:"TVN",
        roomName:"Living Room",
        deviceName:"TV",
        image:AppImages.tvn,
        status:"Off",
        ),
         DeviceModel(
          title:"Colour",
        value:"White",
        roomName:"Living room",
        deviceName:"Lamp",
        image:AppImages.lemp,
        status:"Off",
        ),
  DeviceModel(
          title:"Speeds",
        value:"1.02 kb/s",
        roomName:"Living Room",
        deviceName:"WIFI",
        image:AppImages.speeds,
        status:"On",
        ),
         DeviceModel(
          title:"Temprature",
        value:"White",
        roomName:"Living room",
        deviceName:"Ac",
        image:AppImages.ac,
        status:"Off",
        ),
        
      


    ];
}