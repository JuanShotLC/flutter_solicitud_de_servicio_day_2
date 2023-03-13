import 'package:flutter/material.dart';
import 'package:flutter_solicitud_de_servicio_day_2/models/servicio.dart';
import 'package:flutter_solicitud_de_servicio_day_2/pages/limpiar.dart';

class SeleccionarServicio extends StatefulWidget {
   
  const SeleccionarServicio({Key? key}) : super(key: key);

  @override
  State<SeleccionarServicio> createState() => _SeleccionarServicioState();
}


class _SeleccionarServicioState extends State<SeleccionarServicio> {
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

  int seleccionarServicio = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: seleccionarServicio >= 0 ? FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const LimpiarPage(),)
            );
          },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_forward, size: 20),
        ): null,
        body: NestedScrollView(
          headerSliverBuilder: ( BuildContext context, innerBoxIsScrolled) {
            return [
                SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    '¿Qué servicio necesitas?',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ];
          }, 
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0
                    ),
                    itemCount: servicios.length, 
                    itemBuilder: (BuildContext context, index) {
                      return servicioContainer(servicios[index].imageURL,
                        servicios[index].name, index);
                    },
                  )
                )
              ],
            ),
          )
        ),
    );
  }

servicioContainer( String image, String name, int index) {
  return GestureDetector(
    onTap: () { 
      if (seleccionarServicio == index) {
        seleccionarServicio = -1;
      } else {
        seleccionarServicio = index;
      }
      setState(() { });
    },
    child: AnimatedContainer(
      duration: const Duration(microseconds: 300),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color:  seleccionarServicio == index ? Colors.white : Colors.grey.shade100,
        border: Border.all(
          color: seleccionarServicio == index ? Colors.blue.shade100 : Colors.grey.withOpacity(0),
          width: 2
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 80,),
          const SizedBox(height: 20,),
          Text(name, style: const TextStyle(fontSize: 20),),
        ],
      ), 
    ),
  );
}
}