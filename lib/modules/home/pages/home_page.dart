import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/core/app_theme.dart';
import '../../../shared/core/change_theme.dart';
import '../controllers/home_controller.dart';
import '../models/cep_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();
  final controller = Modular.get<HomeController>();
  CEPModel? cepModel;

  bool _darkMode = false;
  final IconData _iconLight = Icons.wb_sunny;
  final IconData _iconDark = Icons.nights_stay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscacep'),
        actions: [
          IconButton(
              onPressed: () {
                ChangeTheme.of(context)!.streamController.add(_darkMode
                    ? AppTheme.lightTheme.getTheme
                    : AppTheme.darkTheme.getTheme);
                setState(() {
                  _darkMode = !_darkMode;
                });
              },
              icon: Icon(_darkMode ? _iconDark : _iconLight))
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Bem vindo!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Busque o cep desejado digitando a baixo seu valor e pressionando o botão.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 104),
                TextFormField(
                  controller: _cepController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String cepWithMask =
                          '${_cepController.text.substring(0, 5)}-${_cepController.text.substring(5, 8)}';

                      final data =
                          await controller.getCEPDatabase(cepWithMask).onError(
                                (error, stackTrace) => _buildSnackBar(
                                  context,
                                  'Servidor indisponível. Tente novamente mais tarde.',
                                ),
                              );

                      data.cep != null
                          ? _buildNextPage(data)
                          : Future.delayed(const Duration(milliseconds: 50))
                              .then(
                              (value) => _buildSnackBar(context,
                                  'Cep não encontrado ou não existe...'),
                            );
                    }
                  },
                  child: const Text('Pesquisar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildNextPage(data) {
    setState(() {
      cepModel = data;
    });
    Modular.to.pushNamed('/result/', arguments: {'result': cepModel});
  }

  _buildSnackBar(context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade300,
      ),
    );
  }
}
