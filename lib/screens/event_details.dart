import 'package:asmita_flutter/components/link_tile.dart';
import 'package:asmita_flutter/screens/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/organiser_tile.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'pdf_viewer.dart';

class EventDetails extends StatefulWidget {

  final int eventIndex;
  EventDetails(this.eventIndex);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {

  String fixtureUrl='';
  String resultUrl='';
  bool isUrlLoading;
  int pageNumber=0;

  Future<String> fetchPdfUrl() async{
    final _firestore= Firestore.instance;
    // var sport = _firestore.collection('organisers').document(sportsList[widget.eventIndex].name);
    var sport = _firestore.collection('asmita-21').document('events').collection('one').document(sportsList[widget.eventIndex].name);
    var doc = await sport.get();
    setState(() {
      fixtureUrl= doc.data['fixtures'];
      resultUrl=doc.data['results'];
      isUrlLoading=false;
    });
    return fixtureUrl;
  }

  @override
  void initState() {
    super.initState();
    isUrlLoading=true;
    fetchPdfUrl();
  }
  @override
  Widget build(BuildContext context) {
    String eventName=sportsList[widget.eventIndex].name;
    // final controller = PageController();
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(eventName,style: TextStyle(fontSize: 30),))),
              // Flexible(
              //     flex: 1,
              //     child:Padding(
              //         padding:EdgeInsets.all(10),
              //         child: Text(pageNumber==0?'Fixtures':pageNumber==1?'Results':'Organisers', style: TextStyle(fontSize: 22),))),
              Flexible(
                flex: 8,
                // child: PageView(
                //   physics:NeverScrollableScrollPhysics(),
                //   controller: controller,
                //   children: <Widget>[
                //     isUrlLoading?Container():PdfShow(pdfUrl: fixtureUrl??defaultUrl,),
                //     isUrlLoading?Container():PdfShow(pdfUrl: resultUrl??defaultUrl,),
                //     OrganisersList(eventName),
                //   ],
                // ),
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          isScrollable: true,
                          tabs: [
                            Tab(
                              child: Text("Info"),
                            ),
                            Tab(
                              child: Text("Fixtures"),
                            ),
                            Tab(
                              child: Text("Results"),
                            ),
                            Tab(
                              child: Text("Organizers"),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: TabBarView(
                            children: [
                              Info(eventName),
                              isUrlLoading?Container():PdfShow(pdfUrl: fixtureUrl??defaultUrl,),
                              isUrlLoading?Container():PdfShow(pdfUrl: resultUrl??defaultUrl,),
                              OrganisersList(eventName),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
              // Flexible(
              //   flex: 2,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              //         child: RaisedButton(
              //           elevation: 6,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.only(topRight: Radius.circular(32),bottomRight: Radius.circular(32)),),
              //           color: Colors.white,
              //           child: Padding(
              //             padding: EdgeInsets.all(18.0),
              //             child: Icon(Icons.arrow_back,color: Colors.black,),
              //           ),
              //           onPressed: () {
              //             if(pageNumber==1||pageNumber==2)
              //               controller.animateToPage(--pageNumber, duration: Duration(milliseconds: 1500), curve: Curves.linear);
              //             setState(() {
              //             });
              //           },
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              //         child: RaisedButton(
              //           elevation: 6,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.only(topLeft: Radius.circular(32),bottomLeft: Radius.circular(32))),
              //           color: Colors.white,
              //           child: Padding(
              //             padding: EdgeInsets.all(18.0),
              //             child: Icon(Icons.arrow_forward,color: Colors.black,),
              //           ),
              //           onPressed: () {
              //             if(pageNumber==0||pageNumber==1)
              //               controller.animateToPage(++pageNumber, duration: Duration(milliseconds: 1500), curve: Curves.linear);
              //               //controller.jumpToPage(++pageNumber);
              //             setState(() {
              //             });
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // )

            ],
          ),
        ));
  }
}


class Info extends StatefulWidget{
  final String eventName;
  Info(this.eventName);

  @override
  _InfoState createState() => _InfoState();


}

class _InfoState extends State<Info>{
  bool loadLinkList;
  String eventName;
  String info,link;

  @override
  void initState() {
    super.initState();
    eventName=widget.eventName;
    loadLinkList=true;
    fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchInfo(),
        builder: (context,snap){
          if(!snap.hasData){
            return Center(
              child: CircularProgressIndicator(

              ),
            );
          }
          return Container(
            child: LinkTile(info: snap.data['info'],link: snap.data['link'],date: snap.data['date'],),
          );
        },
      )
    );
  }

  Future fetchInfo() async {
    final _firestore= Firestore.instance;
    var sport = _firestore.collection('asmita-21').document('events').collection('one').document(eventName);
    // var sport = _firestore.collection('organisers').document(widget.eventName);
    var doc = await sport.get();
    return doc;
    // info=doc.data['info'];
    // link=doc.data['link'];
  }
}


class OrganisersList extends StatefulWidget {
  final String eventName;
  OrganisersList(this.eventName);

  @override
  _OrganisersListState createState() => _OrganisersListState();
}

class _OrganisersListState extends State<OrganisersList> {

  bool loadOrganisersList;
  String eventName;

  List<OrganiserTile> organisersList = [];

  @override
  void initState() {
    super.initState();
    loadOrganisersList=true;
    eventName=widget.eventName;
    fetchOrganisersData();
  }

  @override
  Widget build(BuildContext context) {
    eventName=widget.eventName;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loadOrganisersList ,
        child: Container(
          child: ListView.builder(
            itemCount: organisersList.length,
            itemBuilder: (BuildContext context,int index){
              return organisersList[index];
            },
          ),
        ),
      ),
    );
  }

  void fetchOrganisersData() async {
    final _firestore= Firestore.instance;
    print(eventName);
    var sport = _firestore.collection('asmita-21').document('events').collection('one').document(eventName);
    var doc = await sport.get();
    //int numberOfOrganisers = doc.data['numberOfOrganizers'];
    //print(numberOfOrganisers);

    String name,phone,imageUrl,designation;

    await sport.collection('organisers').getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((organiser) {name=organiser.documentID;
          phone=organiser.data['mobile']??'Phone Unknown';
          imageUrl=organiser.data['url']??'Image Unknown';
          designation='Executive';
          if(name!=null)
            organisersList.add(OrganiserTile(name:name,imageUrl: imageUrl,designation: designation,phoneNumber: phone,));
      });});

    setState(() {
      loadOrganisersList=false;
    });
  }
}

