import 'package:life_point_empleado/models/insumo_model.dart';
import 'package:life_point_empleado/provider/insumo/insumo_provider.dart';

class InsumoRepository {
  InsumoApiProvider _apiProvider = InsumoApiProvider();

  Future<List<InsumoModel>> getAllInsumos() {
    return _apiProvider.getAllInsumos();
  }

  Future<List<InsumoModel>> getInsumoEmpleado(id) {
    return _apiProvider.getInsumoEmpleado(id);
  }

  Future<InsumoModel> getInsumoid(id) {
    return _apiProvider.getInsumoid(id);
  }

  Future<InsumoModel> postInsumo(idEmpleado, nombre, tarifa) {
    return _apiProvider.postInsumo(idEmpleado, nombre, tarifa);
  }

  void updateInsumo(model) {
    return _apiProvider.updateInsumo(model);
  }
}
