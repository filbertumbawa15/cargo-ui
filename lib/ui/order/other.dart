import 'dart:convert';

import 'package:cargo_ui/bloc/cek_ongkir/cek_ongkir_bloc.dart';
import 'package:cargo_ui/ui/order/total.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class Other extends StatefulWidget {
  final String? mapfrom;
  final String? placeidfrom;
  final String? optionalfrom;
  final String? pengirimname;
  final String? pengirimnotelp;
  final String? mapto;
  final String? placeidto;
  final String? optionalto;
  final String? penerimaname;
  final String? penerimanotelp;
  final String? kategoribarang;
  final String? weightpaket;
  const Other({
    Key? key,
    this.mapfrom,
    this.placeidfrom,
    this.optionalfrom,
    this.pengirimname,
    this.pengirimnotelp,
    this.mapto,
    this.placeidto,
    this.optionalto,
    this.penerimaname,
    this.penerimanotelp,
    this.kategoribarang,
    this.weightpaket,
  }) : super(key: key);
  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  String? type_layanan;
  int? nominal;
  String? waktu;
  int? jarak;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Lainnya (Other)",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // backButOthern: true,
        // righOtherptions: false,
      ),
      body: BlocProvider(
        create: (context) => CekOngkirBloc()
          ..add(GetCekOngkirEvent(
            alamatdetailpengirim: widget.mapfrom!,
            alamatdetailpenerima: widget.mapto!,
            berat_barang: int.parse(widget.weightpaket!),
          )),
        child: ListView(
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
                    dropdownother(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Total(
                            mapfrom: widget.mapfrom,
                            optionalfrom: widget.optionalfrom,
                            placeidfrom: widget.placeidfrom,
                            pengirimname: widget.pengirimname,
                            pengirimnotelp: widget.pengirimnotelp,
                            mapto: widget.mapto,
                            optionalto: widget.optionalto,
                            placeidto: widget.placeidto,
                            penerimaname: widget.penerimaname,
                            penerimanotelp: widget.penerimanotelp,
                            kategoribarang: widget.kategoribarang,
                            berat_barang: widget.weightpaket,
                            type_layanan: type_layanan,
                            nominal: nominal,
                            waktu: waktu,
                            jarak: jarak,
                          ))));
            },
            child: const Text("Lanjut",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ))),
      ),
    );
  }

  Widget dropdownother() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 8.0, left: 17.0, right: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pilih Jasa Pengiriman",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          BlocBuilder<CekOngkirBloc, CekOngkirState>(
            builder: (context, state) {
              if (state is CekOngkirLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CekOngkirError) {
                return Center(child: Text(state.message));
              } else if (state is CekOngkirLoaded) {
                return Column(
                    children:
                        List.generate(state.listCekOngkirModel.length, (index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        border: Border.all(
                          color: Color(0xFFBABABA),
                        )),
                    child: ListTile(
                      title: Text(
                        state.listCekOngkirModel[index].status_layanan!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        state.listCekOngkirModel[index].keterangan!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF969696),
                        ),
                      ),
                      trailing: Radio(
                        value: state.listCekOngkirModel[index].status_layanan,
                        groupValue: type_layanan,
                        activeColor: const Color(0xFF41D5FB),
                        onChanged: (value) {
                          setState(() {
                            type_layanan = value.toString();
                            nominal = state.listCekOngkirModel[index].nominal!
                                .round();
                            waktu = state.listCekOngkirModel[index].keterangan;
                            jarak = state.listCekOngkirModel[index].jarak;
                            print(jarak);
                          });
                        },
                      ),
                    ),
                  );
                }));
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
