import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:life_point/controllers/controllers.dart' show AuthController;
import 'package:life_point/screens/ui.dart';
import 'package:life_point/screens/widgets/TextFormFieldWithIcon.dart';
import 'package:life_point/screens/widgets/avatar.dart';

class BodyLogin extends StatelessWidget {
  final AuthController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Avatar(),
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
                controller: _controller.passwordController,
                iconPrefix: Icons.lock,
                labelText: "Contraseña",
                obscureText: true,
                onSaved: (value) => _controller.passwordController.text = value,
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El campo no puede ser vacio.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "No tienes cuenta? "),
                    WidgetSpan(
                        child: GestureDetector(
                      onTap: () => Get.to(() => RegisterUI()),
                      child: Text(
                        "Crear Cuenta".toLowerCase(),
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 15),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Iniciar sesión".toUpperCase()),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                textColor: Colors.white,
                color: Colors.green[400],
                elevation: 5.0,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _controller.loginButtom();
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
