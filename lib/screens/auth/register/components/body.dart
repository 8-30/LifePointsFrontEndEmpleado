import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_point/screens/widgets/TextFormFieldWithIcon.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point/controllers/controllers.dart' show AuthController;

class BodyRegister extends StatefulWidget {
  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final AuthController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FormInputFieldWithIcon(
                controller: _controller.nameController,
                iconPrefix: Icons.account_circle,
                labelText: "Nombre",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
                onSaved: (value) => _controller.nameController.text = value,
              ),
              FormInputFieldWithIcon(
                controller: _controller.lastnameController,
                iconPrefix: Icons.account_circle_sharp,
                labelText: "Apellido",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
                onSaved: (value) => _controller.lastnameController.text = value,
              ),
              FormInputFieldWithIcon(
                controller: _controller.usernameController,
                keyboardType: TextInputType.emailAddress,
                iconPrefix: Icons.account_circle,
                labelText: "Nombre de Usuario",
                onSaved: (value) => _controller.usernameController.text = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
              ),
              FormInputFieldWithIcon(
                controller: _controller.emailController,
                iconPrefix: Icons.mail_outline_sharp,
                labelText: "Correo Electronico",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
                onSaved: (value) => _controller.emailController.text = value,
              ),
              FormInputFieldWithIcon(
                controller: _controller.directionController,
                iconPrefix: Icons.map_sharp,
                labelText: "Direccion",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
                onSaved: (value) =>
                    _controller.directionController.text = value,
              ),
              FormInputFieldWithIcon(
                controller: _controller.phoneNumberController,
                iconPrefix: Icons.phone,
                labelText: "Numero Telefonico",
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
                onSaved: (value) =>
                    _controller.phoneNumberController.text = value,
              ),
              FormInputFieldWithIcon(
                controller: _controller.ciController,
                iconPrefix: Icons.card_travel,
                labelText: "Numero de indentificación",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
                onSaved: (value) => _controller.ciController.text = value,
              ),
              Row(
                children: [
                  Text("Genero: "),
                  Obx(
                    () => DropdownButton<String>(
                      value: _controller.dropDownValue.value,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      hint: Text("Seleccione su Genero"),
                      onChanged: (newValue) {
                        _controller.dropDownValue.value = newValue.toString();
                      },
                      items: _controller.addListCategories
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              FormInputFieldWithIcon(
                controller: _controller.passwordController,
                iconPrefix: Icons.lock,
                labelText: "Contraseña",
                obscureText: true,
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
                onSaved: (value) => _controller.passwordController.text = value,
              ),
              RaisedButton(
                child: Text("Crear Cuenta".toUpperCase()),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                textColor: Colors.white,
                color: Colors.green[400],
                elevation: 5.0,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _controller.registerButtom();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
