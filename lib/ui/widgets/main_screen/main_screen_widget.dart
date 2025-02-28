
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/data_providers/session_data_provider.dart';
import 'package:flutter_application_1/library/widgets/inherited/inherit_notifier_provider.dart';
import 'package:flutter_application_1/ui/widgets/main_screen/main_screen_model.dart';
import 'package:flutter_application_1/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter_application_1/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:flutter_application_1/ui/widgets/news/new_widget.dart';
import 'package:flutter_application_1/ui/widgets/tv_show_list/tv_show_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  int _selectedTab = 0;
   final movieListModel = MovieListModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();

      movieListModel.loadMovies();
  }


  @override
  Widget build(BuildContext context) {
    final model = InheritedNotifierProvider.read<MainScreenModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
        actions: [
          IconButton(
            onPressed: () => SessionDataProvider().setSessionId(null),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const NewsWidget(),
          InheritedNotifierProvider(model :movieListModel,child: 
           const MovieListWidget()
           ),
          TWShowListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Новости',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Фильмы',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Сериалы',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
