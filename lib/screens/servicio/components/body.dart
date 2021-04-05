import 'package:flutter/material.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/insumo_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/empleado/empleado_repository.dart';
import 'package:life_point/provider/insumo/insumo_repository.dart';
import 'package:life_point/screens/servicio/components/widgets/card_presentatio.dart';

class ServicioBody extends StatefulWidget {
  final PersonaModel persona;
  ServicioBody({Key key, this.persona}) : super(key: key);

  @override
  _ServicioBodyState createState() => _ServicioBodyState(persona);
}

class _ServicioBodyState extends State<ServicioBody> {
  final PersonaModel persona;
  _ServicioBodyState(this.persona);
  InsumoRepository _insumoRepository = InsumoRepository();
  EmpleadoRepository _empleadoRepository = EmpleadoRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: FutureBuilder(
            future: _empleadoRepository.getEmpleado(persona.idPersona),
            builder: (context, AsyncSnapshot<EmpleadoModel> snapshot1) {
              return snapshot1.hasData
                  ? FutureBuilder(
                      future: _insumoRepository
                          .getInsumoEmpleado(persona.idPersona),
                      builder: (context,
                          AsyncSnapshot<List<InsumoModel>> snapshot2) {
                        return snapshot2.hasData
                            ? CardPresentation(
                                persona: snapshot1.data.persona,
                                empleado: snapshot1.data,
                                insumos: snapshot2.data,
                              )
                            : CircularProgressIndicator();
                      },
                    )
                  : CircularProgressIndicator();
            },
          )),
    );
  }
}
