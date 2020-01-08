import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static final baseURL = "http://adityo.xyz/jatis_trans";
  static final loginURL = baseURL + "/login.php";
  static final regisURL = baseURL + "/registrasi.php";
  static final poolURL = baseURL + "/get_pool.php";
  static final searchPoolURL = baseURL + '/pencarian.php';
  static final routeURL = baseURL + '/cari_bus.php';
  static final ticketURL = baseURL + '/ticket.php';
  static final getTicketURL = baseURL + '/get_ticket.php';
  static UserRepository _instance = UserRepository.internal();
  UserRepository.internal();
  factory UserRepository() => _instance;

  Future<dynamic> login({String email, String password}) async {
    var statusError;
    Map<String, String> body = {
      "email": email,
      "password": password,
    };

    await http
        .post(
      loginURL,
      headers: {"Accept": "application/json"},
      body: body,
    )
        .then(
      (response) {
        statusError = response.body;
      },
    );
    return Response.fromJson(json.decode(statusError));
  }

  Future<dynamic> regis(
      {String userName, String phonoNo, String email, String password}) async {
    var statusError;
    Map<String, String> body = {
      "user_name": userName,
      "phone_no": phonoNo,
      "email": email,
      "password": password,
    };

    await http
        .post(
      regisURL,
      headers: {"Accept": "application/json"},
      body: body,
    )
        .then(
      (response) {
        statusError = response.body;
      },
    );
    return Response.fromJson(json.decode(statusError));
  }

  Future<List> getPool() async {
    var statusList;
    await http.get(poolURL).then((response) {
      statusList = response.body;
    });
    return json.decode(statusList);
  }

  Future<dynamic> searchPool({String filter}) async {
    String sult = filter;
    var res;
    print(sult);
    await http.get(searchPoolURL + '?pool_name=$sult').then((response) {
      res = response.body;
    });
    return json.decode(res);
  }

  Future<dynamic> searchRoute({String dariId, String keId, String date}) async {
    var res;
    await http.get(routeURL + '?dari_id=' + dariId + '&ke_id=' + keId+' & time_dari=' + date).then((response){
      res = response.body;
    });
    return json.decode(res);
  }
  Future<dynamic> addTicket(
      {int userId,int totalPrice , int totalSeat,String dateTimeNow,int setId,int workdayId,String className,String namaBank,int checkBank,}) async {
    var statusError;
    Map<String, String> body = {
      "user_id": "$userId",
      "total_price": "$totalPrice",
      "total_seat": "$totalSeat",
      "date_time_now": "$dateTimeNow",
      "set_id": "$setId",
      "workday_id": "$workdayId",
      "class_name": '$className',
      "nama_bank":namaBank,
      "check_bank": "$checkBank",

    };

    await http
        .post(
      ticketURL,
      headers: {"Accept": "application/json"},
      body: body,
    )
        .then(
          (response) {
        statusError = response.body;
        print(response.body);
      },
    );
    return Response.fromJson(json.decode(statusError));
  }

  Future<dynamic> getTicket({int userId}) async {
    int sult = userId;
    var res;
    await http.get('http://adityo.xyz/jatis_trans/get_ticket.php?user_id=$sult').then((response){
      res = response.body;
      debugPrint(response.body);
    });
    return json.decode(res);
  }
}



class Response {
  final String status;
  final String userName;
  final String userId;
  final String phoneNo;
  Response({this.status, this.userName,this.phoneNo,this.userId});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      userName: json['user_name'],
      phoneNo: json['phone_no'],
      userId: json['user_id'],
    );
  }
}

