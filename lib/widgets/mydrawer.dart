import 'package:flutter/material.dart';
import 'package:maqueta_3/pages/home.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 125,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(248, 117, 208, 231),
            ),
            child: Text(
              'DocFileApp',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        ListTile(
          title: const Text('Inicio'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
        ),
      ],
    ));
  }
}