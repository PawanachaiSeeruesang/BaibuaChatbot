import 'package:baibuaapp/REST%20API/userservice.dart';
import 'package:baibuaapp/Widgets/customAppBar.dart';
import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:baibuaapp/models/userdata.dart';
import 'package:baibuaapp/screens/Authenticate/autu.dart';
import 'package:baibuaapp/screens/Authenticate/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatefulWidget {
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  //Variable
  final bool isWork = true;
  final bool isWorkDeadline = false;
  String iD = '';


  //TextStyle
  TextStyle _detailFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    textStyle: TextStyle(color: Color.fromRGBO(81, 92, 111, 1)),
  );

  TextStyle _btnFontKanit = GoogleFonts.kanit(
    fontSize: 16.0,
    textStyle: TextStyle(color: Colors.white),
  );


  //Color All
  Color iconColor = Color.fromRGBO(173, 197, 219, 1);
  Color borderRole = Color.fromRGBO(0, 147, 233, 1);
  Color bgMenuColor = Color.fromRGBO(237, 242, 247, 1);
  Color shadowMenuColor = Color.fromRGBO(11, 84, 194, 0.5);
  Color nameColor = Color.fromRGBO(81, 93, 111, 1);
  Color btnSendAdminColor = Color.fromRGBO(166, 188, 208, 1);
  Color btnLogOutColor = Color.fromRGBO(255, 105, 105, 1);

  final AuthService _authService = AuthService();

  Future<void> findDisplay() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String userId = firebaseUser.displayName;
    setState(() {
      iD = userId;
    });
    print("Displayname In Main Menu Page => " + userId);
  }

  @override
  void initState() {
    super.initState();
    findDisplay();
  }

  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => WorkCount(),
      child: Scaffold(
        backgroundColor: bgMenuColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(59),
          child: Column(
            children: <Widget>[CustomAppBarr("ข้อมูลผู้ใช้")],
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            RefreshIndicator(
              onRefresh: findDisplay,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: FutureBuilder(
                    future: UserDataService.callData(userID: iD),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Userdata userdata = snapshot.data;
                        print("Tset => " + userdata.id);
                        bool isRole;
                        if (userdata.level == 1) {
                          isRole = true;
                        } else {
                          isRole = false;
                        }

                        return Column(
                          children: <Widget>[
                            //************************ Title ***************************//
                            Container(
                              width: _widthScreen,
                              height: 130,
                              decoration: BoxDecoration(
//                    color: Colors.black,
                                  ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      radius: 50.00,
                                      child: Icon(
                                        Icons.person,
                                        size: 60,
                                      ),
                                      // backgroundColor: Colors.black,
                                      // backgroundImage: NetworkImage(
                                      //     'https://images.unsplash.com/flagged/photo-1574164908900-6275ca361157?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        FutureBuilder(
                                          future: UserDataService.callData(
                                              userID: iD),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              Userdata userdata = snapshot.data;
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    userdata.nameEn,
                                                    style: GoogleFonts.kanit(
                                                      textStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            81, 93, 111, 1),
                                                        fontSize: 18.00,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    userdata.email,
                                                    style: GoogleFonts.kanit(
                                                      textStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            81, 93, 111, 1),
                                                        fontSize: 16.00,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  (isRole)
                                                      ? Container(
                                                          width: 86,
                                                          height: 30,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            border: Border.all(
                                                                color:
                                                                    borderRole),
                                                          ),
                                                          child: Text(
                                                            "หัวหน้าห้อง",
                                                            style: GoogleFonts
                                                                .kanit(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        147,
                                                                        233,
                                                                        1),
                                                                fontSize: 12.00,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ))
                                                      : Container(),
                                                ],
                                              );
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.00,
                            ),
                            //************************ Detile *************************//
                            Container(
                              padding: EdgeInsets.all(18.00),
                              width: _widthScreen,
                              height: isRole ? 250.00 : 195,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.contacts,
                                          size: 28.00,
                                          color: borderRole,
                                        ),
                                        SizedBox(width: 16.00),
                                        Text(userdata.nameEn,
                                            style: _detailFontKanit),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.00,
                                  ),
                                  Divider(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.payment,
                                          size: 28.00,
                                          color: borderRole,
                                        ),
                                        SizedBox(width: 16.00),
                                        Text(userdata.id,
                                            style: _detailFontKanit),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.00,
                                  ),
                                  Divider(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 5.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.mail_outline,
                                          size: 28.00,
                                          color: borderRole,
                                        ),
                                        SizedBox(width: 16.00),
                                        Text(
                                          userdata.email,
                                          style: _detailFontKanit,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.00,
                                  ),
                                  isRole ? role() : Container(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.00,
                            ),
                            //************************ Sub Detail **********************//
                            Container(
                              padding: EdgeInsets.all(18.00),
                              width: _widthScreen,
                              height: 250.00,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.school,
                                          size: 28.00,
                                          color: borderRole,
                                        ),
                                        SizedBox(width: 16.00),
                                        Text(userdata.major,
                                            style: _detailFontKanit),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.00,
                                  ),
                                  Divider(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.class_,
                                          size: 28.00,
                                          color: borderRole,
                                        ),
                                        SizedBox(width: 16.00),
                                        Text(userdata.faculty,
                                            style: _detailFontKanit),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.00,
                                  ),
                                  Divider(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 5.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.create,
                                          size: 28.00,
                                          color: borderRole,
                                        ),
                                        SizedBox(width: 16.00),
                                        Text(
                                          userdata.status,
                                          style: _detailFontKanit,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.00,
                                  ),
                                  Divider(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 5.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.turned_in_not,
                                          size: 28.00,
                                          color: borderRole,
                                        ),
                                        SizedBox(width: 16.00),
                                        Text(
                                          userdata.degree,
                                          style: _detailFontKanit,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.00,
                            ),
                            //************************  Send Admin Button **********************//
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: 60,
//                            width: _widthScreen,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  "ติดต่อผู้แดแลระบบเพื่อแก้ไขข้อมูล",
                                  style: _btnFontKanit,
                                )),
                              ),
                              onPressed: () {},
                              elevation: 0.00,
                              color: btnSendAdminColor,
                            ),
                            SizedBox(
                              height: 16.00,
                            ),
                            //************************  LogOut Button **********************//
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: 60,
//                            width: _widthScreen,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  "ออกจากระบบ",
                                  style: _btnFontKanit,
                                )),
                              ),
                              elevation: 0.00,
                              color: btnLogOutColor,
                              onPressed: () async {
                                await _authService.signOut();
                                print(_authService.toString());
//                            Navigator.pushNamed(context, '/Login-page');
                                MaterialPageRoute materialPageRoute =
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginScreen());
                                Navigator.of(context).pushAndRemoveUntil(
                                    materialPageRoute,
                                    (Route<dynamic> route) => false);
                              },
                            ),
                            SizedBox(
                              height: 100.00,
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Widget Role
  Widget role() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.assignment_ind,
            size: 28.00,
            color: borderRole,
          ),
          SizedBox(width: 16.00),
          Text(
            "หัวหน้าห้อง",
            style: _detailFontKanit,
          ),
        ],
      ),
    );
  }
}
