import 'package:flutter/material.dart';
import 'package:flutter_application_1/images_file/images_setting.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_class.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: AppImages.moviePicture,
        title: 'Соучастник',
        time: 'April 7, 2024',
        description:
            'Уэйд Уилсон попадает в организацию «Управление временными изменениями», что вынуждает его вернуться к своему альтер-эго Дэдпулу и изменить историю с помощью Росомахи'),
    Movie(
        id: 2,
        imageName: AppImages.moviePicture,
        title: 'Гадкий я',
        time: 'April 7, 2024',
        description:
            'Все стало еще чуть более гадким... Грю сталкивается с новым врагом в лице Максима Ле Маля и его роковой подруги Валентины, в связи с чем семья вынуждена бежать'),
    Movie(
        id: 3,
        imageName: AppImages.moviePicture,
        title: 'Гадкий я',
        time: 'April 7, 2024',
        description:
            'Все стало еще чуть более гадким... Грю сталкивается с новым врагом в лице Максима Ле Маля и его роковой подруги Валентины, в связи с чем семья вынуждена бежать'),
    Movie(
        id: 4,
        imageName: AppImages.moviePicture,
        title: 'Lone Wolves',
        time: 'April 7, 2024',
        description:
            'Пути двух соперничающих чистильщиков пересекаются, когда обоих вызывают решить проблему видного нью-йоркского должностного лица. Впереди насыщенная событиями ночь, в ходе которой им придется забыть о своих мелких обидах и эго, чтобы выполнить работу'),
    Movie(
        id: 5,
        imageName: AppImages.moviePicture,
        title: 'Ворон',
        time: 'April 7, 2024',
        description:
            'Пожертвовав собой, чтобы спасти возлюбленную, Эрик Дрэйвен застревает между мирами живых и мёртвых. Он возвращается с того света, чтобы свести счёты с убийцами. Отныне он — Ворон, жаждущий справедливости, и его месть будет жестока как никогда. '),
    Movie(
        id: 6,
        imageName: AppImages.moviePicture,
        title: 'Не говори никому ',
        time: 'April 7, 2024',
        description:
            'Семья, приглашенная провести выходные в идиллическом загородном доме, превращается из отпуска мечты в психологический кошмар.'),
  ];
  final _searchController = TextEditingController();
  var _filteredMovies = <Movie>[];
  void _seachMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_seachMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('main_screen/movie_details_screen', arguments: id);

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: Offset(0, 2))
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
