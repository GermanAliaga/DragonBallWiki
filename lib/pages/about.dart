import 'package:flutter/material.dart';

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
            Text('Información sobre la aplicación \n \n DragonBallWiki es una aplicación que permite \n buscar información relacionada a los diferentes \n personajes dentro del universo de Dragon Ball \n detallando cada característica de estos, como lo \n son su poder de Ki, su planeta de origen, la cantidad \n de transformaciones que tiene, una descripción, \n también una imagen como referencia.'),
            Text('Desarrolladores \n \n \n José Nicolás Migueles Marambio \n Germán Andrés Aliaga Vergara'),
          ],
        ),
      )
    );
  }
}
