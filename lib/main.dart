import 'package:cargo_ui/core/bloc/app_setting_bloc.dart';
import 'package:cargo_ui/ui/dashboard.dart';
import 'package:cargo_ui/ui/onboarding.dart';
import 'package:cargo_ui/ui/order/from.dart';
import 'package:cargo_ui/ui/order/other.dart';
import 'package:cargo_ui/ui/order/to.dart';
import 'package:cargo_ui/ui/order/total.dart';
import 'package:cargo_ui/ui/user/login.dart';
import 'package:cargo_ui/ui/user/register.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('session');
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingBloc()..add(SettingAppEvent()),
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (context, state) {
          Widget _home = Login();
          if (state is AppSettingAuthenticated) {
            _home = Home();
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: _home,
            routes: <String, WidgetBuilder>{
              '/onboarding': (context) => Onboarding(),
              '/login': (context) => Login(),
              '/register': (context) => Register(),
              '/dashboard': (context) => Home(),
              '/from': (context) => From(),
              '/to': (context) => To(),
              '/other': (context) => Other(),
              '/total': (context) => Total(),
            },
          );
        },
      ),
    );
  }
}
