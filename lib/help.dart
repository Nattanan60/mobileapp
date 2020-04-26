import 'package:flutter/material.dart';
import 'package:motorcycle/main.dart';
class Help extends StatefulWidget {
  @override
  _HelpState createState() {
  return _HelpState();
}
}
class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help',
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ขอความช่วยเหลือ') ,
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
        
        child: Text('ขอความช่วยเหลือ',
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        )
      )
    );
  }
}
  