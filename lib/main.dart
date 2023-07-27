import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:book_world/Admin/Admin_Main.dart';
import 'package:book_world/Screens/Sepet.dart';
import 'package:book_world/Screens/Urunler.dart';
import 'package:book_world/Screens/girisYap.dart';
import 'package:book_world/Pages/Hakkimizda.dart';
import 'package:book_world/services/firebase_method.dart';
import 'package:book_world/Pages/İletisim.dart';
import 'package:book_world/Screens/UrunDetay.dart';
import 'package:book_world/Profile/Profil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:book_world/HomeView/HomeView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FlutterFireAuthService>(
          create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
          context.read<FlutterFireAuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HayvanDostu(),
          '/girisYap': (context) => GirisYap(),
          '/Hakkimizda': (context) => Hakkimizda(),
          '/İletisim': (context) => Iletisim(),
          '/UrunDetay': (context) => UrunDetay(),
          '/Profil': (context) => Profil(),
          '/Sepet': (context) => Sepet(),
          '/Urunler': (context) => Urun(),
          '/AdminMain': (context) => AdminMain(),
        },
      ),
    );
  }
}

class HayvanDostu extends StatefulWidget {
  @override
  State<HayvanDostu> createState() => _HayvanDostuState();
}

class _HayvanDostuState extends State<HayvanDostu> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FlutterFireAuthService>(
          create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<FlutterFireAuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: Scaffold(
        body: Home(),
      ),
    );
  }
}
