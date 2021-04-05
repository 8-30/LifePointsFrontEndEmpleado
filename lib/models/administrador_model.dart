class AdministradorModel {
  int idAdministrador;
  String usuario;
  String contrasena;
  String persona;
//  PersonaModel persona;
  AdministradorModel({
    this.idAdministrador,
    this.usuario,
    this.contrasena,
    this.persona,
  });

  static AdministradorModel fromJson(Map<String, dynamic> json) {
    return AdministradorModel(
      idAdministrador: json['idAdministrador'],
      usuario: json['usuario'],
      contrasena: json['contrasena'],
      persona: json['persona'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idAdministrador": idAdministrador,
        "usuario": usuario,
        "contrasena": contrasena,
        "persona": persona,
      };
}
