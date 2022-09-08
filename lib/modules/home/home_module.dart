import 'package:flutter_modular/flutter_modular.dart';

import '../database/repositories/cep_repository.dart';
import 'controllers/home_controller.dart';
import 'pages/home_page.dart';
import 'repositories/home_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => CEPRepository()),
        Bind((i) => HomeController(i(), i(), i())),
        Bind((i) => HomeRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
