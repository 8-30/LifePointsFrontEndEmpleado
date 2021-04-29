import 'dart:io';

import 'package:life_point_empleado/models/empleado_model.dart';
import 'package:life_point_empleado/models/person_model.dart';
import 'package:life_point_empleado/provider/empleado/empleado_provider.dart';

class EmpleadoRepository {
  EmpleadoApiProvider _apiProvider = EmpleadoApiProvider();

  Future<List<EmpleadoModel>> getAllEmpleados() {
    return _apiProvider.getAllEmpleados();
  }

  Future<PersonaModel> authEmpleado(String usuario, String contrasenia) {
    return _apiProvider.authEmpleado(usuario, contrasenia);
  }

  Future<dynamic> putEmpleado(EmpleadoModel empleadoModel, File file) {
    return _apiProvider.putEmpleado(empleadoModel, file);
  }

  Future<dynamic> autenticacionEmpleado(
      String usuario, String contrasenia) async {
    return _apiProvider.autenticacionEmpleado(usuario, contrasenia);
  }

  Future<EmpleadoModel> getEmpleado(int uid) {
    return _apiProvider.getEmpleado(uid);
  }
}
