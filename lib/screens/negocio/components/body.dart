import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point_empleado/controllers/auth/auth.dart';
import 'package:life_point_empleado/controllers/controllers.dart';
import 'package:life_point_empleado/models/empleado_model.dart';
import 'package:life_point_empleado/models/insumo_model.dart';
import 'package:life_point_empleado/provider/insumo/insumo_repository.dart';

import 'package:life_point_empleado/screens/widgets/job.dart';

class BodyNegocio extends StatefulWidget {
  const BodyNegocio({Key key}) : super(key: key);

  @override
  _BodyNegocioState createState() => _BodyNegocioState();
}

class _BodyNegocioState extends State<BodyNegocio>
    with SingleTickerProviderStateMixin, Auth {
  bool _status = true;
  bool _statusInsumo = true;
  bool _statusNew = true;
  final _formKey = GlobalKey<FormState>();
  List<InsumoModel> insumos = new List<InsumoModel>();
  int idEmpleado;
  final HomeController _controller = Get.find();
  EmpleadoModel _empleadoModel = EmpleadoModel();
  List<TextEditingController> _insumoControllers =
      new List<TextEditingController>();
  List<int> _idInsumos = new List<int>();
  List<TextEditingController> _precioControllers =
      new List<TextEditingController>();
  TextEditingController _newPrecioController = new TextEditingController();
  TextEditingController _newInsumoController = new TextEditingController();
  InsumoRepository _insumoRepository = InsumoRepository();
  @override
  void initState() {
    idEmpleado = _controller?.currerEmpleadoModel?.idEmpleado;
    nameController.text = _controller?.currerEmpleadoModel?.nombre;
    lastnameController.text = _controller?.currerEmpleadoModel?.apellido;
    emailController.text = _controller?.currerEmpleadoModel?.email;
    phoneNumberController.text = _controller?.currerEmpleadoModel?.telefono;
    ciController.text = _controller?.currerEmpleadoModel?.credencial;
    directionController.text = _controller?.currerEmpleadoModel?.direccion;
    empresaController.text = _controller?.currerEmpleadoModel?.empresa;
    descripcionController.text = _controller?.currerEmpleadoModel?.descripcion;
    tarifaController.text = _controller?.currerEmpleadoModel?.tarifa.toString();
    _cargarInsumos(idEmpleado);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: _formKey,
      child: ListView(
        children: [
          Column(
            children: [
              Job(),
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
                            'Datos de Empleo/Servicio',
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
                                'Descripcion',
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
                                controller: descripcionController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'El campo no puede ser vacio.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Descripcion de tu servicio"),
                                enabled: !_status,
                              ),
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tarifa',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: tarifaController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'El campo no puede ser vacio.';
                              }
                              return null;
                            },
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              hintText: "00.00",
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
                            'Empresa',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            controller: empresaController,
                            decoration: InputDecoration(
                              hintText: "Tu Empresa",
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
                                            _controller
                                                .updateEmpleado(_empleadoModel);
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
                                                _controller?.currerEmpleadoModel
                                                    ?.apellido;
                                            emailController.text = _controller
                                                ?.currerEmpleadoModel?.email;
                                            phoneNumberController.text =
                                                _controller?.currerEmpleadoModel
                                                    ?.telefono;
                                            ciController.text = _controller
                                                ?.currerEmpleadoModel
                                                ?.credencial;
                                            directionController.text =
                                                _controller?.currerEmpleadoModel
                                                    ?.direccion;
                                            empresaController.text = _controller
                                                ?.currerEmpleadoModel?.empresa;
                                            descripcionController.text =
                                                _controller?.currerEmpleadoModel
                                                    ?.descripcion;
                                            tarifaController.text = _controller
                                                ?.currerEmpleadoModel?.tarifa
                                                .toString();
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(' '),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Insumos Extra',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _statusNew & _statusInsumo
                                  ? _getAddIcon()
                                  : Container(),
                              Text(" "),
                              _statusInsumo & _statusNew
                                  ? _getEditIconInsumo()
                                  : Container()
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Insumo',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '        ',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Precio',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: _insumoRepository
                            .getInsumoEmpleado(_controller.currentEmpleadoId),
                        builder: (context,
                            AsyncSnapshot<List<InsumoModel>> snapshot) {
                          if (snapshot.hasData) {
                            _insumoControllers =
                                new List<TextEditingController>();
                            _idInsumos = new List<int>();
                            _precioControllers =
                                new List<TextEditingController>();
                            if (_idInsumos.length < snapshot.data.length) {
                              for (var i = 0; i < snapshot.data.length; i++) {
                                TextEditingController _insumoController =
                                    new TextEditingController();
                                TextEditingController _precioController =
                                    new TextEditingController();
                                _insumoController.text =
                                    snapshot.data[i].nombre;
                                _precioController.text =
                                    snapshot.data[i].tarifa.toString();
                                _idInsumos.add(snapshot.data[i].idInsumo);
                                _insumoControllers.add(_insumoController);
                                _precioControllers.add(_precioController);
                              }
                            }
                          }
                          return snapshot.hasData
                              ? Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: new List.generate(
                                          _idInsumos.length,
                                          (index) => SizedBox(
                                            width: 100.0,
                                            height: 50.0,
                                            child: TextFormField(
                                              controller:
                                                  _insumoControllers[index],
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'El campo no puede ser vacio.';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                hintText: "Insumo",
                                              ),
                                              enabled: !_statusInsumo,
                                              autofocus: !_statusInsumo,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("        "),
                                      Column(
                                        children: new List.generate(
                                          _idInsumos.length,
                                          (index) => SizedBox(
                                            width: 10.0,
                                            height: 50.0,
                                            child: Text(" \$ "),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: new List.generate(
                                          _idInsumos.length,
                                          (index) => SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: TextFormField(
                                              controller:
                                                  _precioControllers[index],
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'El campo no puede ser vacio.';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                hintText: "Precio",
                                              ),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              enabled: !_statusInsumo,
                                              autofocus: !_statusInsumo,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("   "),
                                      _statusNew && _statusInsumo
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: new List.generate(
                                                _idInsumos.length,
                                                (index) => SizedBox(
                                                    width: 20.0,
                                                    height: 50.0,
                                                    child:
                                                        _getDeleteIcon(index)),
                                              ),
                                            )
                                          : Column()
                                    ],
                                  ),
                                )
                              : CircularProgressIndicator();
                        },
                      ),
                      !_statusInsumo
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
                                            for (var i = 0;
                                                i < _idInsumos.length;
                                                i++) {
                                              InsumoModel insumo =
                                                  new InsumoModel(
                                                      idInsumo: _idInsumos[i],
                                                      idInsumoEmpleado:
                                                          idEmpleado,
                                                      nombre:
                                                          _insumoControllers[i]
                                                              .text,
                                                      tarifa: double.parse(
                                                          _precioControllers[i]
                                                              .text),
                                                      descripcion: "Ninguna");
                                              print(i);
                                              _insumoRepository
                                                  .updateInsumo(insumo);
                                            }
                                            _cargarInsumos(idEmpleado);
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
                                          _cargarInsumos(idEmpleado);
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
                      !_statusNew
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 100.0,
                                        height: 50.0,
                                        child: TextFormField(
                                          controller: _newInsumoController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'El campo no puede ser vacio.';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Insumo",
                                          ),
                                          enabled: !_statusNew,
                                          autofocus: !_statusNew,
                                        )),
                                    Text("        "),
                                    SizedBox(
                                      width: 10.0,
                                      height: 50.0,
                                      child: Text(" \$ "),
                                    ),
                                    SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: TextFormField(
                                          controller: _newPrecioController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'El campo no puede ser vacio.';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Precio",
                                          ),
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          enabled: !_statusNew,
                                          autofocus: !_statusNew,
                                        )),
                                  ],
                                ),
                                Padding(
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
                                                _insumoRepository.postInsumo(
                                                    idEmpleado,
                                                    _newInsumoController.text,
                                                    double.parse(
                                                        _newPrecioController
                                                            .text));
                                                _cargarInsumos(idEmpleado);
                                              }
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
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
                                                _statusNew = true;
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                          ),
                                        ),
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.blue,
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

  Widget _getEditIconInsumo() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _statusInsumo = false;
        });
      },
    );
  }

  Widget _getAddIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 14.0,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _statusNew = false;
        });
      },
    );
  }

  Widget _getDeleteIcon(id) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.cancel_outlined,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    RichText(
                      text: new TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          new TextSpan(text: 'Seguro que desea eliminar '),
                          new TextSpan(
                              text: _insumoControllers[id].text,
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new TextSpan(text: ' de su lista de insumos?'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Eliminar'),
                  onPressed: () {
                    _insumoRepository.deleteInsumo(_idInsumos[id]);
                    _cargarInsumos(idEmpleado);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _cargarInsumos(idEmpleado) async {
    insumos = await _insumoRepository
        .getInsumoEmpleado(_controller.currentEmpleadoId);
    if (insumos.length > 0) {
      _insumoControllers = new List<TextEditingController>();
      _idInsumos = new List<int>();
      _precioControllers = new List<TextEditingController>();
      if (_idInsumos.length < insumos.length) {
        for (var i = 0; i < insumos.length; i++) {
          TextEditingController _insumoController = new TextEditingController();
          TextEditingController _precioController = new TextEditingController();
          _insumoController.text = insumos[i].nombre;
          _precioController.text = insumos[i].tarifa.toString();
          _idInsumos.add(insumos[i].idInsumo);
          _insumoControllers.add(_insumoController);
          _precioControllers.add(_precioController);
        }
      }
    }
    setState(() {
      _statusInsumo = true;
      _statusNew = true;
      _newPrecioController = new TextEditingController();
      _newInsumoController = new TextEditingController();
    });
  }
}
