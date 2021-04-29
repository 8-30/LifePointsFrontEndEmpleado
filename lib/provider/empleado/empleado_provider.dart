import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:life_point_empleado/models/person_model.dart';
import 'package:life_point_empleado/models/empleado_model.dart';

class EmpleadoApiProvider {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final String _endpoint = "http://lifepoints.herokuapp.com/api/empleado/";
  final Dio _dio = Dio();

  Future<PersonaModel> authEmpleado(String usuario, String contrasenia) async {
    try {
      Response response =
          await _dio.get(_endpoint + "username/$usuario/password/$contrasenia");
      return PersonaModel.fromJson(response.data['persona']);
    } catch (error) {
      print("Exception occured: $error ");
      return null;
    }
  }

  Future<List<EmpleadoModel>> getAllEmpleados() async {
    List<EmpleadoModel> empleadoList = List<EmpleadoModel>();
    try {
      Response response = await _dio.get(_endpoint);
      print(response.data["empleados"]);
      for (var data in response.data["empleados"]) {
        empleadoList.add(EmpleadoModel.fromJson(data));
      }
      return empleadoList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<dynamic> autenticacionEmpleado(
      String usuario, String contrasenia) async {
    try {
      Response response = await _dio.post(_endpoint + "/autenticacion",
          data: {"usuario": usuario, "contrasenia": contrasenia});
      print(response.data["idPersona"]);
      return response;
    } catch (error) {
      print("Exception occured: $error ");
      return null;
    }
  }

  Future<EmpleadoModel> getEmpleado(int uid) async {
    print(_endpoint + uid.toString());
    try {
      Response response = await _dio.get(_endpoint + uid.toString());
      return EmpleadoModel.fromJson(response.data['empleado']);
    } catch (error) {
      print("Exception occured: $error");
      return null;
    }
  }

  Future<dynamic> putEmpleado(EmpleadoModel model, File file) async {
    try {
      if (file != null) {
        print("AQUI ESTOY");
        model.foto = await uploadImage(file, model.usuario);
      }
      print(model.toJson());
      Response response = await _dio
          .put(_endpoint + model.idEmpleado.toString(), data: model.toJson());
      return response.data;
    } catch (error) {
      print("Exception occured: $error");
      return null;
    }
  }

  Future<dynamic> uploadImage(File file, String userName) async {
    return await firebaseStorage
        .ref()
        .child("empleado")
        .child(userName)
        .child('${basename(userName)}')
        .putFile(file)
        .then((value) {
      return value.ref.getDownloadURL();
    });
  }
}
