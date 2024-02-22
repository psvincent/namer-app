// OWN NOTES >>

// For general debugging type 'flutter doctor' in the terminal.
// Can also check the debug console in terminal for any action that is done in the app.
// Example: button pressing.

// To start a stateful hot reload live program >>
// Hot reload means the program will refresh live as soon as the file is saved.
// The state of the app will stay the same with hot reload.
// To run and test program, make sure the correct device is selected in bottom right.
// Then click the play button that says start debugging when hovered in the top right.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Every Flutter App starts with the main() function.
// In this case, all the main function is doing is saying
// I have MyApp, run it. (   runApp(MyApp())   )
void main() {
  runApp(MyApp());
}

// MyApp is a widget. Everything you can see on the screen in Flutter is a Widget.
// Widgets are the elements from which you build every Flutter app. 
// As you can see, even teh app MyApp is a widget.
// MyApp is the widget at the top level of the app. 
// MyApp creates the app-wide state and sets the 'home' widget or starting point of your app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // Every Widget has a build() method.
  // The build() method basically tells Flutter what the widget contains.
  // Tells Flutter what state, theme, title, homepage, etc. of that particular Widget.
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider creates the MyAppState which allows all other widgets to watch if MyAppState ever changes.
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// The MyAppState class defines the app's state.
// MyAppState defines the date the app needs to function.
// Currently it only contains a single variable with the current random word pair.
// There are many powerful ways to manage app state in Flutter.
// One of those ways is ChangeNotifier. 
// The MyAppState class extends ChangeNotifier. 
// This means that it can notify others about its own changes.
// For example, if the current word pair changes, other widgets in the app need to know.
// ChangeNotifier allows other widgets to know when MyAppState changes. 
class MyAppState extends ChangeNotifier {
  // WordPair comes from the english_words library imported at the top.
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This appState variable allows the widget MyHomePage to 'watch' the state of MyApp for any changes.
    // Then it will rebuild this build method every time the MyAppState is updated.
    // So every time the current variable is updated, the widget is rebuilt.
    var appState = context.watch<MyAppState>();

    // Scaffold is a Widget.
    return Scaffold(
      // Column is a layout Widget
      body: Column(
        // child/children are for when you want a layout widget inside of a layout widget (Nesting Widgets)
        children: [
          // Both texts are widgets. 
          Text('A random AWESOME idea:'),
          // This Text widget takes appState and accesses MyAppState which has current in it.
          // So appState -> MyAppState -> current. 
          // It also renders it as lower case.
          // These are the random names that show up.
          Text(appState.current.asLowerCase),
          // First addition, added button.
          // ElevatedButton is a Widget.
          ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            // Child of the ElevatedButton Widget. Puts text in the button.
            child: Text('Next'),
          ),

        ],
      ),
    );
  }
}


















// ORIGINAL FILE CONTENT >>>>>>
// QUAD SLASHES ARE THINGS THAT WERE NOT COMMENTS ORIGINALLY

//// import 'package:flutter/material.dart';

//// void main() {
  //// runApp(const MyApp());
//// }

//// class MyApp extends StatelessWidget {
  //// const MyApp({super.key});

  // This widget is the root of your application.
  //// @override
  //// Widget build(BuildContext context) {
    //// return MaterialApp(
      //// title: 'Flutter Demo',
      //// theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        //// colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //// useMaterial3: true,
      //// ),
      //// home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //// );
  //// }
//// }

//// class MyHomePage extends StatefulWidget {
  //// const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //// final String title;

  //// @override
  //// State<MyHomePage> createState() => _MyHomePageState();
//// }

//// class _MyHomePageState extends State<MyHomePage> {
  //// int _counter = 0;

  //// void _incrementCounter() {
    //// setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //// _counter++;
    //// });
  //// }

  //// @override
  //// Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //// return Scaffold(
      //// appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        //// backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //// title: Text(widget.title),
      //// ),
      //// body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //// child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          //// mainAxisAlignment: MainAxisAlignment.center,
          //// children: <Widget>[
            //// const Text(
              //// 'You have pushed the button this many times:',
            //// ),
            //// Text(
              //// '$_counter',
              //// style: Theme.of(context).textTheme.headlineMedium,
            //// ),
          //// ],
        //// ),
      //// ),
      //// floatingActionButton: FloatingActionButton(
        //// onPressed: _incrementCounter,
        //// tooltip: 'Increment',
        //// child: const Icon(Icons.add),
      //// ), // This trailing comma makes auto-formatting nicer for build methods.
    //// );
  //// }
//// }
