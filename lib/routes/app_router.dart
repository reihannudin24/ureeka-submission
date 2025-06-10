import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentations/screens/auth/add_information_screen.dart';
import '../presentations/screens/auth/login_screen.dart';
import '../presentations/screens/auth/spalsh_screen.dart';
import '../presentations/screens/ticket_detail_screen.dart';
import '../presentations/screens/destination_detail.dart' show DestinationDetailPage;
import '../presentations/screens/home_screen.dart';
import '../presentations/screens/profile_screen.dart';



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


      // In your GoRouter configuration:
      GoRoute(
        path: '/destination/:id',
        name: 'destination',
        builder: (context, state) {
          final String? idParam = state.pathParameters['id'];
          final int id = int.tryParse(idParam ?? '1') ?? 1;
          return DestinationDetailPage(id: id);
        },
      ),


// Tambahkan route ini di GoRouter configuration Anda:
      GoRoute(
        path: '/destination/:destinationId/ticket/:ticketId',
        name: 'ticket_detail',
        builder: (context, state) {
          final String? destinationIdParam = state.pathParameters['destinationId'];
          final String? ticketIdParam = state.pathParameters['ticketId'];

          // Parse to int with error handling
          final int destinationId = int.tryParse(destinationIdParam ?? '1') ?? 1;
          final int ticketId = int.tryParse(ticketIdParam ?? '1') ?? 1;

          return TicketDetailPage(
            destinationId: destinationId,
            ticketId: ticketId,
          );
        },
      ),


      // // property
      // GoRoute(
      //   path: '/cart',
      //   name: 'cart',
      //   redirect: (context, state) => '/cart', // Default redirect to home
      //   routes: [
      //     GoRoute(
      //       path: '',
      //       name: 'cart',
      //       builder: (context, state) => CartScreen(),
      //     )
      //   ],
      // ),
      // // property
      // GoRoute(
      //   path: '/property',
      //   name: 'property',
      //   redirect: (context, state) => '/property', // Default redirect to home
      //   routes: [
      //     GoRoute(
      //       path: 'detail/:id',
      //       name: 'property-detail',
      //       // aku mau kirim id ke PropertyDetailScreen
      //       id := state.params['id']
      //       builder: (context, state) => PropertyDetailScreen(id),
      //     )
      //   ],
      // ),



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