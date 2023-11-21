import 'package:app/screens/restaurant_detail.dart';
import 'package:app/services/restaurant_service.dart';
import 'package:app/services/system_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DictionaryItemWidget extends StatelessWidget {
  DictionaryItemWidget({
    super.key,
    required this.item,
    required this.changeItems,
  });
  dynamic item;
  Function changeItems;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            onPressed: (lala) async {
              showConfirmSoftDelete(context);
            },
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.disabled_by_default,
          ),
        ],
      ),
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            item['pharse'],
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            item['translation'],
            style: const TextStyle(color: Colors.black54),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/system-detail',
              arguments: {
                'isEditing': true,
                ...item,
              },
            );
          },
        ),
      ),
    );
  }

  showConfirmSoftDelete(BuildContext context) {
    Widget cancelButton = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: const Text("Cancelar"),
      onPressed: () {
        print("Cancelando..");
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: const Text("Desactivar"),
      onPressed: () async {
        print("Eliminando..");
        await SystemService.softDeleteById(item['id']);
        changeItems();
        Navigator.of(context).pop();
        // Otras acciones de eliminar
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Desactivar Sistema Operativo"),
      content: const Text("¿Estás seguro de desactivar la Sistema Operativo?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
