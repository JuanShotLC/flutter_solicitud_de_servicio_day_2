
import 'package:flutter/material.dart';
import 'package:flutter_solicitud_de_servicio_day_2/pages/inicio.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HoraTiempo extends StatefulWidget {
   
  const HoraTiempo({Key? key}) : super(key: key);

  @override
  State<HoraTiempo> createState() => _HoraTiempoState();
}

class _HoraTiempoState extends State<HoraTiempo> {
   int _selectedDia = 2;
   int _selectedReptir = 0;
   String _selectedHora = '13:30';
   final List<int> _selectedLimpezaExtra = [];

  final ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _dias = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  final List<String> _repetir = [
    'No repetir',
    'Cada día',
    'Cada semana',
    'Cada mes'
  ];

  final List<dynamic> _limpiezaxtra = [
    ['Lavar', 'assets/lavadora.png', '10'],
    ['Refrigerador', 'assets/refrigerador.png', '8'],
    ['Horno','assets/horno.png', '8'],
    ['Vehiculo','assets/vehiculo.png', '20'],
    ['Ventana','assets/ventana.png', '20'],
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InicioPage(),
              ),
          );
        },
        child: const Icon(Icons.arrow_forward),
        ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return[
           SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
                child: Text(
                  'Selecionar la fecha y hora',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.green.shade900,
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
            children:  [
              const SizedBox(height:50,),
              Row(
                children: [
                  const Text('Octubre 2023',),
                  const Spacer(),
                  IconButton(
                    onPressed: () { },
                    icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey.shade700,))
                ],
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200)
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _dias.length,
                  itemBuilder: ( BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _selectedDia = _dias[index][0];
                        setState(() { });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        width: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _selectedDia == _dias[index][0] ? Colors.blue.shade100.withOpacity(0.5): Colors.blue.withOpacity(0),
                          border: Border.all(
                            color: _selectedDia == _dias[index][0] ? Colors.blue : Colors.white.withOpacity(0),
                            width: 1.5
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_dias[index][0].toString(), style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 10,),
                            Text(_dias[index][1], style: const TextStyle( fontSize: 16),),
                          ],
                        ),
                      ));
                   },
                  ),
              ),
              const SizedBox(height: 40,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color:  Colors.grey.shade200),
                ),
                child: ScrollablePositionedList.builder(
                  itemScrollController: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _hours.length, 
                  itemBuilder: ( BuildContext context,  int index) {
                    return GestureDetector(
                      onTap: () {
                        _selectedHora = _hours[index];
                        setState(() { });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                           color: _selectedHora == _hours[index]
                                  ? Colors.orange.shade100.withOpacity(0.5)
                                  : Colors.orange.withOpacity(0),
                          border: Border.all(
                                color: _selectedHora == _hours[index]
                                    ? Colors.orange
                                    : Colors.white.withOpacity(0),
                                width: 1.5,
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_hours[index], style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    );
                  },
                  ),
              ),
              const SizedBox(height: 40,),
              const Text('Repetir', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _repetir.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {                         
                         _selectedReptir = index;
                        setState(() {  });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selectedReptir == index ? Colors.blue.shade400 : Colors.grey.shade100,
                        ),
                        margin: const EdgeInsets.only(right: 20),
                        child: Center(child: Text(_repetir[index], 
                          style: TextStyle(fontSize: 18, color: _selectedReptir == index ? Colors.white : Colors.grey.shade800),)
                        ),
                      ));
                  },
                )
              ),
                            const SizedBox(height: 50,),
              const Text("Servicio Adicional", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _limpiezaxtra.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedLimpezaExtra.contains(index)) {
                            _selectedLimpezaExtra.remove(index);
                          } else {
                            _selectedLimpezaExtra.add(index);
                          }
                        });
                      },
                      child: Container(
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selectedLimpezaExtra.contains(index) ? Colors.blue.shade400 : Colors.transparent,
                        ),
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(_limpiezaxtra[index][1], height: 40,),
                            const SizedBox(height: 10,),
                            Text(_limpiezaxtra[index][0], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: _selectedLimpezaExtra.contains(index) ? Colors.white : Colors.grey.shade800),),
                            const SizedBox(height: 5,),
                            Text("+${_limpiezaxtra[index][2]}\$", style: const TextStyle(color: Colors.black),)
                          ],
                        )
                      )
                    );
                  },  
                )
              ),
            ],
          ),
          )
        ),
    );
  }
}