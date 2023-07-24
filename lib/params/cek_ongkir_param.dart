class CekOngkirParam {
  String alamatdetailpengirim;
  String alamatdetailpenerima;
  int? berat_barang;
  CekOngkirParam(
    this.alamatdetailpengirim,
    this.alamatdetailpenerima,
    this.berat_barang,
  );

  Map<String, dynamic> toJson() {
    return {
      'alamatdetailpengirim': alamatdetailpengirim,
      'alamatdetailpenerima': alamatdetailpenerima,
      'berat_barang': berat_barang ?? 0,
    };
  }
}
