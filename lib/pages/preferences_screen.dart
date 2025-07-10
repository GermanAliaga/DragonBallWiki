
import 'package:flutter/material.dart';
import 'package:maqueta_3/widgets/myfooter.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({
    super.key,
  });

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Configuraciones'),
      ),
      bottomNavigationBar: MyFooter(),
      body: Center(
        child: Column(
          children: [
            
          ],
        ),
      )
    );
  }
}