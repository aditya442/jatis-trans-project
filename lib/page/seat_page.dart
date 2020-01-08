import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';
import 'review_page.dart';

class Seat extends StatefulWidget {
  final Map list;
  Seat({this.list});
  @override
  _SeatState createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  Color _color = Colors.grey;
  Color _color1 = Colors.grey;
  Color _color2 = Colors.grey;
  Color _color3 = Colors.grey;
  Color _color4 = Colors.grey;
  Color _color5 = Colors.grey;
  int hargaDB;
  int hargaFix;
  int harga3;
  int harga2;
  int harga1;
  int harga4;
  int harga5;
  int harga6;
  int total_seat;
  double check = 2.2;
  final formatter = new NumberFormat("##,###");
  MoneyFormatterOutput fo;
  @override
  void initState() {
    hargaFix = 0;
    total_seat = 0;
    hargaDB = int.parse(widget.list['price']);
    assert(hargaDB is int);
    print(hargaDB); // 12345
    fo = FlutterMoneyFormatter(
        amount: 0,
        settings: MoneyFormatterSettings(
          symbol: 'IDR',
          thousandSeparator: '.',
        )).output;
    print(fo.nonSymbol);

    super.initState();
  }

  GlobalKey<ScaffoldState> scaffold_state = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Pilih Kursi'),
      ),
      key: scaffold_state,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 20,),

            Container(

              margin: EdgeInsets.only(right: 30,left: 30),
              child: Card(

                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(

                                child: Image.asset('images/setir.png',height: 40,width: 90,),
                              margin: EdgeInsets.only(right: 30,top: 20),
                              ),

                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(left: 80,right: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_color == Colors.grey) {
                                          _color = Colors.red;
                                          harga1 = hargaDB;
                                          total_seat  += 1;
                                        } else if (_color == Colors.red) {
                                          _color = Colors.grey;
                                          harga1 = -hargaDB;
                                          total_seat = -1;
                                        }
                                        hargaFix = hargaFix + harga1;
                                        fo = FlutterMoneyFormatter(
                                            amount: hargaFix.toDouble(),
                                            settings: MoneyFormatterSettings(
                                              symbol: 'IDR',
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                      });
                                    },
                                    child: Icon(
                                      Icons.event_seat,
                                      color: _color,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_color1 == Colors.grey) {
                                          _color1 = Colors.red;
                                          harga2 = hargaDB;
                                          total_seat = total_seat + 1;
                                        } else if (_color1 == Colors.red) {
                                          _color1 = Colors.grey;
                                          harga2 = -hargaDB;
                                          total_seat = -1;
                                        }
                                        hargaFix = hargaFix + harga2;
                                        fo = FlutterMoneyFormatter(
                                            amount: hargaFix.toDouble(),
                                            settings: MoneyFormatterSettings(
                                              symbol: 'IDR',
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                      });
                                    },
                                    child: Icon(Icons.event_seat, color: _color1,  size: 35,),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_color2 == Colors.grey) {
                                          _color2 = Colors.red;
                                          harga3 = hargaDB;
                                          total_seat = total_seat + 1;
                                        } else if (_color2 == Colors.red) {
                                          _color2 = Colors.grey;
                                          harga3 = -hargaDB;
                                          total_seat = -1;
                                        }
                                        hargaFix = hargaFix + harga3;
                                        fo = FlutterMoneyFormatter(
                                            amount: hargaFix.toDouble(),
                                            settings: MoneyFormatterSettings(
                                              symbol: 'IDR',
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                      });
                                    },
                                    child: Icon(Icons.event_seat, color: _color2, size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child:Icon(Icons.event_seat, size: 35,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_color3 == Colors.grey) {
                                          _color3 = Colors.red;
                                          harga4 = hargaDB;
                                          total_seat = total_seat + 1;
                                        } else if (_color3 == Colors.red) {
                                          _color3 = Colors.grey;
                                          harga4 = -hargaDB;
                                          total_seat = -1;
                                        }
                                        hargaFix = hargaFix + harga4;
                                        fo = FlutterMoneyFormatter(
                                            amount: hargaFix.toDouble(),
                                            settings: MoneyFormatterSettings(
                                              symbol: 'IDR',
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                      });
                                    },
                                    child: Icon(
                                      Icons.event_seat,
                                      color: _color3,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.event_seat, size: 35,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child:Icon(Icons.event_seat, size: 35,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_color4 == Colors.grey) {
                                          _color4 = Colors.red;
                                          harga5 = hargaDB;
                                          total_seat = total_seat + 1;
                                        } else if (_color4 == Colors.red) {
                                          _color4 = Colors.grey;
                                          harga5 = -hargaDB;
                                          total_seat = -1;
                                        }
                                        hargaFix = hargaFix + harga5;
                                        fo = FlutterMoneyFormatter(
                                            amount: hargaFix.toDouble(),
                                            settings: MoneyFormatterSettings(
                                              symbol: 'IDR',
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                      });
                                    },
                                    child: Icon(
                                      Icons.event_seat,
                                      color: _color4,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_color5 == Colors.grey) {
                                          _color5 = Colors.red;
                                          harga6 = hargaDB;
                                          total_seat = total_seat + 1;
                                        } else if (_color5 == Colors.red) {
                                          _color5 = Colors.grey;
                                          harga6 = -hargaDB;
                                          total_seat = -1;
                                        }
                                        hargaFix = hargaFix + harga6;
                                        fo = FlutterMoneyFormatter(
                                            amount: hargaFix.toDouble(),
                                            settings: MoneyFormatterSettings(
                                              symbol: 'IDR',
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                      });
                                    },
                                    child: Icon(
                                      Icons.event_seat,
                                      color: _color5,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  child: Icon(Icons.event_seat, size: 35,),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 36,),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Image.asset('images/orang.png',height: 60,width: 90,),
                              ),
                              Container(
                                child: Icon(Icons.event_seat, size: 35,),
                              ),
                              SizedBox(width:10,),
                              Container(
                                child: Icon(Icons.event_seat ,size: 35,),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
                SizedBox(height: 120,),

                Column(
                 crossAxisAlignment:CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                        children: <Widget>[
                          SafeArea(
                            child: Container(
                              color: Colors.orange[400],
                              child: Card(

                                child: Container(
                                  height: 50,
                                  width: 250,
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 8,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text('Seat :'),
                                            Text('Rp. ${fo.nonSymbol}'),

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Text('*  anak diatas 2 tahun wajib membeli tiket',style: TextStyle(fontSize:10 ),)
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Container(
                              height: 58,
                              width: 100,

                              child: RaisedButton(
                                  color: Colors.orange,
                                  child: Text('LANJUT',style: TextStyle(color: Colors.white,fontSize: 17),),
                                  onPressed: (){
                                    debugPrint('$total_seat');
                                    if(total_seat == 0 ){
                                      final snackBar = SnackBar(content: Text('Silahkan Memilih Kursi terlebih dahulu'));
                                      scaffold_state.currentState.showSnackBar(snackBar);
                                    }else{
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context)=> ReviewPage
                                            (route: widget.list,price: hargaFix,seat: total_seat,)
                                      )
                                      );
                                    }

                                  }),
                            ),
                          )
                        ],
                      ),

                  ],
                ),

          ],
        ),
      ),
    );
  }
}
