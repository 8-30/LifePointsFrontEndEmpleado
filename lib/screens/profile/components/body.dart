import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point/controllers/auth/auth.dart';
import 'package:life_point/controllers/controllers.dart';
import 'package:life_point/models/usuario_model.dart';
import 'package:life_point/screens/widgets/avatar.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key key}) : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile>
    with SingleTickerProviderStateMixin, Auth {
  bool _status = true;
  final HomeController _controller = Get.find();
  UsuarioModel _usuarioModel = UsuarioModel();
  @override
  void initState() {
    nameController.text = _controller?.currerUserModel?.nombre;
    lastnameController.text = _controller?.currerUserModel?.apellido;
    emailController.text = _controller?.currerUserModel?.email;
    phoneNumberController.text = _controller?.currerUserModel?.telefono;
    ciController.text = _controller?.currerUserModel?.credencial;
    directionController.text = _controller?.currerUserModel?.direccion;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              Avatar(),
              Text("¡Hola!"),
              Text(
                _controller?.currerUserModel?.usuario,
                style: TextStyle(fontSize: 20, letterSpacing: 1.5),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 25.0, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Información Personal',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          _status ? _getEditIcon() : Container()
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                'Nombres',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                'Apellidos',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: TextField(
                                controller: nameController,
                                decoration:
                                    InputDecoration(hintText: "Tu Nombre"),
                                enabled: !_status,
                              ),
                            ),
                            flex: 2,
                          ),
                          Flexible(
                            child: TextField(
                              controller: lastnameController,
                              decoration:
                                  InputDecoration(hintText: "Tu Apellido"),
                              enabled: !_status,
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Número de identificación',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: ciController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "178216849683",
                            ),
                            enabled: !_status,
                            autofocus: !_status,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Correo Electronico',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "tucorreo@gmail.com",
                            ),
                            enabled: !_status,
                            autofocus: !_status,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teléfono',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "09999999999",
                            ),
                            enabled: !_status,
                            autofocus: !_status,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dirección',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: directionController,
                            decoration: InputDecoration(
                              hintText: "Tu Dirección",
                            ),
                            enabled: !_status,
                            autofocus: !_status,
                          ),
                        ],
                      ),
                      !_status
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: RaisedButton(
                                        child: Text("Guardar"),
                                        textColor: Colors.white,
                                        color: Colors.green,
                                        onPressed: () {
                                          _usuarioModel.nombre =
                                              nameController.text;
                                          _usuarioModel.apellido =
                                              lastnameController.text;
                                          _usuarioModel.email =
                                              emailController.text;
                                          _usuarioModel.telefono =
                                              phoneNumberController.text;
                                          _usuarioModel.credencial =
                                              ciController.text;
                                          _usuarioModel.direccion =
                                              directionController.text;
                                          _controller
                                              .updateUsuario(_usuarioModel);
                                          setState(() {
                                            _status = true;
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: RaisedButton(
                                        child: Text("Cancelar"),
                                        textColor: Colors.white,
                                        color: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            _status = true;
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
