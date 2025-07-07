import 'package:flutter/material.dart';
import 'package:maqueta_3/services/api_service.dart';
import 'package:maqueta_3/widgets/mydrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState()
  {
    super.initState();
    //ServiceApi('https://www.dragonball-api.com/api/characters/1');

  }

  @override
  Widget build(BuildContext context) {    
  //ServiceApi('https://www.dragonball-api.com/api');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      )
    );
  }
}
