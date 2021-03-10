import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTile extends StatelessWidget {
  final String info;
  final Map link;
  final String date;

  LinkTile({this.info, this.link,this.date});


  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    //print(link);
    return Container(
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data(),
          ),
        ),
      ),
    );
  }

  List<Widget> data(){
    List<Widget> list = List();
    list.add(
    Padding(
      padding: const EdgeInsets.fromLTRB(16,20,16,0),
      child: Container(
        child: Text("About",style: TextStyle(
            fontSize: 32
        ),),
      ),
    ));
    list.add(
      Padding(
      padding: const EdgeInsets.fromLTRB(16,10,16,10),
      child: Container(
      child: Text(addNewLine(info + '\n\nDate: ' +date),style: TextStyle(
      fontSize: 16,fontFamily: 'NunitoSans',
      color: Colors.grey
      ),),
      ),
      ),
    );
    list.add(
    Padding(
    padding: const EdgeInsets.fromLTRB(16,10,16,0),
    child: Container(
    child: link.isNotEmpty? Text("Links",style: TextStyle(
    fontSize: 32
    ),): Container(),
    ),
    ),
    );
    if(link.isNotEmpty) {
      link.forEach((k, v) =>
          list.add(
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Container(
                child: InkWell(
                    child: Text(k, style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlueAccent
                    ),), onTap: () {
                  _launchURL(v);
                }),
              ),
            ),
          )
      );
    }

    return list;
  }
  
  String addNewLine(String str){
    return str.replaceAll(r'\n', '\n');
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}
