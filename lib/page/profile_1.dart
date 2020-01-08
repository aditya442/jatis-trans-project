import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile1 extends StatefulWidget {
  String phone_no;
  Profile1({this.phone_no});

  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {

  TextEditingController controllernama ;
  TextEditingController controllerphone_no ;

  var userName;
  var email;
  var phoneNo;
  var userId;


  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('username');
      email = prefs.getString('email');
      phoneNo = prefs.getString('phone_no');
      userId = prefs.getString('user_id');
    });
  }

  @override
  void initState() {
    super.initState();
    getValue();
    controllernama= new TextEditingController(text: userName);
    controllerphone_no= new TextEditingController(text: phoneNo);
  }

  int selected = -1;
  void onChanged(int value) {
    setState(() {
      this.selected = value;
    });
    print('pilihan:${this.selected}');
  }

  void editData() {
    var url="http://adityo.xyz/jatis_trans/edit_profil.php";
    http.post(url,body: {
      "user_id": '${userId}',
      "user_name": controllernama.text,
      "phone_no": controllerphone_no.text

    });
  }

  void nama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    controllernama= new TextEditingController(text: userName);
    AlertDialog alertDialog = new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 100,
        width: 150,
        child: Column(
          children: <Widget>[
            new Text("Masukkan nama Anda"),
            SizedBox(height: 20,),
            TextFormField(
              controller: controllernama,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Masukkan Nama',

              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: new Text(
              "Batal",
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.orangeAccent,
            onPressed: () => Navigator.pop(context)),
        new RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: new Text("Simpan", style: new TextStyle(color: Colors.white)),
          color: Colors.orangeAccent,
          onPressed: ()  {
            editData();
            setState(() {
              getValue();
              prefs.setString('username', '${controllernama.text}');
            });
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }


  void nomor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    controllerphone_no= new TextEditingController(text: phoneNo);
    AlertDialog alertDialog = new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 100,
        width: 150,
        child: Column(
          children: <Widget>[
            new Text("Masukkan nama Anda"),
            SizedBox(height: 20,),
            TextFormField(
              controller: controllerphone_no,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Masukkan No Hp',

              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: new Text(
              "Batal",
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.orangeAccent,
            onPressed: () => Navigator.pop(context)),
        new RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: new Text("Simpan", style: new TextStyle(color: Colors.white)),
          color: Colors.orangeAccent,
          onPressed: ()  {
            setState(() {
              getValue();
              prefs.setString('phone_no', '${controllerphone_no.text}');
            });
            editData();
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: Text('Profile'),
          elevation: 0.0,
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: CircleAvatar(
                    backgroundColor: Colors.orange[100],
                    maxRadius: 80,
                    child: Icon(Icons.person, size: 100, color: Colors.white),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 10, top: 10, right: 20),
                          child: Row(
                            children: <Widget>[
                              Text('Data Diri Pribadi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 18)),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 30),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Nama',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: <Widget>[
                                      Text((userName == null) ? '' : '$userName'),
                                    ],
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                            IconButton(icon: Icon(Icons.create),
                              onPressed: (){
                                nama();
                              },
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 80),
                            child: Divider(thickness: 1)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 30),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.phone, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('No.Ponsel',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: <Widget>[
                                      Text((phoneNo== null) ? '' : '$phoneNo'),
                                    ],
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                            IconButton(icon: Icon(Icons.create),
                              onPressed: (){
                                nomor();
                              },
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 80),
                            child: Divider(thickness: 1)),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 30),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.supervisor_account,
                                    color: Colors.white),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Text('Gender',
                                      style: TextStyle(color: Colors.grey)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      groupValue: this.selected,
                                      onChanged: (int value) {
                                        onChanged(value);
                                      },
                                    ),
                                    Container(
                                      width: 5,
                                    ),
                                    Text('Pria'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Radio(
                                      value: 0,
                                      groupValue: this.selected,
                                      onChanged: (int value) {
                                        onChanged(value);
                                      },
                                    ),
                                    Container(
                                      width: 5,
                                    ),
                                    Text('Wanita')
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 80),
                            child: Divider(thickness: 1)),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 30),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.email, color: Colors.white),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Text('Email',
                                      style: TextStyle(color: Colors.grey)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: Text((email == null) ? '' : '$email'),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}