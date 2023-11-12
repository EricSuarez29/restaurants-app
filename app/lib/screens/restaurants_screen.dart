import 'package:app/screens/restaurant_detail.dart';
import 'package:app/services/restaurant_service.dart';
import 'package:app/widgets/restaurant_item_widget.dart';
import 'package:flutter/material.dart';

class RestaurantsScreen extends StatefulWidget {
  RestaurantsScreen({super.key, required this.title});
  String title;

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  void changeItems() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Used for removing back buttoon.
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: RestaurantService.fetchAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                ...snapshot.data!.map(
                  (category) => RestaurantItemWidget(
                      item: category, changeItems: changeItems),
                ),
              ],
            );
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: Text("No hay datos"))],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantDetailScreen(
                      title: "Nuevo Restaurante",
                    )),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
