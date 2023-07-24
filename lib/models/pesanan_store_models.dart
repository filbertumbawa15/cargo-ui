class PesananStoreModel {
  int? id;
  String? nobukti;
  String? trx_id;
  String? payment_code;
  String? harga;
  String? type_cargo;
  int? payment_status;

  PesananStoreModel({
    required this.id,
    required this.nobukti,
    required this.trx_id,
    required this.payment_code,
    required this.harga,
    required this.type_cargo,
    required this.payment_status,
  });
  PesananStoreModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nobukti = json["nobukti"];
    trx_id = json["trx_id"];
    payment_code = json["payment_code"];
    harga = json["harga"];
    type_cargo = json["type_cargo"];
    payment_status = json["payment_status"];
  }
}

class PesananListModel {
  int? id;
  String? nobukti;
  String? trx_id;
  String? payment_code;
  double? jarak;
  String? waktu;
  String? namapengirim;
  String? notelppengirim;
  String? alamatdetailpengirim;
  String? placeidlokasiasal;
  String? latitude_lokasi_asal;
  String? longitude_lokasi_asal;
  String? kelurahan_lokasi_asal;
  String? note_pengirim;
  String? namapenerima;
  String? notelppenerima;
  String? alamatdetailpenerima;
  String? placeidlokasitujuan;
  String? latitude_lokasi_tujuan;
  String? longitude_lokasi_tujuan;
  String? kelurahan_lokasi_tujuan;
  String? note_penerima;
  String? harga;
  String? type_cargo;
  int? payment_status;
  String? category;
  String? keterangan;
  String? pesanan_status;
  String? payment_date;

  PesananListModel({
    this.id,
    this.nobukti,
    this.trx_id,
    this.payment_code,
    this.jarak,
    this.waktu,
    this.namapengirim,
    this.notelppengirim,
    this.alamatdetailpengirim,
    this.placeidlokasiasal,
    this.latitude_lokasi_asal,
    this.longitude_lokasi_asal,
    this.kelurahan_lokasi_asal,
    this.note_pengirim,
    this.namapenerima,
    this.notelppenerima,
    this.alamatdetailpenerima,
    this.placeidlokasitujuan,
    this.latitude_lokasi_tujuan,
    this.longitude_lokasi_tujuan,
    this.kelurahan_lokasi_tujuan,
    this.note_penerima,
    this.harga,
    this.type_cargo,
    this.payment_status,
    this.category,
    this.keterangan,
    this.pesanan_status,
    this.payment_date,
  });
  PesananListModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nobukti = json["no_bukti"];
    trx_id = json["trx_id"];
    payment_code = json["payment_code"];
    jarak = json["jarak"];
    waktu = json["waktu"];
    namapengirim = json["namapengirim"];
    notelppengirim = json["notelppengirim"];
    alamatdetailpengirim = json["alamatdetailpengirim"];
    placeidlokasiasal = json["placeidlokasiasal"];
    latitude_lokasi_asal = json["latitude_lokasi_asal"];
    longitude_lokasi_asal = json["longitude_lokasi_asal"];
    kelurahan_lokasi_asal = json["kelurahan_lokasi_asal"];
    note_pengirim = json["note_pengirim"];
    namapenerima = json["namapenerima"];
    notelppenerima = json["notelppenerima"];
    alamatdetailpenerima = json["alamatdetailpenerima"];
    placeidlokasitujuan = json["placeidlokasitujuan"];
    latitude_lokasi_tujuan = json["latitude_lokasi_tujuan"];
    longitude_lokasi_tujuan = json["longitude_lokasi_tujuan"];
    kelurahan_lokasi_tujuan = json["kelurahan_lokasi_tujuan"];
    note_penerima = json["note_penerima"];
    harga = json["harga"];
    type_cargo = json["type_cargo"];
    payment_status = json["payment_status"];
    category = json["category"];
    keterangan = json["keterangan"];
    pesanan_status = json["pesanan_status"];
    payment_date = json["payment_date"];
  }
}
