import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/article.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  Article _articlew = new Article();

  bool isLoding = true;

  _fetchArticles() async {
    Article articleW = await ApiService().fetchArticles();
    setState(() {
      _articlew = articleW;
      isLoding = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _fetchArticles();
  }

  Widget buildBar() {
    return Padding(
        padding:
            const EdgeInsets.only(left: 30.0, top: 20, right: 30, bottom: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 25,
                height: 40,
                child: Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 25,
                height: 40,
                child: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.white,
                ),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return isLoding == true || _articlew == null
        ? Scaffold(
            backgroundColor: Color(0XFF1e3c72),
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Coronavirus\nTracker",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.righteous(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Color(0XFF1e3c72),
            body: ListView(
              children: <Widget>[
                buildBar(),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 20),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "COVID-19",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "statistics",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Color(0XFF4B6592),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 7.5),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * .4,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Text(
                              "Global",
                              style: GoogleFonts.roboto(
                                color: Color(0XFF1e3c72),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 7.5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Text(
                              "My Country",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TabBar(
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      indicatorColor: Color(0XFF3D84A8),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      isScrollable: true,
                      tabs: <Widget>[
                        Text(
                          'Total',
                        ),
                        Text(
                          'Today',
                        ),
                      ],
                      controller: _tabController,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .31,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                            .15 -
                                        20,
                                    width:
                                        MediaQuery.of(context).size.width * .43,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0XFFFFB259),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Affected",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            _articlew.affected
                                                .toString()
                                                .replaceAllMapped(
                                                    new RegExp(
                                                        r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                            style: GoogleFonts.sourceCodePro(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                            .15 -
                                        20,
                                    width:
                                        MediaQuery.of(context).size.width * .43,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFFF5959),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Death",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            _articlew.deaths
                                                .toString()
                                                .replaceAllMapped(
                                                    new RegExp(
                                                        r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                            style: GoogleFonts.sourceCodePro(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                            .15 -
                                        20,
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Recovered",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            _articlew.recovered
                                                .toString()
                                                .replaceAllMapped(
                                                    new RegExp(
                                                        r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                            style: GoogleFonts.sourceCodePro(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                            .15 -
                                        20,
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan[300],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Active",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            _articlew.active
                                                .toString()
                                                .replaceAllMapped(
                                                    new RegExp(
                                                        r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                            style: GoogleFonts.sourceCodePro(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                            .15 -
                                        20,
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    decoration: BoxDecoration(
                                      color: Color(0XFF9059FF),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Serious",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            _articlew.serious
                                                .toString()
                                                .replaceAllMapped(
                                                    new RegExp(
                                                        r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                    (Match m) => '${m[1]},'),
                                            style: GoogleFonts.sourceCodePro(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      /*
                */
                      /*---------------*/
                      /*
                */
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * .31 - 22,
                              width: MediaQuery.of(context).size.width * .43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0XFFFFB259),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Affected",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "+" +
                                          _articlew.tdycases
                                              .toString()
                                              .replaceAllMapped(
                                                  new RegExp(
                                                      r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                  (Match m) => '${m[1]},'),
                                      style: GoogleFonts.sourceCodePro(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * .31 - 22,
                              width: MediaQuery.of(context).size.width * .43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0XFFFF5959),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Death",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "+" +
                                          _articlew.tdydeaths
                                              .toString()
                                              .replaceAllMapped(
                                                  new RegExp(
                                                      r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                  (Match m) => '${m[1]},'),
                                      style: GoogleFonts.sourceCodePro(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                )
              ],
            ),
          );
  }
}
