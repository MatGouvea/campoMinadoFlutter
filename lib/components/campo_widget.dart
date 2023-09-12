// ignore_for_file: use_key_in_widget_constructors

import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final Function(Campo) onAbrir;
  final Function(Campo) onAlternarMarcacao;

  const CampoWidget(
      {required this.campo,
      required this.onAbrir,
      required this.onAlternarMarcacao});

  Widget _getContent() {
    int qtdMinas = campo.qtdMinasVizinhanca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdMinas.jpeg');
    } else if(campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getContent(),
    );
  }
}
