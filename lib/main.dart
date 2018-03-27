import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Dash.dart' as dash;
import 'Meet.dart' as meet;
import 'Message.dart' as message;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Fitness Buddy",
          style: new TextStyle(
            color: Colors.black,
            fontFamily: "Rock Salt",
            fontSize: 30.0
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.dashboard)),
            new Tab(icon: new Icon(Icons.people_outline)),
            new Tab(icon: new Icon(CupertinoIcons.conversation_bubble)),
          ],
          unselectedLabelColor: CupertinoColors.inactiveGray,
          labelColor: CupertinoColors.activeBlue,
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new dash.Dash(),
          new meet.Meet(),
          new MaterialApp(
          title: 'My app', // used by the OS task switcher
          home: new message.MyScaffold(),
          )
        ]
      )
    );
  }
}
