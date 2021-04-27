import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point_empleado/controllers/auth/auth.dart';
import 'package:life_point_empleado/controllers/controllers.dart';
import 'package:life_point_empleado/models/empleado_model.dart';
import 'package:life_point_empleado/screens/widgets/avatar.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key key}) : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile>
    with SingleTickerProviderStateMixin, Auth {
  bool _status = true;
  final _formKey = GlobalKey<FormState>();
  final HomeController _controller = Get.find();
  EmpleadoModel _empleadoModel = EmpleadoModel();
  @override
  void initState() {
    nameController.text = _controller?.currerEmpleadoModel?.nombre;
    lastnameController.text = _controller?.currerEmpleadoModel?.apellido;
    emailController.text = _controller?.currerEmpleadoModel?.email;
    phoneNumberController.text = _controller?.currerEmpleadoModel?.telefono;
    ciController.text = _controller?.currerEmpleadoModel?.credencial;
    directionController.text = _controller?.currerEmpleadoModel?.direccion;
    empresaController.text = _controller?.currerEmpleadoModel?.empresa;
    descripcionController.text = _controller?.currerEmpleadoModel?.descripcion;
    tarifaController.text = _controller?.currerEmpleadoModel?.tarifa.toString();
    nombreServicioController.text =
        _controller?.currerEmpleadoModel?.nombreServicio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return SafeArea(
          child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                Avatar(),
                Text("¡Hola!"),
                Text(
                  _controller?.currerEmpleadoModel?.usuario,
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
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'El campo no puede ser vacio.';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      InputDecoration(hintText: "Tu Nombre"),
                                  enabled: !_status,
                                ),
                              ),
                              flex: 2,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: lastnameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'El campo no puede ser vacio.';
                                  }
                                  return null;
                                },
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
                            TextFormField(
                              controller: ciController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'El campo no puede ser vacio.';
                                }
                                return null;
                              },
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
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "tucorreo@gmail.com",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'El campo no puede ser vacio.';
                                }
                                return null;
                              },
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
                            TextFormField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "09999999999",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'El campo no puede ser vacio.';
                                }
                                return null;
                              },
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
                            TextFormField(
                              controller: directionController,
                              decoration: InputDecoration(
                                hintText: "Tu Dirección",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'El campo no puede ser vacio.';
                                }
                                return null;
                              },
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
                                            if (_formKey.currentState
                                                .validate()) {
                                              _empleadoModel.nombre =
                                                  nameController.text;
                                              _empleadoModel.apellido =
                                                  lastnameController.text;
                                              _empleadoModel.email =
                                                  emailController.text;
                                              _empleadoModel.telefono =
                                                  phoneNumberController.text;
                                              _empleadoModel.credencial =
                                                  ciController.text;
                                              _empleadoModel.direccion =
                                                  directionController.text;
                                              _empleadoModel.descripcion =
                                                  descripcionController.text;
                                              _empleadoModel.tarifa =
                                                  double.parse(
                                                      tarifaController.text);
                                              _empleadoModel.empresa =
                                                  empresaController.text;
                                              nombreServicioController
                                                  .text = _empleadoModel
                                                      .nombreServicio =
                                                  nombreServicioController.text;

                                              _controller.updateEmpleado(
                                                  _empleadoModel);
                                              setState(() {
                                                _status = true;
                                              });
                                            }
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
                                              nameController.text = _controller
                                                  ?.currerEmpleadoModel?.nombre;
                                              lastnameController.text =
                                                  _controller
                                                      ?.currerEmpleadoModel
                                                      ?.apellido;
                                              emailController.text = _controller
                                                  ?.currerEmpleadoModel?.email;
                                              phoneNumberController.text =
                                                  _controller
                                                      ?.currerEmpleadoModel
                                                      ?.telefono;
                                              ciController.text = _controller
                                                  ?.currerEmpleadoModel
                                                  ?.credencial;
                                              directionController.text =
                                                  _controller
                                                      ?.currerEmpleadoModel
                                                      ?.direccion;
                                              empresaController.text =
                                                  _controller
                                                      ?.currerEmpleadoModel
                                                      ?.empresa;
                                              descripcionController.text =
                                                  _controller
                                                      ?.currerEmpleadoModel
                                                      ?.descripcion;
                                              tarifaController.text =
                                                  _controller
                                                      ?.currerEmpleadoModel
                                                      ?.tarifa
                                                      .toString();
                                              nombreServicioController.text =
                                                  _controller
                                                      ?.currerEmpleadoModel
                                                      ?.nombreServicio;
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
      ));
    } catch (error) {
      return Center(child: CircularProgressIndicator());
    }
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
