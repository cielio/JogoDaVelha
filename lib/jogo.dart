class Jogo {
  void iniciaLista(List lista, String str) {
    for (var i = 0; i < lista.length; i++) {
      lista[i].add(str);
      lista[i].add(str);
      lista[i].add(str);
    }
  }

  void limpaLista(List lista) {
    for (var x = 0; x < lista.length; x++) {
      for (var y = 0; y < lista.length; y++) {
        lista[x][y] = " ";
      }
    }
  }

  bool verificaGanhador(List lista1, List lista2) {
    for (var i = 0; i < lista1.length; i++) {
      var tempLista1 = lista1[i];
      var tempLista2 = lista2[i];
      if (isCollunEqual(lista1, lista2, i) ||
          isRowEqual(tempLista1, tempLista2) ||
          isDiagonalEqual(lista1, lista2)) {
        return true;
      }
    }
    return false;
  }

  bool isRowEqual(List lista1, List lista2) {
    bool islinhaUm = lista1[0] == lista2[0];
    bool islinhaDois = lista1[1] == lista2[1];
    bool islinhaTres = lista1[2] == lista2[2];

    if (islinhaUm && islinhaDois && islinhaTres) {
      return true;
    }

    return false;
  }

  bool isCollunEqual(List lista1, List lista2, int col) {
    for (var x = 0; x < lista1.length; x++) {
      if (lista1[x][col] != lista2[x][col]) {
        return false;
      }
    }

    return true;
  }

  bool isDiagonalEqual(List lista1, List lista2) {
    for (var x = 0; x < lista1.length; x++) {
      if (isDiagonalSup(lista1, lista2) == isDiagonalInf(lista1, lista2)) {
        return false;
      }
    }

    return true;
  }

  bool isDiagonalSup(List lista1, List lista2) {
    for (var x = 0; x < lista1.length; x++) {
      if (lista1[x][x] != lista2[x][x]) {
        return false;
      }
    }

    return true;
  }

  bool isDiagonalInf(List lista1, List lista2) {
    var vLength = lista1.length - 1;
    for (var x = 0; x < lista1.length; x++) {
      if (lista1[x][vLength] != lista2[x][vLength]) {
        return false;
      }
      vLength--;
    }

    return true;
  }
}
