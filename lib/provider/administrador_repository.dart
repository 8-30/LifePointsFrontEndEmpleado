import 'package:life_point_empleado/models/person_model.dart';
import 'package:life_point_empleado/provider/administrador_provider.dart';

class UserRepository {
  AdministradorApiProvider _apiProvider = AdministradorApiProvider();

  Future<PersonaModel> getUser() {
    return _apiProvider.getUser();
  }
}
