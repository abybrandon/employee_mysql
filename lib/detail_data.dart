import 'package:flutter/material.dart';
import 'package:new_db/theme.dart';
import 'edit_data_dart_maula_abi.dart';
import 'package:http/http.dart' as http;
import 'package:new_db/main.dart';
import 'package:new_db/detail_data_dart_maula_abi.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.1.4/db_maula_abi/deletedata_maula_abi.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Are You Sure Want to delete '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        Card(
          color: Color(0xFFD72631),
          child: FlatButton(
              child: Text(
                "OK DELETE",
                style: regularTextStyle,
              ),
              onPressed: () {
                deleteData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaulaAbi(),
                  ),
                );
              }),
        ),
        Card(
          color: Color(0xFF3A6B35),
          child: FlatButton(
              child: Text("CANCEL", style: regularTextStyle),
              onPressed: () => Navigator.pop(context)),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF454545),
        title: Text("Profile ${widget.list[widget.index]['nama']}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image(
              image: NetworkImage(
                  'http://raysensenbach.com/wp-content/uploads/2013/04/default.jpg'),
            ),
          ),
          Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20.0),
                child: Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    Text(
                      "Nama Lengkap : " + widget.list[widget.index]['nama'],
                      style: regularTextStyle.copyWith(
                          color: Colors.black, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jabatan : ${widget.list[widget.index]['jabatan']}",
                            style: regularTextStyle.copyWith(
                                color: Color(0xFF3E3E3E), fontSize: 18),
                          ),
                          Text(
                            "Alamat : ${widget.list[widget.index]['alamat']}",
                            style: regularTextStyle.copyWith(
                                color: Color(0xFF3E3E3E), fontSize: 18),
                          ),
                          Text(
                            "Nomer_Telp : ${widget.list[widget.index]['no_tlp']}",
                            style: regularTextStyle.copyWith(
                                color: Color(0xFF3E3E3E), fontSize: 18),
                          ),
                          Text(
                            "Divisi : ${widget.list[widget.index]['nama_istri']}",
                            style: regularTextStyle.copyWith(
                                color: Color(0xFF3E3E3E), fontSize: 18),
                          ),
                          Text(
                            "Level :  ${widget.list[widget.index]['nama_anak']}",
                            style: regularTextStyle.copyWith(
                                color: Color(0xFF3E3E3E), fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ))),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color(0xFF3A6B35),
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => EditData(
                                  list: widget.list, index: widget.index))),
                      child: Text(
                        "Edit",
                        style: regularTextStyle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color(0xFFD72631),
                    child: FlatButton(
                      onPressed: () => confirm(),
                      child: Text(
                        "Delete",
                        style: regularTextStyle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
