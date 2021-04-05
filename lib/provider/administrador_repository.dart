import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/administrador_provider.dart';

class UserRepository {
  AdministradorApiProvider _apiProvider = AdministradorApiProvider();

  Future<PersonaModel> getUser() {
    return _apiProvider.getUser();
  }
}
