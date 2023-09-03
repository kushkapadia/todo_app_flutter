import 'dart:convert';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
// import 'package:get/get.dart';
// import 'package:life_shapers_admin/utils/auth/session.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:life_shapers_admin/screens/dashboard.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  var data;
  var localData;
  var memberDoc;
  var sessionData;
  bool localSession = false;

  // check() async {
  //   sessionData = await AppSessions.SessionExists();
  //   // print("Response from node");

  //   // print(sessionData);
  //   setState(() {
  //     this.sessionData = sessionData;
  //   });
  //   if (sessionData == Null || sessionData == null) {
  //     setState(() {
  //       localSession = false;
  //     });
  //     print("localSession");
  //     print(localSession);
  //   } else {
  //     setState(() {
  //       localSession = true;
  //       memberDoc = sessionData;
  //     });
  //     print("localSession");
  //     print(localSession);
  //   }
  //   ;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // check();
  }

  // check() async {
  //   data = await AppSessions.SessionExists();
  //   print("Response from node");

  //   print(data);
  //   if (data == Null || data == null) {
  //     setState(() {
  //       localSession = false;
  //     });
  //     print("localSession");
  //     print(localSession);
  //   } else {
  //     localData = await ProfileUtil.getLocalById(data['id']);
  //     setState(() {
  //       localSession = true;
  //     });
  //     print("localSession");
  //     print(localSession);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String ip = "http://192.168.68.63:4000";

    return Drawer(
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        //  backgroundColor: Color.fromRGBO(27, 103, 166, 0.854),
        width: 230,
        child: Container(
          //decoration: BoxDecoration(color: Color(0xff121421)),
          child: ListView(
            children: [
              // if (localSession)
              DrawerHeader(
                padding: EdgeInsets.zero,
                // child: Text("hi"),
                child: UserAccountsDrawerHeader(
                  // decoration: BoxDecoration(color: Color(0xff121421)),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(220, 64, 82, 247)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?is-pending-load=1"),
                  ),
                  accountName: memberDoc != null
                      ? Text((memberDoc)['fName'].toString() +
                          " " +
                          (memberDoc)['lName'].toString())
                      : Text("Kush Kapadia"),
                  accountEmail: Text(
                    "Student",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              // else
              //   DrawerHeader(
              //     padding: EdgeInsets.zero,
              //     // child: Text("hi"),
              //     child: UserAccountsDrawerHeader(
              //       // backgroundColor: const Color(0xff607EAA),
              //       decoration: BoxDecoration(color: Color(0xff607EAA)),
              //       currentAccountPicture: CircleAvatar(
              //         backgroundImage: NetworkImage(
              //             "https://www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?is-pending-load=1"),
              //       ),
              //       accountName: GestureDetector(
              //         onTap: () {
              //           Navigator.pushNamed(context, '/login');
              //         },
              //         child: Row(
              //           children: [
              //             Text(
              //               //"Proceed To Login"
              //               AppLocalizations.of(context)!.proceedToLogin,
              //               // style: TextStyle(color: Colors.black),
              //             ),
              //             Icon(Icons.arrow_forward_ios_rounded,
              //                 color: Colors.white, size: 20)
              //           ],
              //         ),
              //       ),
              //       accountEmail: Text(""),
              //     ),
              //   ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Work",
                  // "AppLocalizations.of(context)!.dashboard,"
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MyHomePage(title: 'Flutter Demo Home Page', items:   [
    {'id': 1, 'task': "Create App", 'category': 'work', 'isDone': false},
    {'id': 2, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 3, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 4, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 5, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 6, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 7, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 8, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 9, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 10, 'task': "Check Email", 'category': 'work', 'isDone': false},
    {'id': 11, 'task': "Check Email", 'category': 'work', 'isDone': false},
    // ... (you can add more items here as required)
  ],
  category: "work"
  )),
                    ),
                  );
                },
              ),
              // ListTile(
              //     leading: Icon(
              //       Icons.list_alt_outlined,
              //       //  color: Colors.white,
              //     ),
              //     title: Text("My Reports"
              //         // AppLocalizations.of(context)!.myReports,
              //         //style: TextStyle(color: Colors.white),
              //         ),
              //     onTap: () {
              //       Navigator.pushNamed(context, '/myReports');
              //     }),

              // ListTile(
              //     leading: Icon(
              //       Icons.people_outline,
              //       //  color: Colors.white,
              //     ),
              //     title: Text("Enroll Volunteer"
              //         // AppLocalizations.of(context)!.enrollAsAvolunteer,
              //         //style: TextStyle(color: Colors.white),
              //         ),
              //     onTap: () {
              //       Navigator.pushNamed(context, '/volunteer');
              //     }),
              // ListTile(
              //     leading: Icon(
              //       Icons.person_add_outlined,
              //       //color: Colors.white,
              //     ),
              //     title: Text("Profile"
              //         // A/ppLocalizations.of(context)!.profile,
              //         // style: TextStyle(color: Colors.white),
              //         ),
              //     onTap: null),
              // ListTile(
              //     leading: Icon(
              //       Icons.settings,
              //       //  color: Colors.purple,
              //     ),
              //     title: Text("Settings"
              //         // AppLocalizations.of(context)!.settings,
              //         // style: TextStyle(color: Colors.white),
              //         ),
              //     onTap: () {
              //       Navigator.pushNamed(context, '/settings');
              //     }),
              // ListTile(
              //     leading: Icon(
              //       Icons.info,
              //       //color: Colors.white,
              //     ),
              //     title: Text("About"
              //         // AppLocalizations.of(context)!.about,
              //         //style: TextStyle(color: Colors.white),
              //         ),
              //     onTap: null),
              Padding(
                padding: EdgeInsets.zero,
                child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Personal",
                      // AppLocalizations.of(context)!.logout,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MyHomePage(title: 'Flutter Demo Home Page', items:   [
    {'id': 1, 'task': "Personal", 'category': 'personal', 'isDone': false},
    {'id': 2, 'task': "Check Email", 'category': 'personal', 'isDone': false},
    // ... (you can add more items here as required)
  ],
  category: "personal")),
                    ),
                  );
                },
                    ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Health",
                      // AppLocalizations.of(context)!.logout,
                      style: TextStyle(color: Colors.white),
                    ),
                       onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MyHomePage(title: 'Flutter Demo Home Page', items:   [
    {'id': 1, 'task': "H1", 'category': 'health', 'isDone': false},
    {'id': 2, 'task': "H2", 'category': 'health', 'isDone': false},
    // ... (you can add more items here as required)
  ],
  category: 'health')),
                    ),
                  );
                },
                    ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Shopping",
                      // AppLocalizations.of(context)!.logout,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MyHomePage(title: 'Flutter Demo Home Page', items:   [
    {'id': 1, 'task': "S1", 'category': 'shopping', 'isDone': false},
    {'id': 2, 'task': "S2", 'category': 'shopping', 'isDone': false},
    // ... (you can add more items here as required)
  ],
  category: "shopping")),
                    ),
                  );
                },
                    ),
              )
            ],
          ),
        ));
  }
}
