class InboxModel {
  int idInbox;
  String nombre;
  int persona1;
  int persona2;

  InboxModel({this.idInbox, this.persona1, this.persona2, this.nombre});

  static InboxModel fromJson(Map<String, dynamic> json) {
    return InboxModel(
      idInbox: json['idInbox'],
      persona1: json['persona1'],
      persona2: json['persona2'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idInbox": idInbox,
        "persona1": persona1,
        "persona2": persona2,
        "nombre": nombre,
      };
}
