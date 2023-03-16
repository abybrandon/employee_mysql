import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_db/main.dart';
import 'package:new_db/theme.dart';

class AddData extends StatelessWidget {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerJabatan = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerNotlp = TextEditingController();
  TextEditingController controllerNamaistri = TextEditingController();
  TextEditingController controllerNamaanak = TextEditingController();

  void addData() {
    var url = "http://192.168.1.11/db_maula_abi/adddata_maula_abi.php";

    http.post(url, body: {
      "nama": controllerNama.text,
      "jabatan": controllerJabatan.text,
      "alamat": controllerAlamat.text,
      "notlp": controllerNotlp.text,
      "namaistri": controllerNamaistri.text,
      "namaanak": controllerNamaanak.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF454545),
          title: Text(
            "Add Data",
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
                  decoration: InputDecoration(
                      hintText: "Jabatan", labelText: "Jabatan"),
                ),
                TextField(
                  controller: controllerAlamat,
                  decoration:
                      InputDecoration(hintText: "Alamat", labelText: "Alamat"),
                ),
                TextField(
                  controller: controllerNotlp,
                  decoration:
                      InputDecoration(hintText: "Notlp", labelText: "Notlp"),
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
                  child: TextButton(
                    child: Text(
                      "Add Data",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      addData();
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
        ));
  }
}
