// import 'package:ex_project/Monitor/monitor_screen.dart';
// import 'package:ex_project/auth/ui/choose_location.dart';
// import 'package:ex_project/auth/ui/login_screen.dart';
// import 'package:ex_project/auth/ui/parent_register.dart';
// import 'package:ex_project/chat/ui/call_screen.dart';
// import 'package:ex_project/chat/ui/chat_message_screen.dart';
// import 'package:ex_project/chat/ui/video_call_ui.dart';
// import 'package:ex_project/core/services/route/route_names.dart';
// import 'package:ex_project/home/ui/example_screen.dart';
// import 'package:ex_project/home/ui/most_booked_more_screen.dart';
// import 'package:ex_project/home/ui/near_more_screen.dart';
// import 'package:ex_project/map/ui/map_screen.dart';
// import 'package:ex_project/profile/ui/add_child_screen.dart';
// import 'package:ex_project/profile/ui/add_supervisor_screen.dart';
// import 'package:ex_project/profile/ui/child_list_screen.dart';
// import 'package:ex_project/profile/ui/profile_screen.dart';
// import 'package:ex_project/profile/ui/supervisor_list_screen.dart';
// import 'package:ex_project/reservation/ui/baby_sitter_profile.dart';
// import 'package:ex_project/reservation/ui/baby_sitter_rating.dart';
// import 'package:ex_project/reservation/ui/baby_sitter_reservation_details.dart';
// import 'package:ex_project/reservation/ui/order_wait_screen.dart';
// import 'package:ex_project/reservation/ui/reservation_map_screen.dart';
// import 'package:ex_project/reservation/ui/reservation_screen.dart';
// import 'package:ex_project/settings/ui/about_screen.dart';
// import 'package:ex_project/settings/ui/favorite_screen.dart';
// import 'package:ex_project/settings/ui/help_screen.dart';
// import 'package:ex_project/settings/ui/policies_screen.dart';
// import 'package:ex_project/settings/ui/recent_orders._screen.dart';
// import 'package:ex_project/settings/ui/settings_screen.dart';
// import 'package:ex_project/chat/ui/video_call_screen.dart';
// import 'package:ex_project/settings/ui/wallet_screen.dart';
// import 'package:ex_project/base_bottom/ui/bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
//
// class Router {
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     var args = settings.arguments;
//     switch (settings.name) {
//       case RouteNames.homeRoute:
//         return MaterialPageRoute(builder: (_) => MyApp());
//         break;
//       case RouteNames.mapRoute:
//         return MaterialPageRoute(builder: (_) => ExampleMap());
//         break;
//       case RouteNames.videoChatRoute:
//         return MaterialPageRoute(builder: (_) => VideoCallScreen(args: args));
//         break;
//       case RouteNames.parenRegister:
//         return MaterialPageRoute(builder: (_) => ParentRegister());
//         break;
//       case RouteNames.parenRegister:
//         return MaterialPageRoute(builder: (_) => ParentRegister());
//         break;
//       case RouteNames.chooseYourLocation:
//         return MaterialPageRoute(builder: (_) => ChooseYourLocation());
//         break;
//       case RouteNames.bottomNavigationBarWidget:
//         return MaterialPageRoute(builder: (_) => BottomNavigationBarWidget());
//         break;
//       case RouteNames.settingScreen:
//         return MaterialPageRoute(builder: (_) => SettingScreen());
//         break;
//       case RouteNames.reservationScreen:
//         return MaterialPageRoute(builder: (_) => ReservationScreen());
//         break;
//       case RouteNames.reservationMapScreen:
//         return MaterialPageRoute(builder: (_) => ReservationMapScreen(args));
//         break;
//       case RouteNames.loginScreen:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//         break;
//       case RouteNames.chatMessageScreen:
//         return MaterialPageRoute(builder: (_) => ChatMessageScreen(args));
//         break;
//       case RouteNames.callScreen:
//         return MaterialPageRoute(builder: (_) => CallScreen());
//         break;
//       case RouteNames.videoCallUIScreen:
//         return MaterialPageRoute(builder: (_) => VideoCallUI());
//         break;
//       case RouteNames.babySitterProfileScreen:
//         return MaterialPageRoute(
//             builder: (_) => BabySitterProfileScreen(
//                   model: args,
//                 ));
//         break;
//       case RouteNames.babySitterPaymentDetails:
//         return MaterialPageRoute(builder: (_) => BabySitterReservationDetails(args));
//         break;
//       case RouteNames.addChildScreen:
//         return MaterialPageRoute(
//             builder: (_) => AddChildScreen(
//                   model: args,
//                 ));
//         break;
//       case RouteNames.addSupervisorScreen:
//         return MaterialPageRoute(
//             builder: (_) => AddSupervisorScreen(
//                   model: args,
//                 ));
//         break;
//       case RouteNames.editProfileScreen:
//         return MaterialPageRoute(builder: (_) => ProfileScreen());
//         break;
//       case RouteNames.aboutScreen:
//         return MaterialPageRoute(builder: (_) => AboutScreen());
//         break;
//       case RouteNames.helpScreen:
//         return MaterialPageRoute(builder: (_) => HelpScreen());
//         break;
//       case RouteNames.recentOrdersScreen:
//         return MaterialPageRoute(builder: (_) => RecentOrdersScreen());
//         break;
//       case RouteNames.favoriteScreen:
//         return MaterialPageRoute(builder: (_) => FavoriteScreen());
//         break;
//       case RouteNames.nearMoreScreen:
//         return MaterialPageRoute(builder: (_) => NearMoreScreen());
//         break;
//       case RouteNames.mostBookedMoreScreen:
//         return MaterialPageRoute(builder: (_) => MostBookedMoreScreen());
//         break;
//       case RouteNames.walletScreen:
//         return MaterialPageRoute(builder: (_) => WalletScreen());
//         break;
//       case RouteNames.childListScreen:
//         return MaterialPageRoute(builder: (_) => ChildListScreen());
//         break;
//       case RouteNames.superVisorListScreen:
//         return MaterialPageRoute(builder: (_) => SuperVisorListScreen());
//         break;
//       case RouteNames.babySitterRating:
//         return MaterialPageRoute(builder: (_) => BabySitterRating(args));
//         break;
//       case RouteNames.policiesScreen:
//         return MaterialPageRoute(builder: (_) => PoliciesScreen());
//         break;
//       case RouteNames.orderWaitScreen:
//         return MaterialPageRoute(builder: (_) => OrderWaitScreen(args));
//         break;
//       case RouteNames.monitorScreen:
//         return MaterialPageRoute(builder: (_) => MonitorScreen(args));
//         break;
//
//       default:
//         return MaterialPageRoute(
//             builder: (_) => Scaffold(
//                   body: Center(child: Text('No route defined for ${settings.name}')),
//                 ));
//     }
//   }
// }
