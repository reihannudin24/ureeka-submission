import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:submission/responsive_app_wrapper.dart';
import 'package:submission/routes/app_router.dart';


/// Hapus animasi transisi antar‐halaman.
class NoTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBhgOclj4RN-OC9PEtOv9pKVr8xq9TvcG4",
        authDomain: "ureeka-reihan.firebaseapp.com",
        projectId: "ureeka-reihan",
        storageBucket: "ureeka-reihan.firebasestorage.app",
        messagingSenderId: "67911557505",
        appId: "1:67911557505:web:455db238e087d9d8260880",
        measurementId: "G-R6E2T5LSKV",
      ),
    );
    debugPrint("✅ Firebase Web Initialized!");
  } else {
    await Firebase.initializeApp();
    debugPrint("✅ Firebase Android Initialized!");
  }


  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      // Bungkus dengan ResponsiveAppWrapper (sesuaikan importmu)
      builder: (context, child) => ResponsiveAppWrapper(
        child: child!,
        backgroundColor: const Color(0xFFFFFFFF),
        minWidth: 420.0,
        maxWidth: 580.0,
        idealAspectRatio: 9 / 16,
        minAspectRatio: 0.8,
        maxAspectRatio: 0.85,
        enableDebugOutline: kDebugMode && false,
      ),
      title: 'Ureeka Submission',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // pick a real brand color here instead of white, if you want dynamic theming
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
            .copyWith(
          background: Colors.white,
          surface: Colors.white,
        ),

        // force Scaffold to white
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),

        // search‐bar, text etc. can pick up this scheme
      ),

      routerConfig: router,
    );
  }
}