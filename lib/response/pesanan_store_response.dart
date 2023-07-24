import 'package:cargo_ui/models/pesanan_store_models.dart';

class PesananStoreResponse {
  final PesananStoreModel? pesananStoreModel;
  final String message;

  PesananStoreResponse(
      {required this.pesananStoreModel, required this.message});

  factory PesananStoreResponse.fromJson(Map<String, dynamic> json) {
    PesananStoreModel? pesananStoreModel;
    return PesananStoreResponse(
      pesananStoreModel: json['data'] != null
          ? PesananStoreModel.fromJson(json['data'])
          : pesananStoreModel,
      message: json['message'],
    );
  }
}
