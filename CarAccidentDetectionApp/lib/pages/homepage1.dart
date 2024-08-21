import 'package:alarmplayer/alarmplayer.dart';
import 'package:flutter/material.dart';
import 'package:maps/components/drawer.dart';
import 'package:maps/pages/account.dart';
import 'package:maps/widgets/map_widget.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../providers/values.dart';

class MyHomepage1 extends StatefulWidget {
  static String route = 'hp';
  @override
  State<MyHomepage1> createState() => _MyHomepage1State();
}

class _MyHomepage1State extends State<MyHomepage1> {
  final number = '9392436447';
  var _page = 0;
  var _done = false;

  @override
  void didChangeDependencies() {
    if (!_done) {
      Provider.of<Values>(context, listen: false).getValues();
      _done = !_done;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var temperature = Provider.of<Values>(context).temperature;
    var gyro = false;
    gyro = Provider.of<Values>(context).gyro;
    var latitude = Provider.of<Values>(context).mylatitude;
    var lonitude = Provider.of<Values>(context).mylongitude;
    var speed = Provider.of<Values>(context).speed;
    var threshold = Provider.of<Values>(context).threshold;
    var vibration = Provider.of<Values>(context).vibration;
    var stopAlarm = Provider.of<Values>(context).stopAlarm;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 47, 115, 226),
      // Color.fromARGB(255, 35, 6, 168),
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 60,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 28, 88, 183),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(60, 10, 20, 10),
            child: InkWell(
              onTap: () => null,
              child: CircleAvatar(
                //radius: 200,
                child: ClipOval(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                    width: 45,
                    height: 38,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _page == 1
          ? MyMapWidget()
          : _page == 2
              ? MyUserAccount()
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 28, 88, 183),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              alignment: Alignment.topLeft,
                              //color: Colors.green,
                              child: Text(
                                'Hello Group3',
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,  
                                ),
                              ),
                              //height: 50,
                            ),

//    Accident detectioin Widget

                            Container(
                              margin: EdgeInsets.fromLTRB(15, 12, 7, 0),
                              alignment: Alignment.topLeft,
                              child: Center(
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: IconButton(
                                          onPressed: () => null,
                                          icon: Icon(
                                            threshold
                                                ? Icons.car_crash_rounded
                                                : Icons.directions_car,
                                            size: 90,
                                            color: threshold
                                                ? Colors.redAccent
                                                : Colors.white,
                                            shadows: [
                                              BoxShadow(blurRadius: 10)
                                            ],
                                          ),
                                          alignment: Alignment.center),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(60, 40, 20, 0),
                                      child: Text(
                                        threshold
                                            ? 'Accident Detected'
                                            : 'No Accident Detected',
                                        style: TextStyle(
                                          color: threshold
                                              ? Colors.redAccent
                                              : Colors.white,
                                          fontSize: threshold ? 30 : 25,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 81, 130, 209),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000),
                                      blurRadius: 4.2,
                                    ),
                                  ]),
                              height: 150,
                            ),

//     Middle widget alarm and call

                            Container(
                              margin: EdgeInsets.fromLTRB(15, 25, 8, 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 81, 130, 209),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000),
                                      blurRadius: 3.2,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(30, 5, 0, 0),
                                    child: Text(
                                      'Mercedes Benz',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(50, 5, 10, 5),
                                    child: IconButton(
                                      onPressed: () {
                                        stopAlarm();
                                      },
                                      icon: Icon(
                                        Icons.alarm,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () async {
                                        await FlutterPhoneDirectCaller
                                            .callNumber(number);
                                      },
                                      icon: Icon(Icons.call_rounded,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              height: 70,
                            ),
                          ],
                        ),
                        height: 320,
                      ),

//       Bottom Grid View

                      Container(
                        margin: EdgeInsets.fromLTRB(17, 15, 15, 0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 28, 88, 183),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 260,
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 13 / 10,
                            crossAxisSpacing:
                                10, // space between rows and columns
                            mainAxisSpacing: 15,
                          ),
                          children: [
                            Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 81, 130, 209),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000),
                                      blurRadius: 0.2,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 7, 20, 0),
                                    child: Text(
                                      'Speed',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Text(
                                      '(km/hr)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    child: Text(
                                      speed.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 81, 130, 209),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000),
                                      blurRadius: 0.2,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 7, 20, 0),
                                    child: Text(
                                      'Temperature',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Text(
                                      '(°C)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    child: Text(
                                      temperature.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 81, 130, 209),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000),
                                      blurRadius: 0.2,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 7, 20, 0),
                                    child: Text(
                                      'Gyro',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Text(
                                      'Value',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    child: Text(
                                      gyro ? "90" : "0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 81, 130, 209),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000),
                                      blurRadius: 0.2,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 7, 20, 0),
                                    child: Text(
                                      'Vibration',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Text(
                                      'Hz',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                    child: Text(
                                      vibration.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

//     Bottom Navigation Bar

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.navigation_rounded,
              color: Colors.white,
            ),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            label: 'Account',
          ),
        ],
        backgroundColor: Color.fromARGB(255, 28, 88, 183),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 11, 105, 167),
        elevation: 0.0,
        currentIndex: _page,
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
        //fixedColor: Colors.white,
      ),
    );
  }
}
