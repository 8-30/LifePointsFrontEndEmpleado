import 'package:life_point/models/person_model.dart';
import 'package:life_point/models/usuario_model.dart';
import 'usuario_provider.dart';

class UsuarioRepository {
  UsuarioApiProvider _apiProvider = UsuarioApiProvider();

  Future<UsuarioModel> postUsuario(UsuarioModel usuarioModel) {
    return _apiProvider.postUsuario(usuarioModel);
  }

  Future<PersonaModel> authUsuario(String usuario, String contrasenia) {
    return _apiProvider.authUsuario(usuario, contrasenia);
  }

  Future<UsuarioModel> getCurrentUsuario(int uid) {
    return _apiProvider.getCurrentUsuario(uid);
  }

  Future<dynamic> putUsuario(UsuarioModel usuarioModel) {
    return _apiProvider.putUsuario(usuarioModel);
  }
}
