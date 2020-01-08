import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eticket extends StatefulWidget {
  List list;
  int index;
  Eticket({this.list,this.index});
  @override
  _EticketState createState() => _EticketState();
}
class _EticketState extends State<Eticket> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: Text('Detail'),
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: Container(
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Pembelian Berhasil',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    Container(

                      width: double.infinity,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(

                                    child: Text('Dibeli',style: TextStyle(color: Colors.grey),),
                                  ),
                                  Container(
                                    child: Text('${widget.list[widget.index]['date_time_now']}',style: TextStyle(color: Colors.black),),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(

                                    child: Text('Metode Pembayaran',style: TextStyle(color: Colors.grey),),
                                  ),
                                  Container(
                                    child: Text('${widget.list[widget.index]['nama_bank']}',style: TextStyle(color: Colors.black),),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 15,),


                            Divider(),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(

                                    child: Text('Jatis Trans - VIP Shuttle x ${widget.list[widget.index]['total_seat']}',style: TextStyle(color: Colors.black),),
                                  ),
                                  Container(
                                    child: Text('Rp. ${int.parse(widget.list[widget.index]['total_price'])- 232}',style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Kode Unik",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    "Rp. +232",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Divider(),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(

                                    child: Text('Harga Total',style: TextStyle(color: Colors.black),),
                                  ),
                                  Container(
                                    child: Text('Rp. ${int.parse(widget.list[widget.index]['total_price'])}',style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,)

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('E-tiket',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    Card(
                      // color: Colors.orange[50],
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('Jatis Trans'),
                            subtitle: Text('${widget.list[widget.index]['class_name']}'),
                            trailing: Image.asset('images/logo.png', height: 110),
                          ),
                          Divider(),
                          SizedBox(height: 7,),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Container(width: 85,child: Text('${widget.list[widget.index]['time_dari']}', maxLines: 2,)),
                                    ],),
                                    SizedBox(height: 85,),
                                    Row(children: <Widget>[
                                      Container(width: 85,child: Text('${widget.list[widget.index]['time_ke']}')),
                                    ],),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(child: Image.asset('images/garis.png', height: 150,fit: BoxFit.cover,),width: 45),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('${widget.list[widget.index]['dari_id']}'),
                                    SizedBox(height: 90,),
                                    Text('${widget.list[widget.index]['ke_id']}'),
                                  ],
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 10,)
//                          ListTile(
//                            title: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Container(
//
//                                    child: Text('${widget.list[widget.index]['time_dari']}',maxLines: 2,),
//                                  width: 85,
//
//                                ),
//                                Row(
//                                  children: <Widget>[
//                                    Text('',
//                                        style: TextStyle(
//                                            color: Colors.grey, fontSize: 14)),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 68),
//                                    ),
//                                    Column(
//                                      crossAxisAlignment: CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text('Jakarta'),
//                                      ],
//                                    )
//                                  ],
//                                ),
//                                SizedBox(
//                                  height: 0,
//                                ),
//                                Row(
//                                  children: <Widget>[
//                                    Text('',
//                                        style: TextStyle(
//                                            color: Colors.grey, fontSize: 14)),
//                                    // Padding(
//                                    //   padding: const EdgeInsets.only(left: 1),
//                                    // ),
//                                    Row(
//                                      children: <Widget>[
//                                        Image.asset('images/garis.png',width: 150,height: 100,),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                                SizedBox(
//                                  height: 10,
//                                ),
//                                Row(
//                                  children: <Widget>[
//                                    Container(
//                                      width: 85,
//                                        child: Text('${widget.list[widget.index]['time_ke']}', maxLines: 2,)),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 100),
//                                    ),
//                                    Column(
//                                      crossAxisAlignment: CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text('Bandung'),
//                                        Text('Cicaheum',
//                                            style: TextStyle(
//                                                color: Colors.grey, fontSize: 14))
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                                SizedBox(height: 10,)
//                              ],
//                            ),
//                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}


