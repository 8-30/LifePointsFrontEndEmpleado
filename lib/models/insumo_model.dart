class InsumoModel {
  int idInsumo;
  int idInsumoEmpleado;
  String nombre;
  double tarifa;
  String descripcion;

  InsumoModel({
    this.idInsumo,
    this.idInsumoEmpleado,
    this.nombre,
    this.tarifa,
    this.descripcion,
  });

  static InsumoModel fromJson(Map<String, dynamic> json) {
    return InsumoModel(
      idInsumo: json['idInsumo'],
      idInsumoEmpleado: json['idInsumoEmpleado'],
      nombre: json['nombre'],
      tarifa: json['tarifa']?.toDouble(),
      descripcion: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idInsumo": idInsumo,
        "idInsumoEmpleado": idInsumoEmpleado,
        "nombre": nombre,
        "tarifa": tarifa,
        "descripcion": descripcion,
      };
}
