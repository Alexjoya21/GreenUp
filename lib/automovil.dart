
import 'package:sqflite/sqflite.dart';

class Automovil{
  String placa;
  String marca;
  String modelo;
  int anio;
  double costo;

  Automovil({
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.costo
});

  Map<String, dynamic> toJSON(){
    return {
      'placa':placa,
      'modelo': modelo,
      'marca': marca,
      'anio': anio,
      'costo': costo
    };
  }
}