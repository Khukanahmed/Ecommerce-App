import 'package:craftybay/data/model/product_data.dart';

class ProductModel {
  String? msg;
  List<productData>? data;

  ProductModel({this.msg, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <productData>[];
      json['data'].forEach((v) {
        data!.add(new productData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
