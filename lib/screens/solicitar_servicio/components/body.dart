import 'package:flutter/material.dart';

class BodySolicitarServicio extends StatefulWidget {
  const BodySolicitarServicio({Key key}) : super(key: key);

  @override
  _BodySolicitarServicioState createState() => _BodySolicitarServicioState();
}

class _BodySolicitarServicioState extends State<BodySolicitarServicio> {
  bool _isChecked = true;

  List<String> text = ["InduceSmile.com", "Flutter.io", "google.com"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: 'Fecha de encuentro',
                labelText: 'Fecha de encuentro',
              ),
              onSaved: (value) => null,
              validator: (value) => null,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.map),
                hintText: 'Lugar de encuentro',
                labelText: 'Lugar de encuentro',
              ),
              onSaved: (value) => null,
              validator: (value) => null,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock_clock),
                hintText: 'Tiempo total',
                labelText: 'Tiempo Total',
              ),
              onSaved: (value) => null,
              validator: (value) => null,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: text
                      .map((t) => CheckboxListTile(
                            title: Text(t),
                            value: _isChecked,
                            onChanged: (val) {
                              setState(() {
                                _isChecked = val;
                                if (val == true) {}
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
            Text("Total a Pagar: 5000"),
            RaisedButton(
              child: Text("Realizar Pedido"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              textColor: Colors.white,
              color: Colors.green[400],
              elevation: 5.0,
              onPressed: () => null,
            )
          ],
        )),
      ),
    );
  }
}
