import 'package:flutter/material.dart';

main() => runApp(Controles());

class Controles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State {
  double sumaInicial = 0.0; //precio por hora
  double sumaFinal = 0.0; //precio por fraccion de hora
  double resta;
  double horainicial; //tiempo de inicio
  double minutosinicial; //tiempo de inicio
  double horafinal; //tiempo final
  double minutosfinal; //tiempo final en minutos ;v
  double fin; // resulta final

  //1 hora = 60 minutos
  /*
  1 hora= 40, fraccion= 10


  Hora inicial= 5   =====> 17*60+ minutos ====>  300+26 = 326minutos 
  minutos: 26            17:26pm

  Hora final= 8   =======> 20*60+minutisfinal ====> 480+50 = 530minutos
  minutosfinal= 50           20:50pm

  resultadofinal===> 530-326 =204minutos  



  204/10 =  20.4 ====> 21 * costo ====> fin 


  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: Text("Calculadora Estacionamiento"),
            centerTitle: true
            ),
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: <Widget>[
                Text('Precios',style: TextStyle(color: Colors.lightBlue, fontSize: 30.0),),
                Divider(),
                Text('Costo X hora es de 40',style: TextStyle(color: Colors.pink[200],fontSize: 20.0)),
                Text('Costo X fraccion es de 10',style: TextStyle(color: Colors.pink[200],fontSize: 20.0)),
                Divider(height: 20.0,),
                Text('Hora Inicial',style: TextStyle(color: Colors.black, fontSize: 30.0),),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                            onChanged: (cobrohora) {
                              setState(() {
                                horainicial = double.parse(cobrohora) * 60;
                                sumaInicial = horainicial + minutosinicial;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.access_time, color: Colors.blue,),
                              hintText: 'Horas en formato 24hr >:v',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular((20))),
                            ))),
                    Expanded(
                        child: TextField(
                            onChanged: (cobrominutos) {
                              setState(() {
                                minutosinicial = double.parse(cobrominutos);
                                sumaInicial = horainicial + minutosinicial;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Minutos',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular((20))),
                            ))),
                  ],
                ),
                Text(''),
                Text('Hora final', style: TextStyle(color: Colors.red, fontSize: 30.0),),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                            onChanged: (cobrohorafinal) {
                              setState(() {
                                horafinal = double.parse(cobrohorafinal) * 60;
                                sumaFinal = minutosfinal + horafinal;
                                resta = sumaFinal - sumaInicial;
                                fin = (resta / 15) * 10;
                              });
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.access_time, color: Colors.blueGrey,),
                              hintText: 'Horas',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular((20))),
                            ))),
                    Expanded(
                        child: TextField(
                            onChanged: (cobrominutosfinal) {
                              setState(() {
                                minutosfinal = double.parse(cobrominutosfinal);
                                sumaFinal = minutosfinal + horafinal;
                                resta = sumaFinal - sumaInicial;
                                fin = (resta / 15) * 10;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Minutos',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular((20))),
                            ))),
                  ],
                ),
                Divider(),
                Text('Estuviste estacionado $resta minutos',style: TextStyle(color: Colors.teal, fontSize: 15.0),),
                Divider(),
                Text(
                  'Favor de pagar: $fin pesos :v',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),
                ),
              ])),
        ));
  }
}