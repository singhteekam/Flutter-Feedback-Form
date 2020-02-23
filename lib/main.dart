import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Feedback(),
    );
  }
}
class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Form(
        key: _formKey,
              child: new ListView(
            children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
              labelText: 'Enter your name',
              ),
              validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            ),
            TextFormField(
              decoration: InputDecoration(
              labelText: 'Enter your Email Id'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
              labelText: 'Feedback'
              ),
              validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            ),
            TextFormField(
              decoration: InputDecoration(
              labelText: 'Any Recommendation?'
              ),
            ),
            RaisedButton(
                shape: StadiumBorder(),
                child: Text("Submit"),
                color: Colors.blueAccent,
                onPressed: (){
                  if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Feedback sent Successfully')));
                }
                },
                padding: EdgeInsets.all(10),
              ),
          ]
        ),
      ),
    );
  }
}