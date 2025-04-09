
import 'package:flutter/material.dart';
import 'package:flutter_application_1/library/widgets/inherited/inherit_notifier_provider.dart';
import 'package:flutter_application_1/ui/widgets/movie_details/movie_detail_model.dart';
import 'package:flutter_application_1/ui/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:flutter_application_1/ui/widgets/movie_details/movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {


  MovieDetailsWidget({
    Key? key,
   
  }) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();

}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            const MovieDetailsMainInfoWidget(),
            const SizedBox(height: 30),
            const MovieDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}


class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = InheritedNotifierProvider.watch<MovieDetailsModel>(context);
    return Text(model?.movieDetails?.title ?? 'Download');
  }
}
