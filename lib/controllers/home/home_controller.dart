import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point_empleado/models/empleado_model.dart';
import 'package:life_point_empleado/provider/empleado/empleado_repository.dart';
import 'package:life_point_empleado/screens/ui.dart';

class HomeController extends GetxController {
  final EmpleadoRepository empleadoRepository = EmpleadoRepository();
  final empleadoID = GetStorage();
  int currentEmpleadoId;
  EmpleadoModel currerEmpleadoModel;

  @override
  void onReady() {
    getCurrentEmpleado();
    super.onReady();
  }

  void howCurrentEmpleado() {
    Get.snackbar(
        "ID USER AUTENTICADO",
        "HOLA: " +
            currerEmpleadoModel.nombre +
            " " +
            currerEmpleadoModel.apellido +
            " ID: " +
            currentEmpleadoId.toString(),
        icon: Icon(
          Icons.info,
          color: Colors.red,
        ),
        snackPosition: SnackPosition.BOTTOM);
  }

  void handleAuthChanged(_userID) async {
    print("Home ever uid: $_userID");
    if (_userID != null)
      currerEmpleadoModel = await empleadoRepository.getEmpleado(_userID);
  }

  void logOut() {
    empleadoID
        .remove("empleadoID")
        .then((value) => Get.offAll(() => LoginUI()));
  }

  void getCurrentEmpleado() async {
    currentEmpleadoId = await empleadoID.read("empleadoID");
    currerEmpleadoModel =
        await empleadoRepository.getEmpleado(currentEmpleadoId);
  }

  void updateEmpleado(EmpleadoModel model, File file) async {
    currerEmpleadoModel.nombre = model.nombre;
    currerEmpleadoModel.apellido = model.apellido;
    currerEmpleadoModel.email = model.email;
    currerEmpleadoModel.telefono = model.telefono;
    currerEmpleadoModel.credencial = model.credencial;
    currerEmpleadoModel.direccion = model.direccion;
    currerEmpleadoModel.descripcion = model.descripcion;
    currerEmpleadoModel.nombreServicio = model.nombreServicio;
    currerEmpleadoModel.empresa = model.empresa;
    currerEmpleadoModel.tarifa = model.tarifa;
    final data =
        await empleadoRepository.putEmpleado(currerEmpleadoModel, file);
    if (data == null) {
      Get.snackbar("ERROR", "NO SE PUDO ACTUALIZAR EL USUARIO",
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
    print(data);
  }
}
