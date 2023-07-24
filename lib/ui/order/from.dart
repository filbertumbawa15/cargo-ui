import 'package:cargo_ui/ui/order/to.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class From extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  const From({
    Key? key,
  }) : super(key: key);
  @override
  State<From> createState() => _FromState();
}

class _FromState extends State<From> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _mapfrom = TextEditingController();
  String? _placeidFrom;
  TextEditingController _optional = TextEditingController();
  TextEditingController _pengirimname = TextEditingController();
  TextEditingController _pengirimnotelp = TextEditingController();

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
          "Data Asal (From)",
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
                  dropdownasal(),
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
                      builder: ((context) => To(
                            mapfrom: _mapfrom.text.toString(),
                            optionalfrom: _optional.text.toString(),
                            placeidfrom: _placeidFrom!,
                            pengirimname: _pengirimname.text.toString(),
                            pengirimnotelp: _pengirimnotelp.text.toString(),
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

  Widget dropdownasal() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 8.0, left: 17.0, right: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            readOnly: true,
            controller: _mapfrom,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEDEDED),
              contentPadding: EdgeInsets.only(left: 15.0),
              prefixIcon: Icon(
                Icons.map,
                color: Color(0xFF000000),
              ),
              suffix: SizedBox(width: 20),
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
                  initialPosition: From.kInitialPosition,
                  useCurrentLocation: true,
                  selectInitialPosition: true,
                  usePinPointingSearch: true,
                  usePlaceDetailSearch: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  onPlacePicked: (PickResult result) {
                    setState(() {
                      _mapfrom.text = result.formattedAddress!;
                      _placeidFrom = result.placeId;
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
              suffix: SizedBox(width: 20),
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
            "Detail Pengirim",
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
                "Nama Pengirim",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _pengirimname,
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
                  hintText: 'Masukkan Nama Pengirim',
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
                controller: _pengirimnotelp,
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
        ],
      ),
    );
  }
}
