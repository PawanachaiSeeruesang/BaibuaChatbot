import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:baibuaapp/screens/Authenticate/login.dart';
import 'package:baibuaapp/screens/Menu/map.dart';
import 'package:baibuaapp/screens/Menu/news.dart';
import 'package:baibuaapp/screens/Menu/setting.dart';
import 'package:baibuaapp/screens/Menu/addwork.dart';
import 'package:baibuaapp/screens/Menu/viewwork.dart';
import 'package:baibuaapp/screens/baibuaChatroom.dart';
import 'package:baibuaapp/screens/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_error_page/flutter_custom_error_message.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/emty.dart';
import 'screens/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ErrorWidget.builder = ErrorMessageBuilder.build(theme: ErrorTheme.BlueScreen);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Example Dialogflow Flutter',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          //******************************************************************//
          // Set font Default
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          primaryTextTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context)
                .primaryTextTheme, // ถ้าไม่ใส่ มันจะตั้งค่า Default ทุกอย่างตาม ThemeData.light().textTheme
          ),
          //******************************************************************//
        ),
        home: new SplashScreen(),

        //***********************************************//
        // Debug Push Notification
//      home: MainPage(),
        //***********************************************//
        routes: {
          '/Login-page': (context) => LoginScreen(),
          '/emty-page': (context) => Emty_PageNavigation(), // test-page
          '/Chatroom-page': (context) => ChatroomBaibua(), // ChatRooms
          '/News-page': (context) => News(), //News
          '/Setting-page': (context) => Setting_Page(), //Setting
          '/AddWork-page': (context) => AddworkPage(), //Addwork Page
          '/ViewWork-page': (context) => ViewWork(), //Addwork Page
          '/Map-page': (context) => MyMapPageState(), //Addwork Page
          '/Mainmenu-page': (context) => Mainmenu(), //Addwork Page
        },
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'), // English
          const Locale('es'), // Spanish
          const Locale('fr'), // French
          const Locale('zh'), // Chinese
          const Locale('th'), // thailand
        ],
      ),
    );
  }
}

