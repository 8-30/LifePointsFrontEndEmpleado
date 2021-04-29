import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point_empleado/controllers/auth/auth.dart';
import 'package:life_point_empleado/controllers/controllers.dart';
import 'package:life_point_empleado/models/empleado_model.dart';
import 'package:life_point_empleado/screens/profile/widgets/upload_logo.dart';

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
  final picker = ImagePicker();
  File imageFile;
  //? Este es el archivo para subir el repositorio de almacenamiento externo
  //? Cuando Guarde de devolver el valor el url de la foto

  EmpleadoModel _empleadoModel = EmpleadoModel();
  @override
  void initState() {
    setValues();
    super.initState();
  }

  void setValues() {
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
  }

  Future<void> pickImage(ImageSource source, BuildContext context) async {
    Navigator.pop(context);
    try {
      final pickedFile = await picker.getImage(source: source);
      File cropped = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.png,
        androidUiSettings: AndroidUiSettings(
          backgroundColor: Colors.white,
        ),
      );
      setState(() {
        imageFile = cropped;
      });
    } catch (e) {
      print(e);
    }
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
                UploadPhoto(
                  photURL: _controller?.currerEmpleadoModel?.foto,
                  image: imageFile,
                  press: () => buildShowMaterialModalBottomSheet(context),
                  enable: _status,
                ),
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
                                                  _empleadoModel, imageFile);
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
                                              _status = true;
                                              setValues();
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

  Future buildShowMaterialModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          child: Row(
        children: [
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.image),
                iconSize: 40.0,
                onPressed: () => pickImage(ImageSource.gallery, context),
              ),
              Text("Galeria"),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.camera),
                iconSize: 40.0,
                onPressed: () => pickImage(ImageSource.camera, context),
              ),
              Text("Camara"),
            ],
          ),
        ],
      )),
    );
  }
}
