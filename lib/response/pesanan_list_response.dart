import 'package:cargo_ui/models/pesanan_store_models.dart';

class PesananListResponse {
  List<PesananListModel> listpesananModel = [];

  PesananListResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      PesananListModel pesananListModel = PesananListModel.fromJson(json[i]);
      listpesananModel.add(pesananListModel);
    }
  }
}
