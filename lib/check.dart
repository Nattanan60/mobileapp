import 'package:flutter/material.dart';
import 'package:motorcycle/main.dart';
class Check extends StatefulWidget {
  @override
  _CheckState createState() {
  return _CheckState();
}
}
class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check',
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เช็คที่จอดรถ') ,
        leading: IconButton(
        icon:Icon(Icons.navigate_before,
        ),
         
       
        onPressed:(){
          var rount = MaterialPageRoute(builder: (BuildContext contex) =>Main()
                  );
                  Navigator.of(context).push(rount);
        },
        ), 
        
      ),
      body: Center(
        
        child: Text('เช็คที่จอดรถ',
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        )
      )
    );
  }
}
  