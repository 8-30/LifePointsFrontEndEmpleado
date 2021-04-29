import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point_empleado/controllers/auth/auth.dart';
import 'package:life_point_empleado/controllers/home/home_binding.dart';
import 'package:life_point_empleado/screens/home/home_ui.dart';
import '../../provider/empleado/empleado_repository.dart';

class AuthController extends GetxController with Auth {
  final empleadoIDStorage = GetStorage();
  EmpleadoRepository _empleadoApiProvider = EmpleadoRepository();

  RxString dropDownValue = "Masculino".obs;
  RxList<String> addListCategories =
      ["Masculino", "Femenino", "Indefinido"].obs;

  RxInt userID = RxInt();
  @override
  void onReady() {
    getUserAuth();
    super.onReady();
  }

  void loginButtom() async {
    try {
      final response = await _empleadoApiProvider.autenticacionEmpleado(
          usernameController.text.trim(), passwordController.text.trim());
      if (response != null) {
        if (response.data["usuario"] == usernameController.text.trim()) {
          usernameController.clear();
          passwordController.clear();
          print("---------AUTENTICACION CORRECTA---------------------");
          userID.value = response.data["idPersona"];
          await empleadoIDStorage.write(
            "empleadoID",
            response.data["idPersona"],
          );
          Get.offAll(() => HomeUI(), binding: HomeBinding());
        } else {
          Get.snackbar(
            "ERROR",
            "USUARIO O CONTRASEÑA INCORRECTOS",
            icon: Icon(Icons.close),
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "USUARIO O CONTRASEÑA INCORRECTOS",
        icon: Icon(Icons.close),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void registerButtom() async {
    print("yea");
  }

  void getUserAuth() {
    userID.value = empleadoIDStorage.read("empleadoID");
    print("Se econtro un usuario: ${userID.value}");
    if (userID.value != null) {
      Get.offAll(() => HomeUI(), binding: HomeBinding());
    } else {
      print("USUARIO NO AUTENTICADO");
    }
  }
}
