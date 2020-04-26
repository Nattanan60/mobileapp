import 'dart:io';

import 'package:flutter/material.dart';
import 'package:motorcycle/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() {
    return _ReportState();
  }
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report',
      home: HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.k2dTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.green,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File file;
  var group;
  Widget showButtonbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            acceptButton(),
            cancelButton(),
          ],
        ),
      ],
    );
  }

  Widget acceptButton() {
    return RaisedButton(
      onPressed: () => {},
      color: Colors.blue[600],
      child: Text(
        'ส่งรายงาน',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget cancelButton() {
    return RaisedButton(
      onPressed: () => {},
      color: Colors.red,
      child: Text(
        'ยกเลิกรายงาน',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget reportRadio() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: 'รายงานจอดรถผิดข้อกำหนด',
            groupValue: group,
            onChanged: (T) {
              print(T);
              setState(() {
                group = T;
              });
            },
          ),
          Text(
            'รายงานจอดรถผิดข้อกำหนด',
            style: TextStyle(
              fontSize: 20,
              backgroundColor: Colors.pink[900],
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget report2Radio() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: 'รายงานรถมีปัญหา',
            groupValue: group,
            onChanged: (T) {
              print(T);
              setState(() {
                group = T;
              });
            },
          ),
          Text(
            'รายงานรถมีปัญหา',
            style: TextStyle(
              fontSize: 20,
              backgroundColor: Colors.pink[900],
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget cameraButton() {
    return IconButton(
      padding: EdgeInsets.only(bottom: 50),
      icon: Icon(
        Icons.add_a_photo,
        size: 60,
        color: Colors.deepOrangeAccent,
      ),
      onPressed: () {
        chooseImage(ImageSource.camera);
      },
    );
  }

  Future<void> chooseImage(ImageSource imageSource) async {
    try {
      var object = await ImagePicker.pickImage(
        source: imageSource,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = object;
      });
    } catch (e) {}
  }

  Widget galleryButton() {
    return IconButton(
      padding: EdgeInsets.only(bottom: 50),
      icon: Icon(
        Icons.add_photo_alternate,
        size: 60,
        color: Colors.deepOrangeAccent,
      ),
      onPressed: () {
        chooseImage(ImageSource.gallery);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        cameraButton(),
        galleryButton(),
      ],
    );
  }

  Widget showImage() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      // color: Colors.black,
      width: 420,
      height: 240,
      child: file == null ? Image.network(
          'https://cdn4.iconfinder.com/data/icons/evil-icons-user-interface/64/picture-512.png') : Image.file(file),
    );
  }

  Widget showContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showImage(),
        showButton(),
        reportRadio(),
        report2Radio(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('รายงาน'),
          leading: IconButton(
            icon: Icon(
              Icons.navigate_before,
            ),
            onPressed: () {
              var rount =
                  MaterialPageRoute(builder: (BuildContext contex) => Main());
              Navigator.of(context).push(rount);
            },
          ),
        ),
        body: Container(
            child: Stack(
          children: <Widget>[
            showContent(),
            showButtonbar(),
          ],
        )));
  }
}
