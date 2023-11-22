import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart'; // Import provider package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Geolocator Demo',
      home: ChangeNotifierProvider( // Wrap the root widget with ChangeNotifierProvider
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: 'Flutter Geolocator Demo',
              theme: themeProvider.themeMode == ThemeMode.light
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: MyHomePage(),
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocator Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            LocationPermission permission = await Geolocator.requestPermission();
            Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
            );
            print('User Location: ${position.latitude}, ${position.longitude}');
          },
          child: Text('Get User Location'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle between light and dark mode
          if (Theme.of(context).brightness == Brightness.light) {
            ThemeMode darkMode = ThemeMode.dark;
            Provider.of<ThemeProvider>(context, listen: false).setTheme(darkMode);
          } else {
            ThemeMode lightMode = ThemeMode.light;
            Provider.of<ThemeProvider>(context, listen: false).setTheme(lightMode);
          }
        },
        child: Icon(Icons.brightness_6),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}











/*import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'geolocator',
      theme: ThemeData.light(),
      darkTheme:ThemeData.dark(),
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  late double a;
  late  double b;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('geolocator'), 
      ),
      body: ElevatedButton(
        onPressed: () async {
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          print('User Location: ${position.latitude}, ${position.longitude}');
          setState(() {
            a= position.longitude;
            b=position.latitude;
          }
          );
        }, child: Text('Get User Location')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if(Theme.of(context).brightness == Brightness.light){
            ThemeMode Darkmode = ThemeMode.dark;
            Provider.of<ThemeProvider>(context, listen: false).setTheme(Darkmode);
          }  else {
            ThemeMode lightMode = ThemeMode.light;
            Provider.of<ThemeProvider>(context, listen: false).setTheme(lightMode);
          }
        },
        child: Icon(Icons.brightness_6),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}*/

