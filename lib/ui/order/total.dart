import 'dart:convert';

import 'package:cargo_ui/bloc/cek_ongkir/cek_ongkir_bloc.dart';
import 'package:cargo_ui/bloc/pesanan_store/pesanan_store_bloc.dart';
import 'package:cargo_ui/core/session_manager.dart';
import 'package:cargo_ui/models/cek_ongkir_models.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class Total extends StatefulWidget {
  final String? mapfrom;
  final String? optionalfrom;
  final String? placeidfrom;
  final String? pengirimname;
  final String? pengirimnotelp;
  final String? mapto;
  final String? optionalto;
  final String? placeidto;
  final String? penerimaname;
  final String? penerimanotelp;
  final String? kategoribarang;
  final String? berat_barang;
  final String? type_layanan;
  final int? nominal;
  final String? waktu;
  final int? jarak;

  const Total({
    Key? key,
    this.mapfrom,
    this.optionalfrom,
    this.placeidfrom,
    this.pengirimname,
    this.pengirimnotelp,
    this.mapto,
    this.optionalto,
    this.placeidto,
    this.penerimaname,
    this.penerimanotelp,
    this.kategoribarang,
    this.berat_barang,
    this.type_layanan,
    this.nominal,
    this.waktu,
    this.jarak,
  }) : super(key: key);
  @override
  State<Total> createState() => _TotalState();
}

class _TotalState extends State<Total> {
  @override
  void initState() {
    super.initState();
  }

  final formStateModal = GlobalKey<FormState>();
  int _pembayaran = 702;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PesananStoreBloc(),
      child: Form(
        key: formStateModal,
        child: Scaffold(
          appBar: AppBar(
            elevation: 3,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFB7B7B7),
                )),
            title: Text(
              "Review Order",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            // backButTotaln: true,
            // righTotalptions: false,
          ),
          body: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 8.0, left: 17.0, right: 17.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Icon(Icons.circle,
                                    size: 25.0, color: Color(0xFF41D5FB)),
                                title: Text(widget.pengirimname.toString(),
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(widget.mapfrom.toString(),
                                    style: TextStyle(fontSize: 13.0)),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFFB7B7B7)),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Icon(Icons.circle,
                                    size: 25.0, color: Color(0xFFFB4A46)),
                                title: Text(widget.penerimaname.toString(),
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(widget.mapto.toString(),
                                    style: TextStyle(fontSize: 13.0)),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFFB7B7B7)),
                              ),
                            ),
                            SizedBox(height: 21.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Metode Pembayaran",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: SizedBox(
                                    height: 40,
                                    child: DropdownSearch<Pembayaran>(
                                      showAsSuffixIcons: true,
                                      mode: Mode.BOTTOM_SHEET,
                                      // items: _datacontainer,
                                      dropdownSearchDecoration:
                                          const InputDecoration(
                                        hintText: "Pembayaran",
                                        hintStyle: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 12, 0, 0),
                                        border: OutlineInputBorder(),
                                      ),
                                      dropdownBuilder: (context, _pembayaran) {
                                        return Text(
                                          _pembayaran == null
                                              ? "Pembayaran"
                                              : _pembayaran.toString(),
                                          style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        );
                                      },
                                      onFind: (String? filter) async {
                                        const url =
                                            'https://web.transporindo.com/faspay/payment_status.php';
                                        var response = await Dio().get(
                                          url,
                                          queryParameters: {"filter": filter},
                                        );
                                        var models = Pembayaran.fromJsonList(
                                            jsonDecode(response.data)[
                                                'payment_channel']);
                                        return models;
                                      },
                                      onChanged: (data) {
                                        _pembayaran = int.parse(data!.pg_code);
                                      },
                                      showSearchBox: true,
                                      searchFieldProps: TextFieldProps(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(12, 12, 8, 0),
                                          labelText: "Cari Pembayaran",
                                        ),
                                      ),
                                      popupTitle: Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF41D5FB),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Pembayaran',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      popupShape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        widget.type_layanan.toString(),
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        widget.waktu.toString(),
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF969696)),
                      ),
                      leading: const Icon(
                        Icons.fire_truck,
                        size: 40,
                        color: Color(0xFF000000),
                      ),
                      trailing: Text(
                        widget.nominal.toString(),
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFC1C1C1),
                      thickness: 1,
                    ),
                    BlocConsumer<PesananStoreBloc, PesananStoreState>(
                      listener: (context, state) {
                        if (state is PesananStoreSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/dashboard', (route) => false);
                        }
                      },
                      builder: (context, state) {
                        if (state is PesananStoreLoading) {
                          return const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is PesananStoreError) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(state.message!),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Color(0xFF41D5FB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  context
                                      .read<PesananStoreBloc>()
                                      .add(CreatePesananStoreEvent(
                                        payment_code: _pembayaran,
                                        jarak: widget.jarak!,
                                        waktu: widget.waktu!,
                                        //Sender
                                        namapengirim: widget.pengirimname!,
                                        notelppengirim: widget.pengirimnotelp!,
                                        alamatdetailpengirim: widget.mapfrom!,
                                        placeidlokasiasal: widget.placeidfrom!,
                                        note_pengirim: widget.optionalfrom!,
                                        //Receiver
                                        namapenerima: widget.penerimaname!,
                                        notelppenerima: widget.penerimanotelp!,
                                        alamatdetailpenerima: widget.mapto!,
                                        placeidlokasitujuan: widget.placeidto!,
                                        note_penerima: widget.optionalto!,
                                        //Other
                                        harga: widget.nominal!,
                                        type_cargo: widget.type_layanan!,
                                        category: widget.kategoribarang!,
                                        user_id:
                                            SessionManager().getActiveId()!,
                                      ));
                                },
                                child: const Text("Lanjut",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ))),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )),
          // ),
        ),
      ),
    );
  }
}
