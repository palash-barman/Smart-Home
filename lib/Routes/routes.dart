
import 'package:get/get.dart';
import 'package:smart_home/View/NavBar/nav_bar.dart';
import 'package:smart_home/View/RoomDetailsScreen/room_details.dart';
import 'package:smart_home/View/SeeAllRoomScreen/see_all_room.dart';
import 'package:smart_home/View/SplashScreen/splash_screen.dart';

import '../View/ActiveDeviceScreen/active_device_screen.dart';
import '../View/ItemDetailsScreen/item_details_screen.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String nevbarScreen="/nev_bar_screen";
  static String activeDevice="/active_device";
  static String seeAllRoom="/see_all_room";
  static String roomDetailsScreen="/room_details_screen";
  static String itemDetails="/item_details_screen";

}


List<GetPage> getPage = [
  GetPage(
    name: Routes.splashScreen,
    page: () => const SplashScreen(),
  ),
   GetPage(
    name: Routes.nevbarScreen,
    page: () => NavBarScreen(),
  ),
  GetPage(name:Routes.activeDevice, page:()=>ActiveDeviceScreen())
,
GetPage(name:Routes.seeAllRoom, page:()=>SeeAllRoomScreen()),
GetPage(name:Routes.roomDetailsScreen, page:()=> RoomDetailsScreen()),
GetPage(name: Routes.itemDetails, page: ()=>ItemDetailsScreen())

];
