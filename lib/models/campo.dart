import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];
  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    required this.linha,
    required this.coluna,
  });

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) return;

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBombas() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoMarcado = _minado && _marcado;
    bool seguroAberto = !minado && _aberto;
    return minadoMarcado || seguroAberto;
  }

  int get qtdMinasVizinhanca {
    return vizinhos.where((v) => v.minado).length;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((v) => !v._minado);
  }
}
