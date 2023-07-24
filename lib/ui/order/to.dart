import 'dart:convert';

import 'package:cargo_ui/ui/order/other.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class To extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  final String? mapfrom;
  final String? optionalfrom;
  final String? placeidfrom;
  final String? pengirimname;
  final String? pengirimnotelp;
  const To({
    Key? key,
    this.mapfrom,
    this.optionalfrom,
    this.placeidfrom,
    this.pengirimname,
    this.pengirimnotelp,
  }) : super(key: key);
  @override
  State<To> createState() => _ToState();
}

class _ToState extends State<To> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _mapto = TextEditingController();
  String? _placeidto;
  TextEditingController _optional = TextEditingController();
  TextEditingController _penerimaname = TextEditingController();
  TextEditingController _penerimanotelp = TextEditingController();
  TextEditingController _kategoribarang = TextEditingController();
  TextEditingController _weightpaket = TextEditingController();

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
          "Data Tujuan (To)",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontFamily: 'Nunito-Medium',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // backButton: true,
        // rightOptions: false,
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
                  dropdowntujuan(),
                ],
              ),
            ),
          ),
        ],
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
                      builder: ((context) => Other(
                            mapfrom: widget.mapfrom!,
                            placeidfrom: widget.placeidfrom!,
                            optionalfrom: widget.optionalfrom!,
                            pengirimname: widget.pengirimname!,
                            pengirimnotelp: widget.pengirimnotelp!,
                            mapto: _mapto.text.toString(),
                            placeidto: _placeidto!,
                            optionalto: _optional.text.toString(),
                            penerimaname: _penerimaname.text.toString(),
                            penerimanotelp: _penerimanotelp.text.toString(),
                            kategoribarang: _kategoribarang.text.toString(),
                            weightpaket: _weightpaket.text.toString(),
                          ))));
            },
            child: Text("Lanjut",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ))),
      ),
    );
  }

  Widget dropdowntujuan() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 8.0, left: 17.0, right: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            readOnly: true,
            controller: _mapto,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              suffix: SizedBox(width: 20),
              filled: true,
              fillColor: Color(0xFFEDEDED),
              contentPadding: EdgeInsets.only(left: 15.0),
              prefixIcon: Icon(
                Icons.map,
                color: Color(0xFF000000),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: 'Klik untuk pilih lewat peta',
              hintStyle: TextStyle(
                fontSize: 17,
                color: Color(0xFF8D8D8D),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlacePicker(
                  resizeToAvoidBottomInset:
                      false, // only works in page mode, less flickery
                  apiKey: "AIzaSyDBc9RaIaig6eEiiCKpEf1qYKpEyyKgpe4",
                  hintText: "Find a place ...",
                  searchingText: "Please wait ...",
                  selectText: "Select place",
                  outsideOfPickAreaText: "Place not in area",
                  initialPosition: To.kInitialPosition,
                  useCurrentLocation: true,
                  selectInitialPosition: true,
                  usePinPointingSearch: true,
                  usePlaceDetailSearch: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  onPlacePicked: (PickResult result) {
                    setState(() {
                      _mapto.text = result.formattedAddress!;
                      _placeidto = result.placeId;
                      Navigator.of(context).pop();
                    });
                  },
                );
              }));
            },
          ),
          SizedBox(height: 18.0),
          TextFormField(
            controller: _optional,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEDEDED),
              contentPadding: EdgeInsets.only(left: 15.0),
              prefixIcon: Icon(
                Icons.flag,
                color: Color(0xFF000000),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: 'Patokan terdekat (opsional)',
              hintStyle: TextStyle(
                fontSize: 17,
                color: Color(0xFF8D8D8D),
              ),
            ),
          ),
          SizedBox(height: 18.0),
          Text(
            "Detail Penerima",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 22.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Penerima",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _penerimaname,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8B8B8B)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Masukkan Nama Penerima',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8D8D8D),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nomor Telepon",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _penerimanotelp,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8B8B8B)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Masukkan Nomor Telepon',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8D8D8D),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kategori Barang",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _kategoribarang,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8B8B8B)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Masukkan Kategori Barang',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8D8D8D),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ukuran Paket",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _weightpaket,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8B8B8B)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Masukkan Ukuran Paket',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8D8D8D),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
