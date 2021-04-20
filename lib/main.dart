import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
    title: "Primeiro App",
    home: home(),
  ));
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _peopleCount = 0;
  int _limitOfPeoples = 10;
  String _message = "Pode entrar!";

  void _changePeople(int _peopleCount) {
    setState(() {
      this._peopleCount += _peopleCount;
      if (this._peopleCount < 0) {
        _message = "Mundo invertido!";
      } else if (this._peopleCount < _limitOfPeoples) {
        _message = "Pode entrar!";
      } else {
        _message = "Não pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //criação de imagem
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1080,
        ),

        Column(
          //colocar no centro
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Pessoas: $_peopleCount",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                decorationColor: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //controlar espaçamento
                Padding(
                    padding: EdgeInsets.all(30),
                    child: FlatButton(
                        child: Text(
                          "+1",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          _changePeople(1);
                        })),
                Padding(
                    padding: EdgeInsets.all(30),
                    child: FlatButton(
                        child: Text(
                          "-1",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          _changePeople(-1);
                        }))
              ],
            ),
            Text(
              _message,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                decorationColor: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }
}
