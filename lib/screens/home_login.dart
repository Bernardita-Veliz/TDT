import 'package:flutter/material.dart';
import 'package:tdt2/screens/first_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fourth_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() {
  runApp(MyApp());
}

class loginHomePage extends StatefulWidget {
  static const routeName = '/home-login';

  _loginHomeState createState() => _loginHomeState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      home: Home(title: 'login'),
    );
  }
}

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _loginHomeState createState() => _loginHomeState();
}

class _loginHomeState extends State<loginHomePage> {
  bool isSurvey1Completed = false;
  bool isSurvey2Completed = false;
  bool isSurvey3Completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Asignaturas',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildFloatingActionButton(
                  "Base de datos",
                  Icons.add,
                  () {
                    if (!isSurvey1Completed) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SurveyPageState()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Encuesta respondida'),
                          content: Text('La encuesta ya ha sido respondida.'),
                          actions: [
                            TextButton(
                              child: Text('Cerrar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  isSurvey1Completed,
                ),
                buildFloatingActionButton(
                  "Auditoria de sistemas",
                  Icons.add,
                  () {
                    if (!isSurvey2Completed) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Survey2PageState()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Encuesta respondida'),
                          content: Text('La encuesta ya ha sido respondida.'),
                          actions: [
                            TextButton(
                              child: Text('Cerrar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  isSurvey2Completed,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildFloatingActionButton(
                  "Programación II",
                  Icons.add,
                  () {
                    if (!isSurvey3Completed) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Survey3PageState()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Encuesta respondida'),
                          content: Text('La encuesta ya ha sido respondida.'),
                          actions: [
                            TextButton(
                              child: Text('Cerrar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  isSurvey3Completed,
                ),
                buildFloatingActionButton(
                  "Proyectos informáticos",
                  Icons.add,
                  () {
                    // Código para el botón 4
                  },
                  true, // Desactivado por defecto
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildFloatingActionButton(
                  "Inglés IV",
                  Icons.add,
                  () {
                    // Código para el botón 5
                  },
                  true, // Desactivado por defecto
                ),
                buildFloatingActionButton(
                  "Electivo de ética",
                  Icons.add,
                  () {
                    // Código para el botón 6
                  },
                  true, // Desactivado por defecto
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingActionButton(
      String label, IconData icon, VoidCallback onPressed, bool isDisabled) {
    return Expanded(
      child: FloatingActionButton.extended(
        heroTag: label,
        onPressed: isDisabled ? null : onPressed,
        label: Text(label),
        icon: Icon(icon),
        backgroundColor: isDisabled ? Colors.grey : null,
      ),
    );
  }
}
