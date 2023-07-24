part of 'cek_ongkir_bloc.dart';

@immutable
abstract class CekOngkirEvent {}

class GetCekOngkirEvent extends CekOngkirEvent {
  String alamatdetailpengirim;
  String alamatdetailpenerima;
  int? berat_barang;

  GetCekOngkirEvent({
    required this.alamatdetailpengirim,
    required this.alamatdetailpenerima,
    this.berat_barang,
  });
}
