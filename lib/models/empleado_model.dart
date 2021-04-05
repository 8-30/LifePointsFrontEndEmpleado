import 'package:life_point/models/person_model.dart';

class EmpleadoModel {
  int idEmpleado;
  String empresa;
  double tarifa;
  double calificacion;
  String descripcion;
  PersonaModel persona;

//  Empleado Empleado;
  EmpleadoModel({
    this.idEmpleado,
    this.empresa,
    this.tarifa,
    this.calificacion,
    this.descripcion,
    this.persona,
  });

  static EmpleadoModel fromJson(Map<String, dynamic> json) {
    return EmpleadoModel(
      idEmpleado: json['idEmpleado'],
      empresa: json['empresa'],
      tarifa: json['tarifa'],
      calificacion: json['calificacion']?.toDouble(),
      descripcion: json['descripcion'],
      persona: PersonaModel.fromJson(json['persona']),
    );
  }

  Map<String, dynamic> toJson() => {
        "idEmpleado": idEmpleado,
        "empresa": empresa,
        "tarifa": tarifa,
        "calificacion": calificacion,
        "descripcion": descripcion,
      };
}
