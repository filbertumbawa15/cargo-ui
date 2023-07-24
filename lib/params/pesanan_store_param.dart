import 'package:cargo_ui/core/session_manager.dart';

class PesananStoreParam {
  int payment_code;
  int jarak;
  String waktu;
  //Sender
  String namapengirim;
  String notelppengirim;
  String alamatdetailpengirim;
  String placeidlokasiasal;
  String note_pengirim;
  //Receiver
  String namapenerima;
  String notelppenerima;
  String alamatdetailpenerima;
  String placeidlokasitujuan;
  String note_penerima;
  //Other
  int harga;
  String type_cargo;
  String category;
  int user_id;

  PesananStoreParam(
    this.payment_code,
    this.jarak,
    this.waktu,
    this.namapengirim,
    this.notelppengirim,
    this.alamatdetailpengirim,
    this.placeidlokasiasal,
    this.note_pengirim,
    this.namapenerima,
    this.notelppenerima,
    this.alamatdetailpenerima,
    this.placeidlokasitujuan,
    this.note_penerima,
    this.harga,
    this.type_cargo,
    this.category,
    this.user_id,
  );

  Map<String, dynamic> toJson() {
    return {
      'payment_code': payment_code,
      'jarak': jarak,
      'waktu': waktu,
      'namapengirim': namapengirim,
      'notelppengirim': notelppengirim,
      'alamatdetailpengirim': alamatdetailpengirim,
      'placeidlokasiasal': placeidlokasiasal,
      'note_pengirim': note_pengirim,
      'namapenerima': namapenerima,
      'notelppenerima': notelppenerima,
      'alamatdetailpenerima': alamatdetailpenerima,
      'placeidlokasitujuan': placeidlokasitujuan,
      'note_penerima': note_penerima,
      'harga': harga,
      'type_cargo': type_cargo,
      'category': category,
      'keterangan': '',
      'is_check_term_conditions': 1,
      'key': 'AIzaSyDBc9RaIaig6eEiiCKpEf1qYKpEyyKgpe4',
      'user_id': user_id,
    };
  }
}
