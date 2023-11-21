import 'package:app/services/system_service.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class SystemDetailScreen extends StatefulWidget {
  const SystemDetailScreen({
    super.key,
  });

  @override
  State<SystemDetailScreen> createState() => _SystemDetailScreenState();
}

class _SystemDetailScreenState extends State<SystemDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _onwerController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _versionController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _releaseController = TextEditingController();
  late Map args = {};

  @override
  void didChangeDependencies() {
    setState(() {
      args = ModalRoute.of(context)!.settings.arguments as Map;
      args['isEditing'] = args['isEditing'] ?? false;
      if (args['isEditing'] ?? false) {
        _nameController.text = args['name'] ?? '';
        _priceController.text = args['price'].toString() ?? '';
        _versionController.text = args['latest_version'] ?? '';
        _onwerController.text = args['owner'] ?? '';
        _descriptionController.text = args['description'] ?? '';
        _releaseController.text = args['release_date'] ?? '';
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
          "${args['isEditing'] ? 'Editar' : 'Nuevo'} Sistema",
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
              controller: _versionController,
              decoration: const InputDecoration(
                labelText: 'Última Versión',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _priceController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _onwerController,
              decoration: const InputDecoration(
                labelText: 'Creador',
              ),
            ),
            const SizedBox(height: 16.0),
            DateTimeField(
              format: DateFormat("yyyy-MM-dd"),
              controller: _releaseController,
              decoration: const InputDecoration(
                labelText: 'Fecha de Lanzamiento',
              ),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100),
                  fieldLabelText: "Fecha de Lanzamiento",
                );
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              //obscureText: true,
              maxLines: 3,
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
                  String version = _versionController.text;
                  double price = double.parse(_priceController.text);
                  String owner = _onwerController.text;
                  String release = _releaseController.text;

                  if (args['isEditing']) {
                    await SystemService.update(
                      item: {
                        'name': name,
                        'description': description,
                        'version': version,
                        'price': price,
                        'owner': owner,
                        'release': release,
                      },
                      id: args['id'],
                    );
                  } else {
                    await SystemService.save(
                      name: name,
                      description: description,
                      version: version,
                      price: price,
                      owner: owner,
                      release: release,
                    );
                  }

                  Navigator.pushNamed(context, '/systems');
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
