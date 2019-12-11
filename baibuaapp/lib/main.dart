import 'package:baibuaapp/models/user.dart';
import 'package:baibuaapp/screens/%E0%B9%8CMenu%20Button/news.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:baibuaapp/screens/Authenticate/login.dart';
import 'package:baibuaapp/screens/baibuaChatroom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/emty.dart';
import 'screens/SplashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Example Dialogflow Flutter',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new SplashScreen(),
          routes: {
            '/Login-page': (context) => LoginScreen(),
            '/emty-page': (context) => Emty_PageNavigation(), // test-page
            '/Chatroom-page': (context) => ChatroomBaibua(), // ChatRooms
            '/News-page': (context) => News(),
          }
//      new MyHomePage(title: 'Baibua Chatbot'),
          ),
    );
  }
}
