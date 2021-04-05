class MensajeModel {
  int idMensaje;
  int idInbox;
  int idEmisor;
  bool estado;
  String texto;

  MensajeModel(
      {this.idMensaje, this.idInbox, this.estado, this.idEmisor, this.texto});

  static MensajeModel fromJson(Map<String, dynamic> json) {
    return MensajeModel(
      idMensaje: json['idMensaje'],
      idInbox: json['idInbox'],
      idEmisor: json['idEmisor'],
      estado: json['estado'],
      texto: json['texto'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idMensaje": idMensaje,
        "idInbox": idInbox,
        "idEmisor": idEmisor,
        "estado": estado,
        "texto": texto,
      };
}
