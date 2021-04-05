class InsumoModel {
  int idInsumo;
  int idInsumoEmpleado;
  String nombre;
  double tarifa;
  String description;

  InsumoModel({
    this.idInsumo,
    this.idInsumoEmpleado,
    this.nombre,
    this.tarifa,
    this.description,
  });

  static InsumoModel fromJson(Map<String, dynamic> json) {
    return InsumoModel(
      idInsumo: json['idInsumo'],
      idInsumoEmpleado: json['idInsumoEmpleado'],
      nombre: json['nombre'],
      tarifa: json['tarifa'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idInsumo": idInsumo,
        "idInsumoEmpleado": idInsumoEmpleado,
        "nombre": nombre,
        "tarifa": tarifa,
        "description": description,
      };
}
