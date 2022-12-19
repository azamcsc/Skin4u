import 'package:customers_app/providers/products_provider.dart';
import 'package:customers_app/providers/dark_theme_provider.dart';
import 'package:customers_app/screens/alarm/models/alarm_model.dart';
import 'package:customers_app/screens/appointment/state_management/state_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'consts/theme_data.dart';
import 'inner_screens/product_details.dart';
import 'screens/auth/forget_pass.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';

// To Initialize Firebase in the main.dart
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AlarmModelAdapter());
  await Hive.openBox<AlarmModel>("alarm");

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //th5//
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  //th5//
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    //th5//
    getCurrentAppTheme();

    super.initState();
  }

  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // - In main.dart file, modify the return statement in build function to
    // return a FutureBuilder instead of the Material app. FutureBuilder will
    // allow the app the perform asynchronous operations where the function will
    // return a Widget based on the result we get from that operation.
    // In our case, the operation will be the Firebase app initialization which is
    // defined in the FutureBuilder’s future property. If the app is successfully
    // initialized, it will return the Material app. If the initialization fails,
    // it will return a Text to display an error message.
    return FutureBuilder(
        future: _firebaseInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              )),
            );
          } else if (snapshot.hasError) {
            const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: Text('An error occured'),
              )),
            );
          }
          //th5//
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return themeChangeProvider;
              }),
              ChangeNotifierProvider(
                create: (_) => ProductsProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => StateMangment(),
              )
            ],
            child: Consumer<DarkThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: Styles.themeData(themeProvider.getDarkTheme, context),
                  home: const LoginScreen(),
                  routes: {
                    RegisterScreen.routeName: (ctx) => const RegisterScreen(),
                    LoginScreen.routeName: (ctx) => const LoginScreen(),
                    ForgetPasswordScreen.routeName: (ctx) =>
                        const ForgetPasswordScreen(),
                    ProductDetails.routeName: (ctx) => const ProductDetails(),
                  });
            }),
          );
        });
  }
}
