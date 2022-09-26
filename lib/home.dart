import 'package:flutter/material.dart';
import 'ListAllFootbal.dart';
import 'google_classroom/home.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    const Tab(icon: Icon(Icons.sports_basketball_sharp)),
    const Tab(icon: const Icon(Icons.call_outlined)),
    const Tab(icon: Icon(Icons.circle_outlined)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130.0), // here the desired height
          child: AppBar(
            backgroundColor: const Color(0xFF131C3C),
            bottom: TabBar(
              onTap: (index) {
                // Should not used it as it only called when tab options are clicked,
                // not when user swapped
              },
              controller: _controller,
              tabs: list,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.green,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            title: const Text('\n\nFOOTBALL\n',style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),),
            centerTitle: true,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            const ListAllFootbal(),
            const dashboard(),
            Center(
                child: Text(
              _selectedIndex.toString(),
              style: const TextStyle(fontSize: 40),
            )),
          ],
        ),
      ),
    );
  }
}
