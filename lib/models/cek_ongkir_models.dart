class CekOngkirModel {
  int? id;
  String? status_layanan;
  String? batas_awal;
  String? batas_akhir;
  double? nominal;
  String? keterangan;
  String? status;
  int? jarak;

  CekOngkirModel(this.id, this.status_layanan, this.batas_awal,
      this.batas_akhir, this.nominal, this.keterangan, this.status, this.jarak);
  CekOngkirModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status_layanan = json["status_layanan"];
    batas_awal = json["batas_awal"];
    batas_akhir = json["batas_akhir"];
    nominal = json["nominal"];
    keterangan = json["keterangan"];
    status = json['status'];
    jarak = json['jarak'];
  }
}

class Pembayaran {
  final String pg_code;
  final String pg_name;

  Pembayaran({required this.pg_code, required this.pg_name});

  factory Pembayaran.fromJson(Map<String, dynamic> json) {
    return Pembayaran(
      pg_code: json["pg_code"],
      pg_name: json["pg_name"],
    );
  }

  static List<Pembayaran> fromJsonList(List list) {
    return list.map((item) => Pembayaran.fromJson(item)).toList();
  }

  @override
  String toString() => pg_name;
}
