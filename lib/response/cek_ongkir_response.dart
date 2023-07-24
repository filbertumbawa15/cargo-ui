import 'package:cargo_ui/models/cek_ongkir_models.dart';

class CekOngkirResponse {
  List<CekOngkirModel> listCekOngkir = [];

  CekOngkirResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      CekOngkirModel cekOngkirModel = CekOngkirModel.fromJson(json[i]);
      listCekOngkir.add(cekOngkirModel);
    }
  }
}
