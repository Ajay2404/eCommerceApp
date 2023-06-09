

import 'dart:convert';
import 'dart:io';


import 'package:ecommerce/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  static List blankList = [];

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  ProductData? productView;
  bool checkNull = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    daTa();
  }

  Future<void> daTa() async {
    setState(() {
      checkNull = true;
    });
    String loginId = SplashScreen.prefs!.getString("id")??"";
    Map map = {
      "loginId": loginId,
    };

    var url = Uri.parse(
        'https://ajay2404.000webhostapp.com/ApiCalling/viewproduct.php');

    var response = await http.post(url, body: map);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var aa = jsonDecode(response.body);

    productView = ProductData.fromJson(aa);

    print("mmmmmmmmmmm${productView!.productdata}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: checkNull
      //     ? ListView.builder(
      //         itemCount: productView!.productdata!.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text("${productView!.productdata![index].tITLE}"),
      //           );
      //         },
      //       )
      //     : CircularProgressIndicator(),

      body: Container(child: Text("${productView?.productdata![53].tITLE}")),
    );
  }
}

class ProductData {
  int? connection;
  int? result;
  List<Productdata>? productdata;

  ProductData({this.connection, this.result, this.productdata});

  ProductData.fromJson(Map json) {
    connection = json['connection'];
    result = json['result'];
    if (json['productdata'] != null) {
      productdata = <Productdata>[];
      json['productdata'].forEach((v) {
        productdata!.add(new Productdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.productdata != null) {
      data['productdata'] = this.productdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Productdata {
  String? iD;
  String? tHUMBNAIL;
  String? tITLE;
  String? pRICE;
  String? dESCRIPTION;
  String? mULTIIMG;
  String? uSERID;

  Productdata(
      {this.iD,
      this.tHUMBNAIL,
      this.tITLE,
      this.pRICE,
      this.dESCRIPTION,
      this.mULTIIMG,
      this.uSERID});

  Productdata.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tHUMBNAIL = json['THUMBNAIL'];
    tITLE = json['TITLE'];
    pRICE = json['PRICE'];
    dESCRIPTION = json['DESCRIPTION'];
    mULTIIMG = json['MULTIIMG'];
    uSERID = json['USERID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['THUMBNAIL'] = this.tHUMBNAIL;
    data['TITLE'] = this.tITLE;
    data['PRICE'] = this.pRICE;
    data['DESCRIPTION'] = this.dESCRIPTION;
    data['MULTIIMG'] = this.mULTIIMG;
    data['USERID'] = this.uSERID;
    return data;
  }
}
