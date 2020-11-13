import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyWidget extends StatefulWidget{
  @override
  _MyWidgetState createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget>{
  bool _isClicked = false;
  int _clickCounter = 0;
  String _inputText;
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column(children: [
      TextField(
        controller: controller,
        onSubmitted: (String text) {
          print(text);
          setState(() {
            _inputText = text;
          });
        },
        decoration: InputDecoration(
          hintText: "Whatever you want.",
        )
      ),
      Row(children: [
        ElevatedButton(
          child: Text("Show input"),
          onPressed: (){
            setState(() {
              _inputText = controller.text;
            });
            
          },
        ),
        Text("Your input: $_inputText")
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      
      InteractiveViewer(child: 
        Image(
        image: _isClicked ? AssetImage("images/download1.jpg") : AssetImage("images/download.jpg"),
        )
      ),
      Row(children: [
        IconButton(
          icon: _isClicked ? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
          color: Colors.blue,
          // on pressed for icons
          onPressed: (){ 
            setState(() {
              if(_isClicked){
                _isClicked = false;
              } else {
                _isClicked = true;
              }
            });
          }
        ),
        Text(_isClicked ? "Favourited" : "Unfavourited"),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      ),
      Text("This button was clickded $_clickCounter times."),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("Click"),
            color: Colors.green[400],
            // on pressed for click button
            onPressed: (){ 
              setState(() {
                _clickCounter++;
              });
            },
          ),
          RaisedButton( 
            color: Colors.red,
            child: Text("Reset"),
            // on pressed for reset 
            onPressed: (){
              setState(() {
                _clickCounter = 0;
                _isClicked = false;
              });
            }
          ),
        ]
      ) 
      ],
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Button Stuff",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Bar"),
          actions: [
            Text("Action1")
          ],
        ),
        body: SingleChildScrollView(
          // stateful widget plugin
          child: MyWidget(),
        ),
      )
    );
  }
}