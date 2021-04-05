class OrdenModel {
  int idOrden;
  int idOrdenEmpleado;
  DateTime fechaOrden;
  DateTime fechaAgenda;
  String pago;
  String estado;
  String tiempo;
  String total;
  String localizacion;

//  Orden Orden;
  OrdenModel({
    this.idOrden,
    this.idOrdenEmpleado,
    this.fechaOrden,
    this.fechaAgenda,
    this.pago,
    this.estado,
    this.tiempo,
    this.total,
    this.localizacion,
  });

  static OrdenModel fromJson(Map<String, dynamic> json) {
    return OrdenModel(
      idOrden: json['idOrden'],
      idOrdenEmpleado: json['idOrdenEmpleado'],
      fechaOrden: json['fecha_orden'],
      fechaAgenda: json['fecha_agenda'],
      pago: json['pago'],
      estado: json['estado'],
      tiempo: json['tiempo'],
      total: json['total'],
      localizacion: json['localizacion'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idOrden": idOrden,
        "idOrdenEmpleado": idOrdenEmpleado,
        "fecha_orden": fechaOrden,
        "fecha_agenda": fechaAgenda,
        "pago": pago,
        "estado": estado,
        "tiempo": tiempo,
        "total": total,
        "localizacion": localizacion,
      };
}
