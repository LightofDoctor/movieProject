import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Новости'),
    MovieListWidget(),
    Text('Сериалы'),
  ];
  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TMDB',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (onSelectedTab),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Новости'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Фильмы'),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Сериалы'),
          ]),
    );
  }
}
