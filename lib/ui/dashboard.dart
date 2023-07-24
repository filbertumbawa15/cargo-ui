// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:io';
import 'package:cargo_ui/bloc/pesanan_list/pesanan_list_bloc.dart';
import 'package:cargo_ui/bloc/profile_user/profile_user_bloc.dart';
import 'package:cargo_ui/core/session_manager.dart';
import 'package:cargo_ui/ui/user/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  void initState() {
    _widgetOptions();
    // print(globals.merchantid);
  }

  List<Widget> _widgetOptions() {
    return [
      Dashboard(),
      Settings(),
      Profiles(),
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        // key: _scaffoldKey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _widgetOptions().elementAt(selectedIndex),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Material(
            elevation: 10,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  tooltip: '',
                ),
                new BottomNavigationBarItem(
                  icon: new Stack(
                    children: <Widget>[
                      new Icon(Icons.list),
                    ],
                  ),
                  label: "History",
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Profile',
                  tooltip: '',
                ),
              ],
              currentIndex: selectedIndex,
              selectedLabelStyle: TextStyle(
                fontFamily: 'Nunito-Medium',
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Nunito-Medium',
                fontSize: 14.0,
              ),
              fixedColor: Color(0xFF41D5FB),
              onTap: onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  const Dashboard({Key? key}) : super(key: key);
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void initState() {
    super.initState();
  }

  int currentPos = 0;
  final List<String> imgList = [
    'https://www.transporindo.com/wp-content/uploads/2020/06/truckmin.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 17.0),
              ),
              Text(
                "Mr. ${SessionManager().getActiveFirstName()}",
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/donut-profile.png',
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          SizedBox(height: 50.0),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFBB44).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Start your Order",
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Click this button to start your order",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.5),
                  height: 65.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/from');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start your Order',
                          style: TextStyle(
                            color: Color(0xFF9D9D9D),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF9D9D9D),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          SizedBox(height: 50.0),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Parcel-Parcel",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Trx ID: 500072105632102"),
                  leading: Icon(Icons.gif_box_sharp, size: 50.0),
                ),
                new Divider(
                  color: Color(0xFF6E6E6E),
                  thickness: 1,
                ),
                ListTile(
                  title: Text(
                    "From",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB7B7B7)),
                  ),
                  subtitle: Text(
                    "Jalan Patimura Gg. Sabar No. 15A Komp. Amasari Medan",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "To",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB7B7B7)),
                  ),
                  subtitle: Text(
                    "Jalan Patimura Gg. Sabar No. 15A Komp. Amasari Medan",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Current Shipment",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text(
              "Macbook Air M2 2014",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              "Trx ID: 500063210320123",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            leading:
                Icon(Icons.gif_box_sharp, size: 50.0, color: Color(0xFF039B00)),
            tileColor: Color(0xFF039B00).withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}

class Profiles extends StatefulWidget {
  const Profiles({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: BlocProvider(
        create: (context) => ProfileBloc()..add(ProfileIndexEvent()),
        child: Container(
          child: alreadyLogin(),
        ),
      ),
    );
  }

  Widget alreadyLogin() {
    return BlocBuilder<ProfileBloc, ProfileUserState>(
      builder: (context, state) {
        if (state is ProfileUserLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileUserError) {
          return Center(
            child: Text(state.message!),
          );
        } else if (state is ProfileUserLoaded) {
          return ListView(
            // shrinkWrap: true,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              AssetImage('assets/donut-profile.png'),
                        ),
                      ],
                    ),
                    Text(
                      'Mr. ${SessionManager().getActiveFirstName()}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF313131),
                      ),
                    ),
                    Text(
                      '+62852-3353-4605',
                      style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 44),
                    ListTile(
                      title: Text("Name",
                          style: TextStyle(
                              fontSize: 17.0, color: Color(0xFFAFAFAF))),
                      subtitle: Text(
                          "Mr. ${state.profileUserResponse.profileModel!.name}",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      title: Text("Email",
                          style: TextStyle(
                              fontSize: 17.0, color: Color(0xFFAFAFAF))),
                      subtitle: Text(
                          "${state.profileUserResponse.profileModel!.email}",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      title: Text("Phone Number",
                          style: TextStyle(
                              fontSize: 17.0, color: Color(0xFFAFAFAF))),
                      subtitle: Text("(+62)852-3353-4605",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ),
                    ListTile(
                      title: Text("Birth Date",
                          style: TextStyle(
                              fontSize: 17.0, color: Color(0xFFAFAFAF))),
                      subtitle: Text("15 June 2003",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        onTap: () {
                          final sessionManager = SessionManager();
                          sessionManager.signout();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                              (route) => false);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        title: Text("Logout",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.bold)),
                        subtitle: Text("Are you sure?",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000).withOpacity(0.4))),
                        leading: Icon(
                          Icons.logout,
                          size: 40.0,
                          color: Color(0xFFBF0000),
                        ),
                        tileColor: Color(0xFF9B0000).withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: Text(
            "My Trips",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Color(0xFF41D5FB),
            labelColor: Color(0xFF41D5FB),
            labelPadding: EdgeInsets.zero,
            tabs: [
              Tab(
                child: Text(
                  "UPCOMING",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "COMPLETED",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "CANCELLED",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            listData(0),
            listData(2),
            listData(8),
          ],
        ),
      ),
    );
  }
}

Widget listData(int status) {
  return Container(
    decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
    child: BlocProvider(
      create: (context) => PesananListBloc()
        ..add(GetListEvents(
            payment_status: status, user_id: SessionManager().getActiveId()!)),
      child: BlocBuilder<PesananListBloc, PesananListState>(
        builder: (context, state) {
          if (state is PesananListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PesananListError) {
            return Center(child: Text(state.message!));
          } else if (state is PesananListLoaded) {
            return ListView.builder(
                itemCount: state.pesananListResponse.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 201, 164, 164),
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10.0),
                                  child: Text(
                                    "${state.pesananListResponse[index].nobukti}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF9D9D9D),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "${state.pesananListResponse[index].alamatdetailpengirim}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  leading: Icon(
                                    Icons.circle,
                                    color: Color(0xFF41D5FB),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "${state.pesananListResponse[index].alamatdetailpenerima}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  leading: Icon(
                                    Icons.square,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                Divider(
                                  color: Color(0xFFB9B9B9),
                                ),
                                ListTile(
                                  title: Text(
                                    "Status Order",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFB7B7B7),
                                      fontSize: 17,
                                    ),
                                  ),
                                  subtitle: Text(
                                    state.pesananListResponse[index]
                                                .pesanan_status ==
                                            ""
                                        ? "Not Created"
                                        : state.pesananListResponse[index]
                                            .pesanan_status!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF000000),
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  );
                });
          }
          return Container();
        },
      ),
    ),
  );
}
