import 'package:flutter/material.dart';
import 'package:motorcycle/main.dart';
class Alert extends StatefulWidget {
  @override
  _AlertState createState() {
  return _AlertState();
}
}
class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert',
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แจ้งเตือน') ,
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
        
        child: Text('data',
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        )
      )
    );
  }
}
  