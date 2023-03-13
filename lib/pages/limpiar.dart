import 'package:flutter/material.dart';
import 'package:flutter_solicitud_de_servicio_day_2/pages/hora_tiempo.dart';

class LimpiarPage extends StatefulWidget {
   
  const LimpiarPage({Key? key}) : super(key: key);

  @override
  State<LimpiarPage> createState() => _LimpiarPageState();
}

class _LimpiarPageState extends State<LimpiarPage> {

    final List<dynamic> _cuartos =[
    ['Sala', 'https://img.icons8.com/officel/2x/living-room.png', Colors.red, 1],
    ['Dormitorio', 'https://img.icons8.com/fluency/2x/bedroom.png', Colors.orange, 1],
    ['Baño', 'https://img.icons8.com/color/2x/bath.png', Colors.blue, 1],
    ['Cocina', 'https://img.icons8.com/dusk/2x/kitchen.png', Colors.purple, 1],
    ['Oficina', 'https://img.icons8.com/color/2x/office.png', Colors.green, 1]
  ];

  final List<int> _selectedCuartos = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: _selectedCuartos.isNotEmpty ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
             MaterialPageRoute(
              builder: (context) => const HoraTiempo(),
             )
          );
        },
        backgroundColor: Colors.blue,
        child: Row(
          children: [
            const SizedBox(width: 10, ),
            Text( '${_selectedCuartos.length}',style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold )),
            const SizedBox(width: 2),
            const Icon(Icons.arrow_forward, size: 18)   
          ],
        ),
      ) : null,
      body: NestedScrollView(
        headerSliverBuilder: ( BuildContext context, innerBoxIsScrolled) {
          return  [ SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 100), 
              child: Text('¿Dónde quieres limpiar?', 
              style: TextStyle(
                fontSize: 35,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold
              )),
              ),
            )
          ];
        }, 
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _cuartos.length,
            itemBuilder: ( BuildContext context, index) {
             return habitacion(_cuartos[index], index);
            }
            
            ),
          )
        ),
    );
  }

  habitacion(List habitacion, int index) {
    return GestureDetector(
      onTap: () {
        if (_selectedCuartos.contains(index)) {
          _selectedCuartos.remove(index);
        } else {
          _selectedCuartos.add(index);
        }
        setState(() { });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _selectedCuartos.contains(index)
              ? habitacion[2].shade50.withOpacity(0.5)
              : Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
               Row(
                children: [
                  Image.network(habitacion[1], width: 35, height: 35),
                  Text(habitacion[0],style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                ],
               ),
               const Spacer(),
               _selectedCuartos.contains(index) ?
               Container(
                padding: const EdgeInsets.all(5),
                child: const Icon( Icons.check , color: Colors.green, size: 20,),
               ) : const SizedBox()
              ],
            ),
            (_selectedCuartos.contains(index) && habitacion[3] >= 1) ?
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0,),
                  Text('${habitacion[0]}?', style: const TextStyle(fontSize: 15),),
                  const SizedBox(height: 10.0,),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              habitacion[3] = index + 1;
                              setState(() { });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: habitacion[3] == index + 1
                                  ? habitacion[2].withOpacity(0.5)
                                  : habitacion[2].shade200.withOpacity(0.5),
                              ),
                              child: Center(
                                child: Text(
                                  (index + 1).toString(), style: const TextStyle(fontSize: 22, color: Colors.white ),),
                                ),
                            ),
                          );
                        },
                      ),
                  )
                ],
              ),
            ) : const SizedBox()
          ],
        ),
      ),
    );
  }

}