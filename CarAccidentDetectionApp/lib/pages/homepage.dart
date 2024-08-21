import 'package:flutter/material.dart';
import 'package:maps/components/drawer.dart';
import 'package:maps/widgets/map_widget.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MyHomepage extends StatelessWidget {

  final number = '8125348959';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Accident Detection',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(number);
              },
              icon: Icon(Icons.call))
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.greenAccent.withOpacity(0.9),
                Color.fromARGB(255, 105, 240, 174),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          position: DecorationPosition.background,
          child: ListView(
            children: [
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   color: Colors.white,
                // ),
                // foregroundDecoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   //color: Colors.white,
                // ),
                // margin: EdgeInsets.fromLTRB(5, 10, 5, 2),
                // margin: EdgeInsets.all(0),
                // color: Colors.white,
                width: 50,
                height: 250,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: MyMapWidget(),
                ),
              ),
              Container(
                //margin: EdgeInsets.fromLTRB(5, 2, 5, 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                //color: Colors.blue,
                width: 50,
                height: 550,
                child: Align(
                  //alignment: Alignment.center,
                  child: GridView(
                    padding:
                        const EdgeInsets.symmetric(vertical: 90, horizontal: 5),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250, //width of child
                      childAspectRatio: 12 / 10, // width / height
                      crossAxisSpacing: 10, // space between rows and columns
                      mainAxisSpacing: 10,
                    ),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text('Child1'),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.7),
                              Colors.orange,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        height: 150,
                        padding: EdgeInsets.all(15),
                        child: Text('Child1'),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.7),
                              Colors.orange,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text('Child1'),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.7),
                              Colors.orange,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text('Child1'),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.7),
                              Colors.orange,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        hoverColor: Colors.green,
        child: Icon(Icons.navigation_outlined),
        tooltip: 'Add text',
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.deepPurpleAccent,
      //   shape: CircularNotchedRectangle(),
      //   child: Container(height: 50.0),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {

      //     },
      //     child: Icon(Icons.navigation_outlined),
      //     tooltip: 'Add text',
      //   ),

      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
