import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:new_db/isi.dart';
import 'package:new_db/theme.dart';
import 'detail_data_dart_maula_abi.dart';
import 'add_data_dart_maula_abi.dart';

void main() {
  runApp(MaterialApp(
    home: MaulaAbi(),
    debugShowCheckedModeBanner: false,
  ));
}

class MaulaAbi extends StatefulWidget {
  @override
  _MaulaAbiState createState() => _MaulaAbiState();
}

class _MaulaAbiState extends State<MaulaAbi> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List> getData() async {
    final response =
        await http.get("http://192.168.1.4/db_maula_abi/getdata_maula_abi.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF141414),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => AddData(),
        )),
        child: Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Color(0xFF454545),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Color(0xFFF3CA20),
              ),
            ]),
          ),
          Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(
                    "Daftar Karyawan",
                    style: regularTextStyle.copyWith(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.8,
              child: FutureBuilder<List>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ItemList(
                            list: snapshot.data,
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final List list;
  ItemList({this.list});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                        list: widget.list,
                        index: i,
                      ))),
              child: Card(
                elevation: 5,
                child: ExpansionTile(
                  leading: Icon(Icons.person_outline_sharp),
                  title: Text(
                    widget.list[i]['nama'],
                    style: TextStyle(color: Colors.black),
                  ),
                  children: [
                    ListTile(
                      title: Text("ID : " + widget.list[i]['id']),
                    ),
                    ListTile(
                      title: Text("Nama Lengkap : " + widget.list[i]['nama']),
                    ),
                    ListTile(
                      title: Text("No Telpon : " + widget.list[i]['no_tlp']),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
