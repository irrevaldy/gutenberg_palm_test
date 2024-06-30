import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gutenberg Palm Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAppExt(),
    );
  }
}

class MyAppExt extends StatefulWidget {
  const MyAppExt({super.key});

  @override
  MyAppExtState createState() => MyAppExtState();
}

class MyAppExtState extends State<MyAppExt> {
  String buttonName = 'Click';
  int currentIndex = 0;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Palm Code'),
        ),
        body: Center(
          child: currentIndex == 0 ? Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange
                  ),
                  onPressed: (){
                    setState(() {
                      buttonName = 'Clicked';
                    });
                  }, 
                  child: Text(buttonName),
                ),
                 ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const NextPage(),
                      ),
                    );
                  }, 
                  child: const Text('Next Page'),
                ),
              ],
            ),
          ) : GestureDetector(
            onTap: () {
              setState(() {
                isClicked = !isClicked;
              });
              },
            child: isClicked ? Image.asset('images/galaxy.jpg') : Image.network('https://images.pexels.com/photos/4994765/pexels-photo-4994765.png'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings)
            )
          ],
          currentIndex: currentIndex,
          onTap: (int index){
            setState(() {
              currentIndex = index;
            });
          },
        ),
      );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}