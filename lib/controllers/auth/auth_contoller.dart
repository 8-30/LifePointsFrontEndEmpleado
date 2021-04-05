import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/controllers/auth/auth.dart';
import 'package:life_point/models/usuario_model.dart';
import 'package:life_point/screens/home/home_ui.dart';
import '../../provider/usuario/usuario_repository.dart';

class AuthController extends GetxController with Auth {
  final usuarioIDStorage = GetStorage();
  UsuarioRepository _usuarioApiProvider = UsuarioRepository();

  UsuarioModel _usuarioModel = UsuarioModel();
  UsuarioModel _userCreatedModel = UsuarioModel();

  RxString dropDownValue = "Masculino".obs;
  RxList<String> addListCategories =
      ["Masculino", "Femenino", "Indefinido"].obs;

  @override
  void onReady() {
    getUserAuth();
    super.onReady();
  }

  void loginButtom() async {
    try {
      final personaModel = await _usuarioApiProvider.authUsuario(
          usernameController.text.trim(), passwordController.text.trim());
      if (personaModel.usuario == usernameController.text.trim()) {
        print("SE AUTENTICO EL SUSAIO: " + personaModel.usuario);
        await usuarioIDStorage.write("usuarioID", personaModel.idPersona);
        Get.offAll(() => HomeUI());
      } else {
        print("no auth");
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
    _usuarioModel.calificacion = "0";
    _usuarioModel.apellido = lastnameController.text;
    _usuarioModel.credencial = ciController.text;
    _usuarioModel.direccion = directionController.text;
    _usuarioModel.email = emailController.text;
    _usuarioModel.foto = "URL PHoto";
    _usuarioModel.genero = dropDownValue.value;
    _usuarioModel.nacimiento = DateTime.now();
    _usuarioModel.nombre = nameController.text;
    _usuarioModel.telefono = phoneNumberController.text;
    _usuarioModel.contrasenia = passwordController.text;
    _usuarioModel.usuario = usernameController.text.trim();
    try {
      _userCreatedModel = await _usuarioApiProvider.postUsuario(_usuarioModel);
      if (_userCreatedModel.idUsuario != null) {
        print("SE CREO USUARIO: " + _userCreatedModel.idUsuario.toString());
        await usuarioIDStorage.write("usuarioID", _userCreatedModel.idUsuario);
        Get.offAll(() => HomeUI());
      } else {
        Get.snackbar(
          "ERROR",
          "usuario no creado",
          icon: Icon(Icons.close),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "No se pudo crear un nuevo usuario",
        icon: Icon(Icons.close),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getUserAuth() {
    int userID = usuarioIDStorage.read("usuarioID");
    print(userID);
    if (userID != null) {
      Get.offAll(() => HomeUI());
    } else {
      print("USUARIO NO AUTENTICADO");
    }
  }
}
