import 'package:buscacep/modules/home/models/cep_model.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final CEPModel result;

  const ResultPage({
    super.key,
    required this.result,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildText('CEP: ', widget.result.cep!),
            _buildText('Logradouro: ', widget.result.logradouro!),
            _buildText('Complemento: ', widget.result.complemento!),
            _buildText('Bairro: ', widget.result.bairro!),
            _buildText('Localidade: ', widget.result.localidade!),
            _buildText('UF: ', widget.result.uf!),
            _buildText('IBGE: ', widget.result.ibge!),
            _buildText('Gia: ', widget.result.gia!),
            _buildText('DDD: ', widget.result.ddd!),
            _buildText('Siafi: ', widget.result.siafi!),
          ],
        ),
      ),
    );
  }

  _buildText(String label, String result) {
    const styleLabel = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    const styleResult = TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.blue);

    return Row(
      children: [
        Text(
          label,
          style: styleLabel,
        ),
        Text(
          result,
          style: styleResult,
        ),
      ],
    );
  }
}
