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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _textPlayer = '';
  var gabaritoX = [[], [], []];
  var gabaritoY = [[], [], []];
  var jogo = [[], [], []];
  var startJogo = Jogo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startJogo.iniciaLista(jogo, ' ');
    startJogo.iniciaLista(gabaritoX, 'x');
  }

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                VelhaBotao(),
                VelhaBotao(),
                VelhaBotao(),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                VelhaBotao(
                  text: _textPlayer,
                  onPressed: () {
                    setState(() {
                      _textPlayer = 'x';
                      jogo[1][0] = _textPlayer = 'x';
                      startJogo.verificaGanhador(jogo, gabaritoX);
                      print(jogo[0]);
                      print(jogo[1]);
                      print(jogo[2]);
                    });
                  },
                ),
                VelhaBotao(),
                VelhaBotao(),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                VelhaBotao(),
                VelhaBotao(),
                VelhaBotao(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
