import 'package:flutter/material.dart';
import 'package:weektasks/shared/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = 'home';

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> test = ['Tarefa ', "Tarefa 1", "Tarefa 2"];
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.yellow,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 64, 52, 3),
          title: Text(
            'Week:Task',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Arial',
                color: AppColors.yellow),
          ),
          centerTitle: true,
        ),
        body: GridView.count(
          padding: EdgeInsets.only(top: 58, left: 21, right: 21, bottom: 21),
          crossAxisSpacing: 21,
          crossAxisCount: 2,
          mainAxisSpacing: 21,
          children: <Widget>[
            WeekTasks(
                dayOfWeek: 'Segunda-Feira', tasks: test, context: context),
            WeekTasks(dayOfWeek: 'Terça-Feira', tasks: test, context: context),
            WeekTasks(dayOfWeek: 'Quarta-Feira', tasks: test, context: context),
            WeekTasks(dayOfWeek: 'Quinta-Feira', tasks: test, context: context),
            WeekTasks(dayOfWeek: 'Sexta-feira', tasks: test, context: context),
            WeekTasks(dayOfWeek: 'Sábado', tasks: test, context: context),
            WeekTasks(dayOfWeek: 'Domingo', tasks: test, context: context),
          ],
        ));
  }

  Widget WeekTasks(
      {required String dayOfWeek,
      required List<String> tasks,
      required BuildContext context}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.brown,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 40,
              ),
              Text(dayOfWeek,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
              IconButton(
                  onPressed: () {
                    tasks.add("new Task");
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.add_rounded,
                    color: AppColors.yellow,
                    size: 30,
                  ))
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 8.0, top: 8.0),
                      child: ListTile(
                        iconColor: AppColors.brown,
                        textColor: AppColors.brown,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        contentPadding: EdgeInsets.all(5),
                        tileColor:
                            selected ? AppColors.green : AppColors.yellow,
                        leading: IconButton(
                            icon: selected
                                ? Icon(Icons.circle)
                                : Icon(Icons.circle_outlined),
                            onPressed: () {
                              setState(() {
                                if (selected == false) {
                                  selected = true;
                                } else {
                                  selected = false;
                                }
                              });
                            }),
                        title: Text(
                          tasks[index],
                          style: TextStyle(
                              decoration: selected
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )))
      ]),
    );
  }
}
