import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/article.dart';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> _articles = [];

  static const myData = [
    ["data", "12"],
    ["B", "2"],
    ["C", "4"],
    ["D", "2"],
    ["E", "12"],
    ["F", "4"],
    ["G", "6"],
  ];

  bool isLoding = true;

  _fetchArticles() async {
    List<Article> articles = await ApiService().fetchArticles();
    setState(() {
      _articles = articles;
      isLoding = false;
      //if (_articles.length != 0) {}
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return isLoding == true || _articles.length == 0
        ? Scaffold(
            backgroundColor: Color(0XFFffffc4),
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0XFF5BC0DE)),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Color(0XFFffffc4),
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    /*
              SliverAppBar(
                  backgroundColor: Color(0XFFFFEFD9),
                  floating: true,
                  pinned: false,
                  elevation: 0.0,
                  centerTitle: false,
                  title: Text(
                    'We will defeat\ncoronavirus',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'skranji',
                      fontSize: 15,
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar()),
                  */
                    SliverPersistentHeader(
                      pinned: false,
                      floating: true,
                      delegate: _SliverAppBarDelegate(Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Positioned(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0XFFffebcd),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "#WeCanDefeatCoronavirus",
                                    style: GoogleFonts.anton(
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 35.0),
                                child: Text(
                                  "Stay Safe\nStay at home",
                                  style: GoogleFonts.quicksand(fontSize: 17),
                                ),
                              ),
                              Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width * .5,
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: <Widget>[
                                      Positioned(
                                        bottom: -70,
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0XFFffebcd),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        child: Image.asset(
                                          'assets/home.png',
                                          fit: BoxFit.contain,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ],
                      ))),
                    ),
                  ];
                },

                //------------------//

                body: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      )),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25.0, left: 25, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              _launchUrl(
                                  'https://www.who.int/fr/emergencies/diseases/novel-coronavirus-2019');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0XFFEBEBF1),
                              ),
                              height: MediaQuery.of(context).size.height * .14,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .07,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              .07,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0XFF5BC0DE),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.shieldVirus,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .14,
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Text(
                                            "Coronavirus-2019",
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Visit World Health Organisation's WHO official website",
                                          style: GoogleFonts.roboto(
                                            color: Colors.grey[500],
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        .14,
                                    width: MediaQuery.of(context).size.height *
                                        .08,
                                    child: Icon(
                                      FontAwesomeIcons.externalLinkAlt,
                                      color: Colors.grey[500],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .2,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0XFF5BC0DE),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.headSideCough,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        Text(
                                          "\nSymptoms",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6)),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0XFFcd950c),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.stethoscope,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      Text(
                                        "\nPrecaution",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0XFF07ac0e),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.phoneAlt,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        Text(
                                          "\nGreen number",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "3030",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, top: 30, right: 25),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .22,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Algeria's Overall statistics",
                                    style: TextStyle(
                                      fontFamily: 'robotoBlack',
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                    alignment: Alignment.center,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: toChart(
                                              context,
                                              _articles[_articles.length - 1]
                                                  .confirmed,
                                              _articles[_articles.length - 1]
                                                      .deaths +
                                                  _articles[
                                                          _articles.length - 1]
                                                      .recovered +
                                                  _articles[
                                                          _articles.length - 1]
                                                      .confirmed,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0XFFcd950c),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Container(
                                            width: toChart(
                                              context,
                                              _articles[_articles.length - 1]
                                                  .recovered,
                                              _articles[_articles.length - 1]
                                                      .deaths +
                                                  _articles[
                                                          _articles.length - 1]
                                                      .recovered +
                                                  _articles[
                                                          _articles.length - 1]
                                                      .confirmed,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0XFF5BC0DE),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Container(
                                            width: toChart(
                                              context,
                                              _articles[_articles.length - 1]
                                                  .deaths,
                                              _articles[_articles.length - 1]
                                                      .deaths +
                                                  _articles[
                                                          _articles.length - 1]
                                                      .recovered +
                                                  _articles[
                                                          _articles.length - 1]
                                                      .confirmed,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0XFFf50057),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Active",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.grey[500],
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                    _articles[_articles.length -
                                                            1]
                                                        .confirmed
                                                        .toString(),
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5)),
                                                Container(
                                                  width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Color(0XFFcd950c),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "Recovered",
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey[500],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                    _articles[_articles.length -
                                                            1]
                                                        .recovered
                                                        .toString(),
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5)),
                                                Container(
                                                  width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Color(0XFF5BC0DE),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Deaths",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.grey[500],
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                    _articles[_articles.length -
                                                            1]
                                                        .deaths
                                                        .toString(),
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5)),
                                                Container(
                                                  width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Color(0XFFf50057),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .4,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "Active cases Progression",
                                    style: TextStyle(
                                      fontFamily: 'robotoBlack',
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    child: LineChart(
                                      lines: [
                                        new Line<List<String>, String, String>(
                                          data: myData,
                                          curve: LineCurves.linear,
                                          fill: PaintOptions.fill(
                                            color: Colors.amber[50],
                                          ),
                                          marker: MarkerOptions(
                                              size: 7,
                                              shape: MarkerShapes.circle,
                                              paint: PaintOptions.fill(
                                                color: Color(0XFF5BC0DE),
                                              )),
                                          stroke: PaintOptions.stroke(
                                            color: Color(0XFFcd950c),
                                            strokeWidth: 5,
                                          ),
                                          xFn: (datum) => datum[0],
                                          yFn: (datum) => datum[1],
                                        ),
                                      ],
                                      chartPadding: new EdgeInsets.fromLTRB(
                                          30.0, 10.0, 10.0, 30.0),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, top: 20, right: 25, bottom: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Training Video',
                                        style: TextStyle(
                                          fontFamily: 'robotoBlack',
                                          color: Colors.black,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ]),
                                GestureDetector(
                                  onTap: () {
                                    _launchUrl(
                                        'https://www.youtube.com/channel/UCDnssLRZPVLCecqun-V4AzQ');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          topLeft: Radius.circular(25)),
                                      color: Color(0XFFEBEBF1),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        .14,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .07,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0XFF5BC0DE),
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.video,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .14,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10.0),
                                                child: Text(
                                                  "Safety and Health topics",
                                                  style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Watch videos to get the latest safety mesures about this pandemic",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.grey[500],
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .14,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .08,
                                          child: Icon(
                                            FontAwesomeIcons.externalLinkAlt,
                                            color: Colors.grey[500],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Container _cont;

  _SliverAppBarDelegate(this._cont);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _cont,
    );
  }

  @override
  double get maxExtent => 240;

  @override
  double get minExtent => 240;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

double toChart(BuildContext context, int nb, int nbAll) {
  double allWidth = MediaQuery.of(context).size.width - 56;
  double res = (nb * 100) / nbAll;
  return res * (allWidth) / 100;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

_launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
