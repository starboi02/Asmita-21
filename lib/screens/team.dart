import 'package:asmita_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:asmita_flutter/components/column_template.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColumnTemplate(
        image: "team2.jpeg",
        columnTitle: 'Team',
        childWidget: Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: teamMembersList.length,
              itemBuilder: (BuildContext context,index){
                return teamMembersList[index];
              },
            ),
          ),
        ),
      ),
    );
  }
}
