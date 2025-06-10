import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentations/screens/auth/add_information_screen.dart';
import '../presentations/screens/auth/login_screen.dart';
import '../presentations/screens/auth/spalsh_screen.dart';
import '../presentations/screens/home_screen.dart';
import '../presentations/screens/profile_screen.dart';
import '../presentations/screens/tracker/mood_tracker_screen.dart';
import '../presentations/screens/tracker/sleep_tracker_screen.dart';
import '../presentations/screens/tracker/stress_tracker_screen.dart';



/// Provider yang memberi GoRouter ke seluruh app
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',    // mulai di home
    routes: [
      // Splash Route
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => SplashScreen(),
      ),

      // Auth Routes
      GoRoute(
        path: '/auth',
        name: 'auth',
        redirect: (context, state) => '/auth/login', // Default to login
        routes: [
          GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => LoginScreen(),
          ),
          GoRoute(
            path: '/onboarding',
            name: 'onboarding',
            builder: (context, state) => AddInformationScreen(), // Onboarding screen
          ),
        ],
      ),

      // Main App Routes (Protected)
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => ProfileScreen(),
          ),
          GoRoute(
            path: 'add-information',
            name: 'add-information',
            builder: (context, state) => AddInformationScreen(),
          ),
        ],
      ),

      // Tracker Routes (Protected)
      GoRoute(
        path: '/tracker',
        name: 'tracker',
        redirect: (context, state) => '/home', // Default redirect to home
        routes: [
          GoRoute(
            path: 'mood',
            name: 'mood-tracker',
            builder: (context, state) => MoodTrackerScreen(),
          ),
          GoRoute(
            path: 'sleep',
            name: 'sleep-tracker',
            builder: (context, state) => SleepTrackerScreen(),
          ),
          GoRoute(
            path: 'stress',
            name: 'stress-tracker',
            builder: (context, state) => StressTrackerScreen(),
          ),
        ],
      ),
    ],

    // halaman 404 sederhana
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Not Found')),
      body: Center(child: Text('Page not found: ${state.error}')),
    ),
  );
});


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Ureeka Submission Apps',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}