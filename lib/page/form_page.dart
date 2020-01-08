import 'package:flutter/material.dart';
import 'history_page.dart';
import 'navigation_page.dart';


class Form_page extends StatefulWidget{
  final int totalPrice;
  final String textBank;
  Form_page({this.totalPrice,this.textBank});
  @override
  FormState createState()=> FormState();
}
 class FormState extends State<Form_page>{
  @override
   Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title:  Text('Form Pembayaran'),
        backgroundColor:  Colors.orange[400],
      ),
      body: SingleChildScrollView(
        child: SafeArea(

            child: Container(
              margin: EdgeInsets.only(right: 10,left: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 5,),
                  Container(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.access_time,color: Colors.orange[400],),
                        title: Text('Selesaikan pemesanan dalam',style: TextStyle(fontSize: 14),),
                       trailing: Text(' '),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 200),
                        child: Text('Silahkan Transfer Ke',style: TextStyle(fontWeight: FontWeight.w900),),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                  Container(

                    width: double.infinity,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.only(right: 210,),
                            child: Text('Virtual account',style: TextStyle(color: Colors.grey),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.only(right: 250,),
                            child: Text('${widget.textBank}',style: TextStyle(fontWeight: FontWeight.w900),),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20,left: 20,top: 10),
                              child: SizedBox(
                                height: 1,
                                child: Container(
                                  color: Colors.black38,
                                ),
                              )
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 170,top: 15),
                            child: Text('Nomor virtual account',style: TextStyle(color: Colors.grey),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.only(right: 200),
                            child: Text('1234 567 789',style: TextStyle(fontWeight: FontWeight.w900),),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 20,left: 20,top: 10),
                              child: SizedBox(
                                height: 1,
                                child: Container(
                                  color: Colors.black38,
                                ),
                              )
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 200,top: 15),
                            child: Text('Total Pembayaran',style: TextStyle(color: Colors.grey),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.only(right: 210),
                            child: Text('Rp ${widget.totalPrice}',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.blue[800]),),
                          ),
                          SizedBox(height: 15,)

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(right: 200),
                    child: Text('Cara Pembayaran',style: TextStyle(fontWeight: FontWeight.w900),),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: GestureDetector(
                      onTap: (){
                        Transfer_ATM(context);

                      },
                      child: Card(
                        child: ListTile(
                          //leading: Icon(Icons.access_time,color: Colors.orange[400],),
                          title: Text('Transfer melali ATM',style: TextStyle(fontSize: 14),),
                          trailing: Icon(Icons.keyboard_arrow_down,color: Colors.blue[800],)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: (){
                        Transfer_Banking(context);
                      },
                      child: Card(
                        child: ListTile(
                          //leading: Icon(Icons.access_time,color: Colors.orange[400],),
                            title: Text('Transfer melalui internet Banking',style: TextStyle(fontSize: 14),),
                            trailing: Icon(Icons.keyboard_arrow_down,color: Colors.blue[800],)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: (){
                        Transfer_mobile_Banking(context);
                      },
                      child: Card(
                        child: ListTile(
                          //leading: Icon(Icons.access_time,color: Colors.orange[400],),
                            title: Text('Transfer melalui mobile Banking',style: TextStyle(fontSize: 14),),
                            trailing: Icon(Icons.keyboard_arrow_down,color: Colors.blue[800],)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(

                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: RaisedButton(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Saya Sudah Membayar",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> NavPage()));
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
        ),
      ),
    );
  }
 }


void Transfer_ATM(context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext bc){
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  title: new Text('Transfer Melalui ATM',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                  leading: IconButton(icon: Icon(Icons.close,size: 35,), onPressed: () => Navigator.pop(context),),

              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 100,top: 15),
                      child: new Text('1.  Input kartu ATM dan PIN anda',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100,top: 15),
                      child: new Text('2.  Pilih Menu Transaksi Lainnya',style: TextStyle(fontSize: 15),),
                    ),

                   Padding(
                     padding: const EdgeInsets.only(right: 210,top: 15),
                     child: new Text('3.  Pilih Transfer',style: TextStyle(fontSize: 15),),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(right: 75,top: 15),
                      child: new Text('4.  Pilih ke Rekening Virtual Account',style: TextStyle(fontSize: 15),),
                    ),

                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 15),
                   child: new Text('5.  Input Nomor Virtual Account yaitu 12356595043',style: TextStyle(fontSize: 15),),
                 ),
                    Padding(
                      padding: const EdgeInsets.only(right:220,top: 15),
                      child: new Text('6.  Pilih Benar',style: TextStyle(fontSize: 15),),
                    ),

                  Padding(
                    padding: const EdgeInsets.only(right: 240,top: 15),
                    child: new Text('7.  Pilih Ya',style: TextStyle(fontSize: 15),),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(right: 130,top: 15),
                      child: new Text('8.  Ambil Bukti Bayar anda ',style: TextStyle(fontSize: 15),),
                    ),

                 Padding(
                   padding: const EdgeInsets.only(right: 240,top: 15),
                   child: new Text('9. Selesai ',style: TextStyle(fontSize: 15),),
                 ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ],
          ),
        );
      }
  );
}


void Transfer_Banking(context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext bc){
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                title: new Text('Transfer melalui internet Banking',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                leading: IconButton(icon: Icon(Icons.close,size: 35,), onPressed: () => Navigator.pop(context),),

              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 130,top: 15),
                      child: new Text('1.  Login Internet Banking',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 145,top: 15),
                      child: new Text('2.  Pilih Transaksi dana',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 60,top: 15),
                      child: new Text('3.  Pilih ke Rekening Virtual Account',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,top: 15),
                      child: new Text('4.  Input Nomor Virtual Account yaitu 12356595043',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 220,top: 15),
                      child: new Text('5.  Klik Send',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80,top: 15),
                      child: new Text('6.  Input Response KeyBca appli 1',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 220,top: 15),
                      child: new Text('7.  Klik Kirim',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60,top: 15),
                      child: new Text('8.  Bukti Pembayaran di  Tampilkan ',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 230,top: 15),
                      child: new Text('9. Selesai ',style: TextStyle(fontSize: 15),),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ],
          ),
        );
      }
  );
}

void Transfer_mobile_Banking(context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext bc){
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                title: new Text('Transfer melalui Mobile Banking',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                leading: IconButton(icon: Icon(Icons.close,size: 35,), onPressed: () => Navigator.pop(context),),

              ),
              Container(

                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 140,top: 15),
                      child: new Text('1.  Login Mobile Banking',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 173,top: 15),
                      child: new Text('2.  Pilih m -Transfer',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 1,top: 15,right: 60),
                      child: new Text('3.  Pilih ke Rekening Virtual Account',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 1,top: 15,left: 30),
                      child: new Text('4.  Input Nomor Virtual Account yaitu 12356595043',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 220,top: 15),
                      child: new Text('5.  Klik Send',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0,top: 15,left: 5),
                      child: new Text('6. Informasi Virtual Account yang ditampilkan',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 229,top: 15),
                      child: new Text('7.  Klik OK',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 105,top: 15),
                      child: new Text('8.  Input PIN mobile Banking',style: TextStyle(fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 50,top: 15),
                      child: new Text('9.   Bukti Pembayaran di  Tampilkan ',style: TextStyle(fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 229,top: 15),
                      child: new Text('10. Selesai',style: TextStyle(fontSize: 15),),
                    ),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
            ],
          ),
        );
      }
  );
}