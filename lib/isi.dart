import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_db/main.dart';

class Isi extends StatefulWidget {
  List list;
  int index;
  Isi({this.index, this.list});
  @override
  _IsiState createState() => _IsiState();
}

class _IsiState extends State<Isi> {
  void deleteData() {
    var url = "http://192.168.1.11/db_maula_abi/deletedata_maula_abi.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Bismillah"),
        ),
        body: Text(
          widget.list[widget.index]['nama'],
          style: TextStyle(fontSize: 20.0),
        ));
  }
}
