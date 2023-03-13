import 'package:flutter/material.dart';
import 'package:flutter_solicitud_de_servicio_day_2/models/servicio.dart';

class InicioPage extends StatefulWidget {
   
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  List<Servicios> servicios = [
    Servicios('Limpieza', 'assets/limpieza.png'),
    Servicios('Plomero', 'assets/plomero.png'),
    Servicios('Electricista', 'assets/electricista.png'),
    Servicios('Pintor', 'assets/pintor.png'),
    Servicios('Carpintero', 'assets/carpinteria.png'),
    Servicios('Jardinero', 'assets/jardinero.png'),
  ]; 

  List<dynamic> trabajadores = [
    ['Alfredo Schafer', 'Plomero', 'assets/trabajador.png', 4.8],
    ['Michelle Baldwin', 'Limpieza', 'assets/trabajador.png', 4.6],
    ['Brenon Kalu', 'Conductor', 'assets/trabajador.png', 4.4]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Dashboard', style: TextStyle(color: Colors.black),),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications_none, color: Colors.grey.shade700, size: 30,),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/trabajador.png'),
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Reciente', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('Ver todo',)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(0, 4),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset('assets/trabajadora.png', width: 70,)
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Isabel Kirkland", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            Text("Limpeza", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 18),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: const Center(child: Text('Ver perfil', style: TextStyle(color: Colors.white, fontSize: 18),)),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Categoria', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('Ver todo',)
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: servicios.length,
                itemBuilder: (BuildContext context, int index) {
                  return serviceContainer(servicios[index].imageURL, servicios[index].name, index);
                }
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Top', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('Ver todo',)
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trabajadores.length,
                itemBuilder: (BuildContext context, int index) {
                  return trabajadorContainer(trabajadores[index][0], trabajadores[index][1], trabajadores[index][2], trabajadores[index][3]);
                }
              ),
            ),
            const SizedBox(height: 150,),
          ]
        )
      ));
  }
  }
  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: 45),
            const SizedBox(height: 20,),
            Text(name, style: const TextStyle(fontSize: 15),)
          ]
        ),
      ),
    );
  }

  trabajadorContainer(String name, String job, String image, double rating) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 3.5,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(image)
              ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text(job, style: const TextStyle(fontSize: 15),)
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(rating.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const Icon(Icons.star, color: Colors.orange, size: 20,)
                ],
              )
            ]
          ),
        ),
      ),
    );
  }