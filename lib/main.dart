import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pum_operator/presentation/screens/home_screen/home_screen.dart';
import 'package:pum_operator/presentation/screens/login_screen/login_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAcxHBCWobyOwUKDsqI_eZSlFDmOJ1WaaA",
          appId: "1:748212548066:web:c3d3dbe6806c00551cc9bb",
          messagingSenderId: "748212548066",
          projectId: "phoenixmecano-dev"));
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // var email = sharedPreferences.getString('adminEmail');
  runApp(MyApp(
      // email: email,
      ));
}
//
class MyApp extends StatelessWidget {
  var email;
  MyApp({this.email, super.key});

  @override
  Widget build(BuildContext context) {
    bool admin = true;
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (admin == true) {
              ///code For Web Application
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'PUM Operator',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: LoginScreenAndroid(),
              );
              //email == null ? LoginScreenWeb() : DashbordScreenview());
              // UserManagemntscreen());
              // );
            } else {
              ///Code For Native Application
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Phoenix Mechano android',
                // onGenerateRoute: RouteGenerator.getRoute,
                // initialRoute: Routes.LogIn,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: LoginScreenAndroid(), //////////////////
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Phoenix Mechano',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Phoenix Mechano',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Scaffold(
                body:
                    Center(child: Center(child: Text("Something went wrong"))),
              ),
            );
          }
        });
  }
}
