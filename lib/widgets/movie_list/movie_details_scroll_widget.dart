import 'package:flutter/material.dart';

class MovieDetailsScrollWidget extends StatelessWidget {
  const MovieDetailsScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Series Cast'),
        SizedBox(
          height: 200,
          child: Scrollbar(
            child: ListView.builder(
              itemCount: 20,
              itemExtent: 120,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index ){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.green,),
                );
            }),
          ),
        ),
        TextButton(onPressed: (){}, child: Text('Full Cast ')),


      ],),
    );
  }
}