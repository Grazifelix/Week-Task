import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List weeklist = [
      'Segunda',
      'Terça',
      'Quarta',
      'Quinta',
      'Sexta',
      "Sábado",
      "Domingo"
    ];
    bool isListEmpty = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 72, 68, 68),
          title: Center(
              child: Text(
            'Week:Tasks',
            style: TextStyle(
                color: Color.fromARGB(255, 154, 175, 227),
                fontWeight: FontWeight.w500,
                fontSize: 20),
          )),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 154, 175, 227)),
          child: GridView.count(
            padding: EdgeInsets.all(20),
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 17,
            children: <Widget>[
              cardList(weeklist[0], isListEmpty),
              cardList(weeklist[1], isListEmpty),
              cardList(weeklist[2], isListEmpty),
              cardList(weeklist[3], isListEmpty),
              cardList(weeklist[4], isListEmpty),
              cardList(weeklist[5], isListEmpty),
              cardList(weeklist[6], isListEmpty)
            ],
          ),
        ));
  }

  Widget cardList(String weekday, bool isListEmpty) => Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 72, 68, 68),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weekday,
                    style: TextStyle(
                        color: Color.fromARGB(255, 154, 175, 227),
                        fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Color.fromARGB(255, 154, 175, 227),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListItens(isListEmpty)
          ],
        ),
      );

  Widget ListItens(bool isEmpty) {
    if (isEmpty == true) {
      return Container(
          alignment: Alignment.center, child: Text('Nenhuma Tarefa'));
    } else {
      return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(150, 154, 175, 227),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            IconButton(
                onPressed: () => {
                      setState(() => {Icon(Icons.circle)})
                    },
                icon: Icon(
                  Icons.circle_outlined,
                  color: Color.fromARGB(255, 72, 68, 68),
                )),
            Flexible(child: Text('ADICIONANDO NOVO ITEM'))
          ],
        ),
      );
    }
  }
}
