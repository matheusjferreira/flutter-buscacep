import '../../home/models/cep_model.dart';
import 'database_repostory.dart';

class CEPRepository extends DatabaseRepository {
  Future<CEPModel?> readAddressByCEP(String cep) async {
    var result =
        await read(table: 'Address', field: 'cep', arg: cep);
    if (result == null) return null;
    CEPModel address = CEPModel.fromJson(result);
    return address;
  }
}
