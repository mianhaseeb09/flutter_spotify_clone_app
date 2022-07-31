import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone_app/colors/colors.dart';
import 'package:flutter_spotify_clone_app/screens/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreen();
}

class _RootScreen extends State<RootScreen> {
  int activeTabBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: bottomNavigationBar(),
      body: body(),
    );
  }

  bottomNavigationBar() {
    List items = [Icons.home, Icons.book, Icons.search, Icons.settings];
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: black,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(items.length, (index) {
              return IconButton(
                icon: Icon(
                  items[index],
                  color: activeTabBar == index ? primary : white,
                ),
                onPressed: () {
                  setState(() {
                    activeTabBar = index;
                  });
                },
              );
            })),
      ),
    );
  }

  body() {
    return IndexedStack(
      index: activeTabBar,
      children: const <Widget>[
        HomeScreen(),

        Center(
          child: Text(
            'book',
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            'Search',
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            'Setting',
            style: TextStyle(
                fontSize: 20, color: white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
