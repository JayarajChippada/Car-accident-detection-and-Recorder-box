import 'package:flutter/material.dart';

class MyUserAccount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 28, 88, 183),
      width: 400,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
              height: 180,
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(80)
              ),
              child: InkWell(
                onTap: () => null,
                child: CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                     width: 180,
                     height:140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ),
            ),
            
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 40,
              child: Text('Name    :    Jayaraj Chippada',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 40,
              child: Text('Age      :    20                   ',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 40,
              child: Text('Licence :    AP12XXXXXXXX ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 40,
              child: Text('Car No  :    AP5672            ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 40,
              child: Text('Mobile  :     939243XXXX    ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              ),
            ),

          ],
        ),
    );
  }
}