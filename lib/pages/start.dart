import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_solicitud_de_servicio_day_2/models/servicio.dart';
import 'package:flutter_solicitud_de_servicio_day_2/pages/seleccionar_servicio.dart';

class StartPage extends StatefulWidget {
   
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
 List<Servicios> servicios = [
    Servicios('Limpieza', 'assets/limpieza.png'),
    Servicios('Plomero', 'assets/plomero.png'),
    Servicios('Electricista', 'assets/electricista.png'),
    Servicios('Pintor', 'assets/pintor.png'),
    Servicios('Carpintero', 'assets/carpinteria.png'),
    Servicios('Jardinero', 'assets/jardinero.png'),
    Servicios('Sastre', 'assets/sastre.png'),
    Servicios('Mucama', 'assets/mucama.png'),
    Servicios('Taxi', 'assets/taxista.png'),
 ]; 

 int seleccionarServicio = 4;

@override
  void initState() {
    Timer.periodic( const Duration(seconds: 2), (timer){
      setState(() {
          seleccionarServicio = Random().nextInt(servicios.length);
        });
      });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 110),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: servicios.length,
                itemBuilder: (BuildContext context, int index) {
                  return servicioContainer(servicios[index].imageURL,
                          servicios[index].name, index);
                }),
          ),
        Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  )),
              child: Column(
                children: [
                  const SizedBox( height: 20, ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                          child: Text(
                            'La manera más fácil y confiable de cuidar su hogar.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ),
                  ),
                 const SizedBox( height: 20, ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Center(
                          child: Text(
                            'Ponemos a su disposición los mejores profesionales para ayudar y cuidar su hogar.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                  ),
                Container(
                    padding: const EdgeInsets.all(50),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SeleccionarServicio()),
                        );
                      },
                      height: 55,
                      color: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text(
                          'Iniciar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

servicioContainer( String image, String name, int index) {
  return GestureDetector(
    onTap: () { },
    child: AnimatedContainer(
      duration: const Duration(microseconds: 500),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color:  seleccionarServicio == index ? Colors.white : Colors.grey.shade100,
        border: Border.all(
          color: seleccionarServicio == index ? Colors.blue.shade100 : Colors.grey.withOpacity(0)
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 30,),
          const SizedBox(height: 10,),
          Text(name),
        ],
      ), 
    ),
  );
}

}

