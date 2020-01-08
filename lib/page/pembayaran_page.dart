import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'form_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PembayaranPage extends StatefulWidget{
  final Map route;
  final int total_price;
  final int total_seat;
  PembayaranPage({this.route,this.total_seat,this.total_price});
  @override
  PembayaranState createState()=> PembayaranState();
}
class PembayaranState extends State<PembayaranPage>{
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
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xffe6eaed),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange[400],
          title: Text(
            'Pilih metode pembayaran',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  color: Color(0xfff3fbfe),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.blue[800],
                    ),
                    title: Text(
                      "Anda bisa transfer dari layanan apapun\n(m-banking, SMS Banking, atau ATM)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(22),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Pilih Bank",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                //route: widget.route,total_price: widget.total_price,total_seat: widget.total_seat,userId: userId
                Item(image: "images/bca.jpg", text: "BCA",route: widget.route,total_price: widget.total_price,total_seat: widget.total_seat,userId: userId),
                SizedBox(
                  height: 7,
                ),
                Item(image: "images/mandiri.jpg", text: "MANDIRI",route: widget.route,total_price: widget.total_price,total_seat: widget.total_seat,userId: userId),
                SizedBox(
                  height: 7,
                ),
                Item(image: "images/bni.jpg", text: "BNI",route: widget.route,total_price: widget.total_price,total_seat: widget.total_seat,userId: userId),
                SizedBox(
                  height: 7,
                ),
                Item(image: "images/bri.jpg", text: "BRI",route: widget.route,total_price: widget.total_price,total_seat: widget.total_seat,userId: userId),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Syarat dan Ketentuan",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "Tiket yang dipesan dapat dibatalkan 1 hari sebeleumnya",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff8a8a8a),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "keberangkatan dengan denda Rp.20.000 per tiket",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff8a8a8a),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ],
        )
    );
  }
}


class Item extends StatefulWidget {
  final String image;
  final String text;
  final Map route;
  final int total_price;
  final int total_seat;
  final String userId;
  Item({this.image, this.text,this.route,this.total_seat,this.total_price,this.userId});
  var date = TextEditingController();
  final format = DateFormat("yyyy-MM-dd");
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  addTicket(){
    UserRepository().addTicket(
      userId: int.parse(widget.userId),
      totalPrice: widget.total_price,
      totalSeat: widget.total_seat,
      dateTimeNow: '${DateTime.now()}',
      setId: int.parse(widget.route['set_id']),
      workdayId: int.parse(widget.route['workday_id']),
      className: widget.route['class_name'],
      namaBank: '${widget.text}',
      checkBank: 0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addTicket();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Form_page(textBank:widget.text,totalPrice: widget.total_price, )));
      },
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: Container(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: Image.asset(
                widget.image,
                width: 60,
                height: 50,
              )),
          title: Text(widget.text),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blue[800],
          ),
        ),
      ),
    );
  }
}