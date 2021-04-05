import 'package:flutter/material.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/provider/empleado/empleado_repository.dart';
import 'package:life_point/screens/home/components/widgets/card_presentatio.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  EmpleadoRepository _empleadoRepository = EmpleadoRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: FutureBuilder(
            future: _empleadoRepository.getAllEmpleados(),
            builder: (context, AsyncSnapshot<List<EmpleadoModel>> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return CardPresentation(
                          empleado: snapshot.data[index],
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
