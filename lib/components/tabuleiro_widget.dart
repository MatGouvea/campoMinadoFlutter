// ignore_for_file: use_key_in_widget_constructors

import 'package:campo_minado/components/campo_widget.dart';
import 'package:flutter/material.dart';
import '../models/campo.dart';
import '../models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final Function(Campo) onAbrir;
  final Function(Campo) onAlternarMarcacao;

  const TabuleiroWidget(
      {required this.tabuleiro,
      required this.onAbrir,
      required this.onAlternarMarcacao});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
          crossAxisCount: tabuleiro.colunas,
          children: tabuleiro.campos.map((c) {
            return CampoWidget(
              campo: c,
              onAbrir: onAbrir,
              onAlternarMarcacao: onAlternarMarcacao,
            );
          }).toList()),
    );
  }
}
