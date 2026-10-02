import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/customer/splash/presentation/splash_screen.dart';
import '../../features/customer/auth/presentation/screens/login_screen.dart';
import '../../features/customer/home/presentation/screens/main_layout_screen.dart';
import '../../features/customer/home/presentation/screens/home_tab_screen.dart';
import '../../features/customer/profile/presentation/screens/profile_screen.dart';
import '../../features/customer/orders/presentation/screens/order_history_screen.dart';
import '../../features/customer/orders/presentation/screens/order_success_screen.dart';
import '../../features/customer/menu/presentation/screens/menu_screen.dart';
import '../../features/customer/menu/presentation/screens/menu_item_detail_screen.dart';
import '../../features/customer/cart/presentation/screens/cart_screen.dart';

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeTabNav');
final _menuTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'menuTabNav');
final _ordersTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'ordersTabNav');
final _profileTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profileTabNav');

final GoRouter customerRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/order-success',
      builder: (context, state) => const OrderSuccessScreen(),
    ),
    GoRoute(
      path: '/menu-detail',
      builder: (context, state) => const MenuItemDetailScreen(),
    ),
    
    // StatefulShellRoute for Bottom Navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainLayoutScreen(navigationShell: navigationShell);
      },
      branches: [
        // Tab 1: Home
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeTabScreen(),
            ),
          ],
        ),
        
        // Tab 2: Menu Card
        StatefulShellBranch(
          navigatorKey: _menuTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/menu',
              builder: (context, state) => const MenuScreen(),
            ),
          ],
        ),
        
        // Tab 3: Orders
        StatefulShellBranch(
          navigatorKey: _ordersTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/orders',
              builder: (context, state) => const OrderHistoryScreen(),
            ),
          ],
        ),
        
        // Tab 4: Profile
        StatefulShellBranch(
          navigatorKey: _profileTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
