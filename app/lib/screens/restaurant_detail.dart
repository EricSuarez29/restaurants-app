import 'package:app/screens/restaurants_screen.dart';
import 'package:app/services/restaurant_service.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({
    super.key,
  });

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  double stars = 0;
  late Map args = {};

  @override
  void didChangeDependencies() {
    setState(() {
      args = ModalRoute.of(context)!.settings.arguments as Map;
      args['isEditing'] = args['isEditing'] ?? false;
      if (args['isEditing'] ?? false) {
        _nameController.text = args['name'] ?? '';
        _phoneController.text = args['phone'] ?? '';
        _addressController.text = args['address'] ?? '';
        _typeController.text = args['type'] ?? '';
        _descriptionController.text = args['description'] ?? '';
        stars = args['stars'].toDouble() ?? 0;
      }
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "${args['isEditing'] ? 'Editar' : 'Nuevo'} Restaurante",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Dirección',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(
                labelText: 'Tipo',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    stars.toInt(), (index) => const Icon(Icons.star))
              ],
            ),
            Slider(
              value: stars,
              max: 5,
              divisions: 5,
              label: stars.toString(),
              onChanged: (double value) {
                setState(() {
                  stars = value;
                });
              },
            ),
            TextField(
              controller: _descriptionController,
              //obscureText: true,
              maxLines: 5,
              //or null
              decoration: const InputDecoration(
                labelText: 'Descripción',
              ),
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: () async {
                // Add your login logic here
                try {
                  String name = _nameController.text;
                  String description = _descriptionController.text;
                  String address = _addressController.text;
                  String phone = _phoneController.text;
                  String type = _typeController.text;

                  if (args['isEditing']) {
                    await RestaurantService.update(
                      item: {
                        'name': name,
                        'description': description,
                        'address': address,
                        'phone': phone,
                        'type': type,
                        'stars': stars.toInt()
                      },
                      id: args['id'],
                    );
                  } else {
                    await RestaurantService.save(
                      name: name,
                      description: description,
                      address: address,
                      phone: phone,
                      type: type,
                      stars: stars.toInt(),
                    );
                  }

                  Navigator.pushNamed(context, '/');
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RestaurantsScreen(
                              title: "Restaurants App",
                            )),
                  );*/
                } catch (e) {
                  print(e);
                }

                //print('Email: $email, Password: $password');
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
