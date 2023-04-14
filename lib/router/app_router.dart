import 'package:go_router/go_router.dart';
import 'package:technical_flutter_api/pages/dashboard_page.dart';
import 'package:technical_flutter_api/pages/list_page.dart';
import 'package:technical_flutter_api/pages/tab_page.dart';

final router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      builder: (context, state, child) => TabPage(
        child: child,
      ),
      routes: [
        GoRoute(
          builder: (context, state) => const DashboardPage(),
          path: '/dashboard',
        ),
        GoRoute(
          path: '/list',
          builder: (context, state) => const ListPage(),
        ),
      ],
    ),
  ],
);

class $AppRouter {}
