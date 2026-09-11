import 'package:flutter/material.dart';
import 'package:u3_ejercicio1_sqlite1/automovil.dart';
import 'package:u3_ejercicio1_sqlite1/basedatos.dart';

class app0301 extends StatefulWidget {
  const app0301({super.key});

  @override
  State<app0301> createState() => _app0301State();
}

class _app0301State extends State<app0301> {

  final placa = TextEditingController();
  final modelo = TextEditingController();
  final marca = TextEditingController();
  final anio = TextEditingController();
  final costo = TextEditingController();

  String titulo =  "BASE DATOS";
  List<Automovil> datos =[];

  void actualizarLista() async{
    List<Automovil> temp = await DB.mostrarTodos();
    setState(() {
      datos=temp;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    actualizarLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                TextField(
                  controller: placa,
                  decoration: InputDecoration(
                    labelText: "PLACA"
                  ),
                ),
                TextField(
                  controller: marca,
                  decoration: InputDecoration(
                      labelText: "MARCA"
                  ),
                ),
                TextField(
                  controller: modelo,
                  decoration: InputDecoration(
                      labelText: "MODELO"
                  ),
                ),
                TextField(
                  controller: anio,
                  decoration: InputDecoration(
                      labelText: "ANIO"
                  ),
                ),
                TextField(
                  controller: costo,
                  decoration: InputDecoration(
                      labelText: "COSTO"
                  ),
                ),
                Row(
                  children: [
                    OutlinedButton(onPressed:
                        (){
                          Automovil a = Automovil(
                              placa: placa.text,
                              marca: marca.text,
                              modelo: modelo.text,
                              anio: int.parse(anio.text),
                              costo: double.parse(costo.text)
                          );
                          DB.insertar(a).then(
                                  (respuesta){
                                    if(respuesta<=0){
                                      setState(() {
                                        titulo = "ERROR! NO SE INSERTO";
                                      });
                                    }else{
                                      setState(() {
                                        titulo="EXITO! SE CAPTURO $respuesta";
                                      });
                                    }
                                    actualizarLista();
                                  }
                          );
                        },
                        child: Text("Insertar")
                    ),
                    OutlinedButton(
                        onPressed: (){
                          placa.text="";
                          modelo.text="";
                          marca.text="";
                          anio.text="";
                          costo.text="";
                        },
                        child: Text("Limpiar"))
                  ],
                )
              ],
            ),
          ),
          Expanded(child:
          ListView.builder(
              itemCount: datos.length,
              itemBuilder: (context, contador){
                return ListTile(
                  title: Text(datos[contador].modelo),
                  subtitle: Text(datos[contador].placa),
                  leading: CircleAvatar(child: Text(contador.toString()),),
                  trailing: IconButton(
                      onPressed: (){
                        AlertDialog(title: Text("Estas seguro que deseas eliminar?", style: TextStyle(color: Colors.red),),
                          content: Row(
                            children: [
                              Text("Placa: "+datos[contador].placa),
                            ],
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              DB.eliminar(datos[contador].placa)
                                  .then((respuesta){
                                actualizarLista();
                              });
                            },
                                child: Text("SI")),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            },
                                child: Text("Cancelar"))
                          ],
                        );
                      },
                      icon: Icon(Icons.delete)),
                  onTap: (){},
                );
              }
          )
          ),
        ],
      ),
    );
  }
}
