import 'package:app/screens/restaurant_detail.dart';
import 'package:app/screens/restaurants_screen.dart';
import 'package:app/screens/system_detail_screen.dart';
import 'package:app/screens/systems_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/restaurants': (BuildContext context) => const RestaurantsScreen(),
    '/restaurants-detail': (BuildContext context) =>
        const RestaurantDetailScreen(),
    '/systems': (BuildContext context) => const SystemsScreen(),
    '/system-detail': (BuildContext context) => const SystemDetailScreen(),
  };

  static String initialRoute = '/restaurants';

  /*static onGenerateRouter(settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }*/

  static List<Map> drawerRoutes = [
    {
      'name': 'Restaurantes',
      'icon': Icons.food_bank,
      'route': '/restaurants',
    },
    {
      'name': 'Sistemas Operativos',
      'icon': Icons.android,
      'route': '/systems',
    },
    {
      'name': 'Diccionario de Ingles',
      'icon': Icons.translate,
      'route': '/login',
    },
  ];
}
