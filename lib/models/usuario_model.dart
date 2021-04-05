import 'package:life_point/models/person_model.dart';

class UsuarioModel extends PersonaModel {
  int idUsuario;
  String calificacion;

  UsuarioModel({
    idPersona,
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
    usuario,
    this.idUsuario,
    this.calificacion,
  });

  static UsuarioModel fromJson(Map<String, dynamic> json) {
    UsuarioModel usuarioModel = UsuarioModel();
    usuarioModel.idUsuario = json['idUsuario'];
    usuarioModel.idPersona = json['idUsuario'];
    usuarioModel.calificacion = json['calificacion'].toString();
    usuarioModel.nombre = json['persona']['nombre'];
    usuarioModel.apellido = json['persona']['apellido'];
    usuarioModel.nacimiento = null;
    usuarioModel.email = json['persona']['email'];
    usuarioModel.direccion = json['persona']['direccion'];
    usuarioModel.telefono = json['persona']['telefono'];
    usuarioModel.genero = json['persona']['genero'];
    usuarioModel.foto = json['persona']['foto'];
    usuarioModel.credencial = json['persona']['credencial'];
    usuarioModel.contrasenia = json['persona']['contrasenia'];
    usuarioModel.usuario = json['persona']['usuario'];
    return usuarioModel;
  }

  static UsuarioModel fromJson2(Map<String, dynamic> json) {
    return UsuarioModel(
      idUsuario: json['idUsuario'],
      calificacion: json['calificacion'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "calificacion": calificacion,
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
      };
}
