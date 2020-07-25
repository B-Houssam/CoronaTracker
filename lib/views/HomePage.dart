import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/article.dart';
import '../services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  Article _articlew = new Article();

  var _ctName = "USA";

  Color scndBack = Color(0XFF4B6592);
  Color frstBack = Colors.white;
  Color frstText = Color(0XFF1e3c72);
  Color scndText = Colors.white;

  bool isLoding = true;

  Country _selected;

  _fetchArticles(bool choix) async {
    Article articleW = await ApiService().fetchArticles(choix, _ctName);
    setState(() {
      _articlew = articleW;
      isLoding = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _fetchArticles(true);
  }

  Widget buildBar() {
    return Padding(
        padding:
            const EdgeInsets.only(left: 30.0, top: 20, right: 30, bottom: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      launch('https://www.github.com/B-Houssam');
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Color(0XFF1e3c72),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/me.png",
                                ),
                              ))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Visit me on Github",
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height * .055,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: CountryPicker(
                  nameTextStyle: GoogleFonts.lato(
                    color: Color(0XFF1e3c72),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                  dense: false,
                  showCurrency: false,
                  showCurrencyISO: false,
                  onChanged: (Country country) {
                    setState(() {
                      _ctName = country.name;
                      _fetchArticles(false);
                      scndBack = Colors.white;
                      scndText = Color(0XFF1e3c72);
                      frstBack = Color(0XFF4B6592);
                      frstText = Colors.white;
                      _selected = country;
                    });
                  },
                  selectedCountry: _selected,
                ),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return isLoding == true || _articlew == null //|| data.length == 0
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
                    Padding(padding: EdgeInsets.all(15)),
                    Text(
                      "Connecting",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.grey[200],
                      ),
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
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 20, right: 30),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Covid-19",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Text(
                                "statistics",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
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
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                frstBack = Colors.white;
                                frstText = Color(0XFF1e3c72);
                                scndBack = Color(0XFF4B6592);
                                scndText = Colors.white;
                                _fetchArticles(true);
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * .4,
                              height: 55,
                              decoration: BoxDecoration(
                                color: frstBack,
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Text(
                                "Global",
                                style: GoogleFonts.lato(
                                  color: frstText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 7.5),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                scndBack = Colors.white;
                                scndText = Color(0XFF1e3c72);
                                frstBack = Color(0XFF4B6592);
                                frstText = Colors.white;
                                _fetchArticles(false);
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: scndBack,
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Text(
                                "My Country",
                                style: GoogleFonts.lato(
                                  color: scndText,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        fontWeight: FontWeight.w100,
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
                          style: GoogleFonts.lato(),
                        ),
                        Text(
                          'Today',
                          style: GoogleFonts.lato(),
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
                                      borderRadius: BorderRadius.circular(12),
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
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
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
                                              fontSize: 23,
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
                                      borderRadius: BorderRadius.circular(12),
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
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
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
                                              fontSize: 23,
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
                                        MediaQuery.of(context).size.width * .43,
                                    decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(12),
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
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
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
                                        MediaQuery.of(context).size.width * .43,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan[300],
                                      borderRadius: BorderRadius.circular(12),
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
                                            style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
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
                                borderRadius: BorderRadius.circular(12),
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
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
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
                                borderRadius: BorderRadius.circular(12),
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
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
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
                /*
                white square starts here
                */
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .29,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .25,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .16,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0XFF4B6592),
                                Color(0XFF1e3c72),
                              ]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Do your own test!",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "Watch videos and learn\nmore about the virus",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.shieldVirus,
                                    color: Color(0XFF4B6592),
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .23,
                            width: MediaQuery.of(context).size.width * .28,
                            child: Image.asset(
                              'assets/doc.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
