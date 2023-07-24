import 'dart:convert';
import 'dart:io';

import 'package:cargo_ui/core/api_client.dart';
import 'package:cargo_ui/params/cek_ongkir_param.dart';
import 'package:cargo_ui/params/pesanan_list_param.dart';
import 'package:cargo_ui/params/pesanan_store_param.dart';
import 'package:cargo_ui/response/cek_ongkir_response.dart';
import 'package:cargo_ui/response/pesanan_list_response.dart';
import 'package:cargo_ui/response/pesanan_store_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PesananRepository extends ApiClient {
  Future<CekOngkirResponse> cekongkir(CekOngkirParam params) async {
    try {
      final response = await dio.get('cekongkoskirim',
          queryParameters: {"data": jsonEncode(params.toJson())});
      debugPrint('Hasil Response: ${response.data}');
      return CekOngkirResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PesananStoreResponse> storePesanan(PesananStoreParam params) async {
    try {
      final response = await dio.request('pesanan',
          options: Options(
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: {"data": jsonEncode(params.toJson())});
      debugPrint('Hasil Response: ${response.data}');
      return PesananStoreResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PesananListResponse> listPesanan(PesananListParam params) async {
    try {
      final response = await dio.request('listPesanan',
          options: Options(
            method: 'GET',
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          queryParameters: {"data": jsonEncode(params.toJson())});
      debugPrint('Hasil Response: ${response.data}');
      return PesananListResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
