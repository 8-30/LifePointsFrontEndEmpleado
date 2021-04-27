import 'package:life_point_empleado/models/person_model.dart';

class EmpleadoModel extends PersonaModel {
  int idEmpleado;
  String empresa;
  double tarifa;
  double calificacion;
  String nombreServicio;
  String descripcion;

  EmpleadoModel(
      {idPersona,
      nombre,
      apellido,
      nacimiento,
      email,
      direccion,
      telefono,
      genero,
      foto,
      credencial,
      contrasenia,
      empleado,
      notyKey,
      this.idEmpleado,
      this.calificacion,
      this.empresa,
      this.tarifa,
      this.descripcion});

  static EmpleadoModel fromJson(Map<String, dynamic> json) {
    EmpleadoModel empleadoModel = EmpleadoModel();
    empleadoModel.idEmpleado = json['idEmpleado'];
    empleadoModel.idPersona = json['idEmpleado'];
    empleadoModel.calificacion = json['calificacion']?.toDouble();
    empleadoModel.tarifa = json['tarifa']?.toDouble();
    empleadoModel.nombreServicio = json['nombreServicio'];
    empleadoModel.descripcion = json['descripcion'];
    empleadoModel.empresa = json['empresa'];
    empleadoModel.nombre = json['persona']['nombre'];
    empleadoModel.apellido = json['persona']['apellido'];
    empleadoModel.nacimiento = null;
    empleadoModel.email = json['persona']['email'];
    empleadoModel.direccion = json['persona']['direccion'];
    empleadoModel.telefono = json['persona']['telefono'];
    empleadoModel.genero = json['persona']['genero'];
    empleadoModel.foto = json['persona']['foto'];
    empleadoModel.credencial = json['persona']['credencial'];
    empleadoModel.contrasenia = json['persona']['contrasenia'];
    empleadoModel.usuario = json['persona']['usuario'];
    empleadoModel.notyKey = json['persona']['notyKey'];
    return empleadoModel;
  }

  static EmpleadoModel fromJson2(Map<String, dynamic> json) {
    return EmpleadoModel(
      idEmpleado: json['idEmpleado'],
      calificacion: json['calificacion'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idEmpleado": idEmpleado,
        "calificacion": calificacion,
        "empresa": empresa,
        "descripcion": descripcion,
        "tarifa": tarifa,
        "idPersona": idPersona,
        "nombre": nombre,
        "apellido": apellido,
        "nacimiento": "1997-10-10",
        "email": email,
        "direccion": direccion,
        "telefono": telefono,
        "genero": genero,
        "foto": foto,
        "credencial": credencial,
        "contrasenia": contrasenia,
        "usuario": usuario,
        "nombreServicio": nombreServicio,
        "notyKey": notyKey,
      };
}
