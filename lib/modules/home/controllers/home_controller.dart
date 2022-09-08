// ignore_for_file: avoid_print

import '../../database/repositories/cep_repository.dart';
import '../../database/repositories/database_repostory.dart';
import '../models/cep_model.dart';
import '../repositories/home_repository.dart';

class HomeController {
  final CEPRepository _cepRepository;
  final DatabaseRepository _databaseRepository;
  final HomeRepository _homeRepository;

  HomeController(
    this._cepRepository,
    this._homeRepository,
    this._databaseRepository,
  );

  Future getCEPDatabase(String cep) async {
    var address = await _cepRepository.readAddressByCEP(cep);
    if (address == null) {
      print('SEARCHING ONLINE');
      address = await searchCEP(cep);
      await _databaseRepository.create(address);
    }
    return address;
  }

  Future<CEPModel> searchCEP(String cep) async {
    final result = await _homeRepository.search(cep);
    return result;
  }
}
