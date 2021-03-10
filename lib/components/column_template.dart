import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:asmita_flutter/components/title_card.dart';
import 'package:flutter/material.dart';


class ColumnTemplate extends StatelessWidget {

  final String columnTitle;
  final Widget childWidget;
  Size _size;
  final String image;

  ColumnTemplate({this.columnTitle,this.childWidget,this.image});

  @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: <Widget>[
  //       // TitleCard(),
  //       Expanded(
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Padding(
  //                 padding: EdgeInsets.fromLTRB(8,0,0,0),
  //                 child: TypewriterAnimatedTextKit(
  //                   isRepeatingAnimation: false,
  //                   text:['$columnTitle'],
  //                   textStyle: TextStyle(fontSize: 40.0 ),
  //                 ),
  //               ),
  //               childWidget,
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }


  Widget build(BuildContext context) {
    _size=MediaQuery.of(context).size;
    return SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context,_){
            return [
              SliverAppBar(
                expandedHeight: _size.height*0.30,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.fromLTRB(18, 0, 0, 10),
                    title:
                    TypewriterAnimatedTextKit(
                      isRepeatingAnimation: false,
                      text:['$columnTitle'],
                      textStyle: TextStyle(fontSize: 30.0 ,fontFamily: 'NunitoSans'),
                    ),
                    background: Image.asset(
                      "images/$image",fit: BoxFit.fill,
                    )
              ),
              )
            ];
          },
          body:Column(
            children: [
              childWidget,
            ],
          ),

        )
    );
  }

}
