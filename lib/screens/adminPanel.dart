import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Admin Panel';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPanel(),
    );
  }
}

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  List<String> questions = [
    'What is your favorite color?',
    'How often do you exercise?',
    'Do you prefer cats or dogs?'
  ];

  TextEditingController questionController = TextEditingController();
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    questionController.text = questions.first;
  }

  void addQuestion() {
    setState(() {
      String newQuestion = questionController.text;
      questions.add(newQuestion);
      questionController.text = '';
    });
  }

  void updateQuestion() {
    setState(() {
      String updatedQuestion = questionController.text;
      questions[selectedIndex] = updatedQuestion;
      questionController.text = '';
      selectedIndex = -1;
    });
  }

  void deleteQuestion(int index) {
    setState(() {
      questions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: questionController,
              decoration: InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: selectedIndex != -1 ? updateQuestion : addQuestion,
            child:
                Text(selectedIndex != -1 ? 'Update Question' : 'Add Question'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(questions[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteQuestion(index),
                  ),
                  onTap: () {
                    setState(() {
                      questionController.text = questions[index];
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
