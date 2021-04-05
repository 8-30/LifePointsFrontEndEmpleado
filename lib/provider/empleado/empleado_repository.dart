import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/provider/empleado/empleado_provider.dart';

class EmpleadoRepository {
  EmpleadoApiProvider _apiProvider = EmpleadoApiProvider();

  Future<List<EmpleadoModel>> getAllEmpleados() {
    return _apiProvider.getAllEmpleados();
  }

  Future<EmpleadoModel> getEmpleado(int uid) {
    return _apiProvider.getEmpleado(uid);
  }
}
