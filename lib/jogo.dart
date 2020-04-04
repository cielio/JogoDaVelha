class Jogo {
  void iniciaLista(List lista, String str) {
    for (var i = 0; i < lista.length; i++) {
      lista[i].add(str);
      lista[i].add(str);
      lista[i].add(str);
    }
  }

  void verificaGanhador(var lista1, var lista2) {
    for (var i = 0; i < lista1.length; i++) {
      if (isCollunEqual(lista1, lista2, i) ||
          isRowEqual(lista1, lista2) ||
          isDiagonalEqual(lista1, lista2)) {
        print('Parabens vc ganhou');
        break;
      } else {
        print('Parabens vc Perdeu');
        break;
      }
    }
  }

  bool isRowEqual(var lista1, var lista2) {
    for (var i = 0; i < lista1.length; i++) {
      if (lista1[i] != lista2[i]) {
        return false;
      }
    }
    return true;
  }

  bool isCollunEqual(var lista1, var lista2, var col) {
    for (var x = 0; x < lista1.length; x++) {
      if (lista1[x][col] != lista2[x][col]) {
        return false;
      }
    }

    return true;
  }

  bool isDiagonalEqual(var lista1, var lista2) {
    var vLength = lista1.length - 1;
    for (var x = 0; x < lista1.length; x++) {
      if (lista1[x][x] != lista2[x][x] &&
          lista1[x][vLength] != lista2[x][vLength]) {
        return false;
      }
      vLength--;
    }

    return true;
  }
}
