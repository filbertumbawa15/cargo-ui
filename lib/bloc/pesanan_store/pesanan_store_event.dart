part of 'pesanan_store_bloc.dart';

@immutable
abstract class PesananStoreEvent {}

class CreatePesananStoreEvent extends PesananStoreEvent {
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

  CreatePesananStoreEvent({
    required this.payment_code,
    required this.jarak,
    required this.waktu,
    required this.namapengirim,
    required this.notelppengirim,
    required this.alamatdetailpengirim,
    required this.placeidlokasiasal,
    required this.note_pengirim,
    required this.namapenerima,
    required this.notelppenerima,
    required this.alamatdetailpenerima,
    required this.placeidlokasitujuan,
    required this.note_penerima,
    required this.harga,
    required this.type_cargo,
    required this.category,
    required this.user_id,
  });
}
