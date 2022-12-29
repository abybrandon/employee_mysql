import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_db/main.dart';
import 'package:new_db/theme.dart';

class EditData extends StatefulWidget {
  EditData({this.list, this.index});

  final List list;
  final int index;

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerNama;
  TextEditingController controllerJabatan;
  TextEditingController controllerAlamat;
  TextEditingController controllerNotlp;
  TextEditingController controllerNamaistri;
  TextEditingController controllerNamaanak;

  void editData() {
    var url = "http://192.168.1.4/db_maula_abi/editdata_maula_abi.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "nama": controllerNama.text,
      "jabatan": controllerJabatan.text,
      "alamat": controllerAlamat.text,
      "notlp": controllerNotlp.text,
      "namaistri": controllerNamaistri.text,
      "namaanak": controllerNamaanak.text,
    });
  }

  @override
  void initState() {
    controllerNama = TextEditingController(
      text: widget.list[widget.index]['nama'],
    );
    controllerJabatan = TextEditingController(
      text: widget.list[widget.index]['jabatan'],
    );
    controllerAlamat = TextEditingController(
      text: widget.list[widget.index]['alamat'],
    );
    controllerNotlp = TextEditingController(
      text: widget.list[widget.index]['no_tlp'],
    );
    controllerNamaistri = TextEditingController(
      text: widget.list[widget.index]['nama_istri'],
    );
    controllerNamaanak = TextEditingController(
      text: widget.list[widget.index]['nama_anak'],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF454545),
        title: Text(
          "Edit Data",
          style: regularTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              TextField(
                controller: controllerNama,
                decoration:
                    InputDecoration(hintText: "Nama", labelText: "Nama"),
              ),
              TextField(
                controller: controllerJabatan,
                decoration:
                    InputDecoration(hintText: "Jabatan", labelText: "Jabatan"),
              ),
              TextField(
                controller: controllerAlamat,
                decoration:
                    InputDecoration(hintText: "Alamat", labelText: "Alamat"),
              ),
              TextField(
                controller: controllerNotlp,
                decoration:
                    InputDecoration(hintText: "No_tlp", labelText: "No_telp"),
              ),
              TextField(
                controller: controllerNamaistri,
                decoration:
                    InputDecoration(hintText: "Divisi", labelText: "Divisi"),
              ),
              TextField(
                controller: controllerNamaanak,
                decoration:
                    InputDecoration(hintText: "Level", labelText: "Level"),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Card(
                color: Color(0xFF3A6B35),
                child: FlatButton(
                  child: Text(
                    "Save Data",
                    style: regularTextStyle,
                  ),
                  onPressed: () {
                    editData();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MaulaAbi(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
