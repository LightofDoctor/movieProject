import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/movie_list/radial_percent_widget.dart';
import 'package:flutter_application_1/widgets/top_poster_widget.dart';

class MovieDetailsInfoWidget extends StatelessWidget {
  const MovieDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopPosterWidget(),
        _ScoreWidget(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _MovieNameWidget(),
        ),
        _DataFilmWidget(),
        OtherText(),
        Padding(
          padding: const EdgeInsets.all(7),
          child: _DescriptionWidget(),
        ),
        SizedBox(
          height: 20,
        ),
        _PeopleWidget(),
       
      ],
    );
  }
}

class OtherText extends StatelessWidget {
  const OtherText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Обзор',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(children: [
        TextSpan(
            text: 'Дэдпул и Росомаха ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            )),
        TextSpan(
            text: '(2024)',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400))
      ]),
    );
  }
}

class _DataFilmWidget extends StatelessWidget {
  const _DataFilmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
      child: Text('18+ 25/07/2024 (UA) 2h 8m боевик,комедия,фантастика',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white)),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Уэйд Уилсон попадает в организацию «Управление временными изменениями», что вынуждает его вернуться к своему альтер-эго Дэдпулу и изменить историю с помощью Росомахи.',
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
        ));
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: RadialPercentWidget(
                    child: Text('77'),
                    percent: 0.77,
                    fillColor: Color.fromARGB(255, 10, 23, 25),
                    lineColor: Color.fromARGB(255, 37, 203, 103),
                    freeColor: Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'User Score',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            )),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.play_arrow),
                Text(
                  'Play Trailer',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            )),
      ],
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _textStyle1 = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white);
    final _textStyle2 = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Шон Леви',
                  style: _textStyle1,
                ),
                Text(
                  'Director, Writer',
                  style: _textStyle2,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Herb Trimpe',
                  style: _textStyle1,
                ),
                Text(
                  'Characters',
                  style: _textStyle2,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
