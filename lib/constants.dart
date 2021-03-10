//any constant declared in the project will have to be refactored here
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/sport_tile.dart';
import 'components/organiser_tile.dart';

TextStyle kOptionStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

List<Widget> teamMembersList = [
  ListTile(
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(
        'https://user-images.githubusercontent.com/58038202/106729758-deaa4c80-6633-11eb-828f-04e5f4109d29.jpeg',
      ),
    ),
    title: Text('Dr. Suneel Yadav'),
    subtitle: Text('Faculty In-Charge'),
    trailing: FlatButton(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.email),
        ),
      ),
      onPressed: () async {
        var url =
            'mailto:fi.sports@iiita.ac.in?subject=Regarding Asmita\'21 &body= ';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    ),
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/harsh_bhardwaj.jpg',
    name: 'Harsh Bhardwaj',
    designation: 'President',
    phoneNumber: '9521207027',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/sahil_udaya_singh.jpg',
    name: 'Sahil Udayasingh',
    designation: 'General Secretary',
    phoneNumber: '9205177057',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/pranjalmaurya.jpg',
    name: 'Pranjal Maurya',
    designation: 'Sports Secretary',
    phoneNumber: '7455024017',
  ),
  OrganiserTile(
    imageUrl:
        'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/shivamkumar.jpg',
    name: 'Shivam Kumar',
    designation: 'Festival Coordinator',
    phoneNumber: '9027251768',
  ),
  OrganiserTile(
    imageUrl:
        'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/vedprakashverma.jpg',
    name: 'Ved Prakash Verma',
    designation: 'Festival Coordinator',
    phoneNumber: '9571135661',
  ),
  OrganiserTile(
    imageUrl:
        'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/swarnamsinha.jpg',
    name: 'Swarnam Sinha',
    designation: 'Head, Public Relations',
    phoneNumber: '9661832455',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/PRABHA_KUMARI.jpg',
    name: 'Prabha Kumari',
    designation: 'Head, Media & Publicity',
    phoneNumber: '7206893827',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/jyotiahari.jpg',
    name: 'Jyoti Ahari',
    designation: 'Head, Media & Publicity',
    phoneNumber: '9001091466',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/milan_bhuva.jpg',
    name: 'Milan Ashvinbhai Bhuva',
    designation: 'Head, Hospitality & Travels',
    phoneNumber: '7487945394',
  ),
  OrganiserTile(
    imageUrl: 'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/pujakumari.jpg',
    name:'Puja Kumari',
    designation: 'Head, Hospitality & Travels',
    phoneNumber: '6376488010',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/mohammedaadil.jpg',
    name: 'Mohammed Aadil',
    designation: 'Head, Registration',
    phoneNumber: '7749045395',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/rohithmone.jpg',
    name: 'Rohith Mone',
    designation: 'Head, Registration',
    phoneNumber: '9381567940',
  ),
  OrganiserTile(
    imageUrl:
    'https://drive.google.com/uc?export=view&id=1FX3HBdmX2rXyCpvl3Lls39vUDxJno8ZN',
    name: 'Husandeep Singh',
    designation: 'Head, Creatives',
    phoneNumber: '9877133818',
  ),
  OrganiserTile(
    imageUrl:
    'https://drive.google.com/uc?export=view&id=1GaDIqZSxI_-3Ukzsy12Jx-ptH8gxeVj1',
    name: 'Onkar Telange',
    designation: 'Head, Filming',
    phoneNumber: '7972930563',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/tushar_singh_parte.jpg',
    name: 'Tushar Singh Parte',
    designation: 'Head, Web Operations',
    phoneNumber: '8400972421',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/ritik_harchani.jpg',
    name: 'Ritik Harchani',
    designation: 'Head, App Operations',
    phoneNumber: '9598227422',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/raushan.jpeg',
    name: 'Raushan Raj',
    designation: 'Head, Sponsorship & Marketing',
    phoneNumber: '9122428601',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/manish-tomar.jpeg',
    name: 'Manish Tomar',
    designation: 'Head, Events & Management',
    phoneNumber: '6397949388',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/vasugupta.jpg',
    name: 'Vasu Gupta',
    designation: 'Public Relations',
    phoneNumber: '8858079808',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/yash.jpg',
    name: 'Yash Kamlaskar',
    designation: 'Public Relations',
    phoneNumber: '7378873445',
  ),
  OrganiserTile(
    imageUrl:
        'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/PrabhnoorSingh.jpg',
    name: 'Prabhnoor Singh',
    designation: 'Sponsorship & Marketing',
    phoneNumber: '9660720117',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/ritukiranmurmu.jpg',
    name: 'Ritu Kiran Murmu',
    designation: 'Sponsorship & Marketing',
    phoneNumber: '7979007562',
  ),
  OrganiserTile(
    imageUrl:
    'https://user-images.githubusercontent.com/58038202/106729552-9b4fde00-6633-11eb-855d-e3b18e41415f.jpeg',
    name: 'Ashish Tyagi',
    designation: 'Events & Management',
    phoneNumber: '7818896250',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/biswajeet_das.jpg',
    name: 'Biswa',
    designation: 'Events & Management',
    phoneNumber: '9771186699',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/HarshMeena.jpg',
    name: 'Harsh Meena',
    designation: 'Events & Management',
    phoneNumber: '9330319099',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/mayurkumar.jpg',
    name: 'Mayur Kumar',
    designation: 'Events & Management',
    phoneNumber: '9523389362',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/tushar_kumar.jpg',
    name: 'Tushar Kumar',
    designation: 'Events & Management',
    phoneNumber: '8210491173',
  ),
  OrganiserTile(
    imageUrl:
        'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/hritikchauhan.jpg',
    name: 'Hritik Chauhan',
    designation: 'Media & Publicity',
    phoneNumber: '9068322490',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/chaitanyajoshi.jpg',
    name: 'Chaitanya Joshi',
    designation: 'Media & Publicity',
    phoneNumber: '9871119308',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/PAVIKACHAUDHARY.jpg',
    name: 'Pavika Chaudhary',
    designation: 'Media & Publicity',
    phoneNumber: '9118011960',
  ),
  OrganiserTile(
    imageUrl:
        'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/ALKATRIVEDI.jpg',
    name: 'Alka Trivedi',
    designation: 'Hospitality & Travels',
    phoneNumber: '7236819101',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/ashishkanoujia.jpg',
    name: 'Ashish Kanoujia',
    designation: 'Hospitality & Travels',
    phoneNumber: '8090988246',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/devangbharti.jpg',
    name: 'Devang Bharti',
    designation: 'Hospitality & Travels',
    phoneNumber: '8303437325',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/kaushal_kapoor.jpg',
    name: 'Kaushal Kumar',
    designation: 'Hospitality & Travels',
    phoneNumber: '7814908871',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/ankitchauhan.jpg',
    name: 'Ankit Chauhan',
    designation: 'Registration',
    phoneNumber: '8859185192',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/niteshrawat.jpg',
    name: 'Nitesh Rawat',
    designation: 'Registration',
    phoneNumber: '8077983887',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/GeekHaven/Saarani-frontend/master/app/src/main/res/drawable-v24/anip.jpeg',
    name: 'Kumar Anip',
    designation: 'Creatives',
    phoneNumber: '9709797402',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/priyabhagat.jpg',
    name: 'Priya Bhagat',
    designation: 'Creatives',
    phoneNumber: '6264343905',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/SNEHAGUPTA.jpg',
    name: 'Sneha Gupta',
    designation: 'Creatives',
    phoneNumber: '9462572921',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/adityasinghmachhaiya.jpg',
    name: 'Aditya Singh Machhaiya',
    designation: 'Filming',
    phoneNumber: '8989006117',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/GarvitChittora.jpg',
    name: 'Garvit Chittora',
    designation: 'Web Operations',
    phoneNumber: '9509267434',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/vishwassingh.jpg',
    name: 'Vishwaas Pratap Singh',
    designation: 'Web Operations',
    phoneNumber: '8957491174',
  ),
  OrganiserTile(
    imageUrl:
    'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/mitishaagarwal.jpg',
    name: 'Mitisha Agarwal ',
    designation: 'Web Operations',
    phoneNumber: '8218449386',
  ),
  OrganiserTile(
    imageUrl: 'https://raw.githubusercontent.com/GeekHaven/Saarani-frontend/master/app/src/main/res/drawable-v24/varunb.jpg',
    name: 'Varun Bhardwaj',
    designation: 'App Developer',
    phoneNumber: '9319866520',
  ),
  OrganiserTile(
    imageUrl: 'https://raw.githubusercontent.com/AsmitaIIITA/asmita-2021-website/master/assets/images/Team/SIDDHANTDEEPAKKHOBRAGADE.jpg',
    name: 'Siddhant Khobragade',
    designation: 'App Developer',
    phoneNumber: '8850652623',
  ),
];

List<SportWidget> sportsList = [
  SportWidget(
    image: 'trixxter.jpeg',
    name: 'Trixxter',
  ),
  SportWidget(
    image: 'challange.jpeg',
    name: 'Challenge Week',
  ),
  SportWidget(
    image: 'chess2.jpeg',
    name: 'Chess',
  ),
  SportWidget(
    image: 'cod.jpg',
    name: 'COD mobile',
  ),
  SportWidget(
    image: 'csgo2.jpeg',
    name: 'CSGO',
  ),
  SportWidget(
    image: 'skribble.jpeg',
    name: 'Skribble',
  ),
  SportWidget(
    image: 'auction.jpeg',
    name: 'Auction',
  ),
  SportWidget(
    image: 'quiz2.jpeg',
    name: 'Sports Quiz',
  ),
  SportWidget(
    image: 'sketch.jpeg',
    name: 'Sketch',
  ),
];

const defaultUrl =
    'https://firebasestorage.googleapis.com/v0/b/asmita-20.appspot.com/o/defaultPdf.pdf?alt=media&token=83b0489b-6468-4aea-bb6f-57c885869071';
