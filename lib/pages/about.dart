import 'package:flutter/material.dart';
import 'package:dragonballwiki/widgets/mydrawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sobre"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Información sobre la aplicación \n'),
            Text('DragonBallWiki es una aplicación que permite buscar información relacionada a los diferentes personajes dentro del universo de Dragon Ball detallando cada característica de estos, como lo son su poder de Ki, su planeta de origen, la cantidad de transformaciones que tiene, una descripción, también una imagen como referencia. \n \n \n'),
            Text('Desarrolladores \n \n \n José Nicolás Migueles Marambio \n Germán Andrés Aliaga Vergara'),
          ],
        ),
      )
    );
  }
}
