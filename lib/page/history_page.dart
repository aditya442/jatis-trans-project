import 'package:app/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'detail_page.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

List list;
getData() async {
    UserRepository().getTicket(userId: 1).then((e){
      setState(() {
        list = e;
        debugPrint("CHECK : $list");
      });
    });
  }

  String userId;


  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list == null ? 0 : list.length ,
        itemBuilder: (context, i){
        return SafeArea(
          child: Container(
            child:   Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      debugPrint(list[i]['class_name']);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Eticket(list: list,index: i,)));
                    },
                    title: Row(
                      children: <Widget>[
                        Image.asset('images/logo.png',height: 100,width: 80,),
                        Padding(
                          padding: const EdgeInsets.only( top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Jatis Trans',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70),
                                  ),
                                  Text(
                                    'Rp.${list[i]['total_price']}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.airport_shuttle,
                                          color: Colors.grey),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                      ),
                                      Text('${list[i]['dari_id']}  -'
                                          ' '),

                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text('${list[i]['ke_id']}'),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.confirmation_number,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                  ),
                                  Text('${list[i]['total_seat']} Tiket')
                                ],
                              ),
//                            Row(
//                              children: <Widget>[
//                                Text(
//                                  '21 Januari 2020,',
//                                  style: TextStyle(
//                                      fontSize: 15, color: Colors.grey),
//                                ),
//                                Text('  16.00',
//                                    style: TextStyle(
//                                        color: Colors.grey,
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 15))
//                              ],
//                            ),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 85,),
                                  Text((int.parse(list[i]['check_bank']) == 1) ? 'Bembelian berhasil' : 'Belum terbayar',
                                      style: TextStyle(color: (int.parse(list[i]['check_bank']) == 1) ?Colors.green : Colors.red )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },),
    );
  }
}

