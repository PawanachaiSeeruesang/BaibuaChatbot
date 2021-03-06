import 'package:baibuaapp/Screens/menu/group/addGroup.dart';
import 'package:baibuaapp/Screens/menu/group/group.dart';
import 'package:baibuaapp/Screens/menu/map.dart';
import 'package:baibuaapp/Screens/menu/setting.dart';
import 'package:baibuaapp/Screens/menu/work/addWork.dart';
import 'package:baibuaapp/Screens/menu/work/work.dart';
import 'package:baibuaapp/Screens/menu/work/workDetail.dart';
import 'package:baibuaapp/Screens/roomCheck.dart';
import 'package:baibuaapp/Screens/classSchedule.dart';
import 'package:baibuaapp/screens/Authenticate/login.dart';
import 'package:baibuaapp/screens/Bottomnavigation.dart';
import 'package:baibuaapp/screens/emty.dart';
import 'package:baibuaapp/screens/menu/baibuaChatroom.dart';
import 'package:baibuaapp/screens/menu/mainmenu.dart';
import 'package:baibuaapp/screens/menu/news/Newevent.dart';
import 'package:baibuaapp/screens/menu/news/Neweventsetail.dart';
import 'package:baibuaapp/screens/menu/userdetail.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/Chatroom-page':
        return MaterialPageRoute(builder: (_) => ChatroomBaibua());
      case '/Mainmenu-page':
        return MaterialPageRoute(builder: (_) => Mainmenu());
      case '/Login-page':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/emty-page':
        return MaterialPageRoute(builder: (_) => Emty_PageNavigation());
      case "/Userdetail-page":
        return MaterialPageRoute(builder: (_) => UserDetailPage());
      case '/Newevent-page':
        return MaterialPageRoute(builder: (_) => NewEvent());
      case '/roomcheck':
        return MaterialPageRoute(builder: (_) => RoomCheck());

      case '/classschedule':
        return MaterialPageRoute(builder: (_) => ClassSchedule());

      case '/Neweventdetail-page':
        return MaterialPageRoute(
            builder: (_) => NewEventDetail(
                  topic: args,
                  description: args,
                  month: args,
                  id: args,
                  type: args,
                  day: args,
                  year: args,
                ));
      case '/Group-page':
        return MaterialPageRoute(builder: (_) => Group());
      case '/AddGroup-page':
        return MaterialPageRoute(builder: (_) => AddGroup());
      case '/Work':
        return MaterialPageRoute(
          builder: (_) => Work(
            groupId: args,
            nameSubject: args,
            lavelUser: args,
          ),
        );
      case '/addwork':
        return MaterialPageRoute(
            builder: (_) => AddWork(
                  groupId: args,
                ));
      case '/map':
        return MaterialPageRoute(
          builder: (_) => MapRoom(),
        );

      case '/WorkDetail':
        return MaterialPageRoute(
          builder: (_) => WorkDetail(
            workId: args,
          ),
        );
      case '/setting':
        return MaterialPageRoute(builder: (_) => SettingPage());
      case '/Bottomnavigation-page':
        return MaterialPageRoute(
          builder: (_) => BottomNavigation(
            page: args,
          ),
        );
      // case '/Googleasistant-page':
      //   return MaterialPageRoute(builder: (_) => GoogleAssistant());
//      case '/onepage':
//      // Validation of correct data type
//        if (args is String) {
//          return MaterialPageRoute(
//            builder: (_) => OnePage(
//              datas: args,
//
//            ),
//          );
//        }
//        // If args is not of the correct type, return an error page.
//        // You can also throw an exception while in development.
//        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
