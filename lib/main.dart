import 'package:flutter/material.dart';
import 'package:jogo_da_velha/componentes/velha_botao.dart';

import 'jogo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Jogo da Velha'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _gabaritoP1 = [[], [], []];
  List _gabaritoP2 = [[], [], []];
  List _jogo = [[], [], []];
  Jogo _startJogo = Jogo();
  bool _isPlayerCorent = true;
  String _jogardor = 'Player 1';

  @override
  void initState() {
    super.initState();
    _startJogo.iniciaLista(_jogo, ' ');
    _startJogo.iniciaLista(_gabaritoP1, 'x');
    _startJogo.iniciaLista(_gabaritoP2, 'o');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 375,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/taboleiro.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  VelhaBotao(
                    image: _jogo[0][0],
                    onPressed: () {
                      verificaJogada(0, 0, qualJogador());
                    },
                  ),
                  VelhaBotao(
                    image: _jogo[0][1],
                    onPressed: () {
                      verificaJogada(0, 1, qualJogador());
                    },
                  ),
                  VelhaBotao(
                    image: _jogo[0][2],
                    onPressed: () {
                      verificaJogada(0, 2, qualJogador());
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  VelhaBotao(
                    image: _jogo[1][0],
                    onPressed: () {
                      verificaJogada(1, 0, qualJogador());
                    },
                  ),
                  VelhaBotao(
                    image: _jogo[1][1],
                    onPressed: () {
                      verificaJogada(1, 1, qualJogador());
                    },
                  ),
                  VelhaBotao(
                    image: _jogo[1][2],
                    onPressed: () {
                      verificaJogada(1, 2, qualJogador());
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  VelhaBotao(
                    image: _jogo[2][0],
                    onPressed: () {
                      verificaJogada(2, 0, qualJogador());
                    },
                  ),
                  VelhaBotao(
                    image: _jogo[2][1],
                    onPressed: () {
                      verificaJogada(2, 1, qualJogador());
                    },
                  ),
                  VelhaBotao(
                    image: _jogo[2][2],
                    onPressed: () {
                      verificaJogada(2, 2, qualJogador());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String qualJogador() {
    if (_isPlayerCorent) {
      _isPlayerCorent = false;
      _jogardor = 'Player 1';
      return 'x';
    } else {
      _isPlayerCorent = true;
      _jogardor = 'Player 2';

      return 'o';
    }
  }

  void verificaJogada(int x, int y, String jogada) {
    setState(() {
      _jogo[x][y] = jogada;
      if (_startJogo.verificaGanhador(_jogo, _gabaritoP1) ||
          _startJogo.verificaGanhador(_jogo, _gabaritoP2)) {
        _showDialog(_jogardor);
      }
    });

    print(_jogo[0]);
    print(_jogo[1]);
    print(_jogo[2]);
  }

  void reStart() {
    setState(() {
      _startJogo.limpaLista(_jogo);
    });
  }

  void _showDialog(String jogador) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Ganhador"),
          content: new Text(jogador),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text(
                "Start",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                reStart();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
