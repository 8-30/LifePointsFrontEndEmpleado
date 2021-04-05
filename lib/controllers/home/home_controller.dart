import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/models/usuario_model.dart';
import 'package:life_point/provider/usuario/usuario_repository.dart';
import 'package:life_point/screens/ui.dart';

class HomeController extends GetxController {
  final UsuarioRepository usuarioRepository = UsuarioRepository();
  final userID = GetStorage();
  int currentUserId;
  UsuarioModel currerUserModel;

  @override
  void onInit() {
    currentUserId = userID.read("usuarioID");
    super.onInit();
  }

  @override
  void onReady() {
    getCurrentUser();
    super.onReady();
  }

  void howCurrentUser() {
    Get.snackbar(
        "ID USER AUTENTICADO",
        "HOLA: " +
            currerUserModel.nombre +
            " " +
            currerUserModel.apellido +
            " ID: " +
            currentUserId.toString(),
        icon: Icon(
          Icons.info,
          color: Colors.red,
        ),
        snackPosition: SnackPosition.BOTTOM);
  }

  void logOut() {
    userID.remove("usuarioID").then((value) => Get.offAll(() => LoginUI()));
  }

  void getCurrentUser() async {
    currerUserModel = await usuarioRepository.getCurrentUsuario(currentUserId);
  }

  void updateUsuario(UsuarioModel model) async {
    currerUserModel.nombre = model.nombre;
    currerUserModel.apellido = model.apellido;
    currerUserModel.email = model.email;
    currerUserModel.telefono = model.telefono;
    currerUserModel.credencial = model.credencial;
    currerUserModel.direccion = model.direccion;
    final data = await usuarioRepository.putUsuario(currerUserModel);
    if (!data) {
      Get.snackbar("ERROR", "NO SE PUDO ACTUALIZAR EL USUARIO",
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
