import 'package:flutter_modular/flutter_modular.dart';

import 'pages/result_page.dart';

class ResultModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => ResultPage(result: args.data['result'])),
      ];
}
