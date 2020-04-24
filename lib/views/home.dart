import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFffffc4),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                                fontSize: 21,
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
                            style: GoogleFonts.playfairDisplay(fontSize: 17),
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
                                      MediaQuery.of(context).size.width * .5,
                                  width: MediaQuery.of(context).size.width * .5,
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
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(right: 25.0, left: 25, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFEBEBF1),
                    ),
                    height: MediaQuery.of(context).size.height * .14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .07,
                            width: MediaQuery.of(context).size.height * .07,
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
                          height: MediaQuery.of(context).size.height * .14,
                          width: MediaQuery.of(context).size.width * .45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  "Coronavirus-2019",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Text(
                                "World Health Organisation's WHO official website",
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
                          height: MediaQuery.of(context).size.height * .14,
                          width: MediaQuery.of(context).size.height * .08,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[500],
                          ),
                        )
                      ],
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
                            width: MediaQuery.of(context).size.width * .35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0XFF5BC0DE),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                        Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
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
                        Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * .35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0XFF07ac0e),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 20, right: 25),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Training Video',
                              style: TextStyle(
                                fontFamily: 'robotoBlack',
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'More',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontFamily: 'robotoReg',
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3)),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey[700],
                                  size: 15,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            color: Color(0XFFEBEBF1),
                          ),
                          height: MediaQuery.of(context).size.height * .165,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
  double get maxExtent => 250;

  @override
  double get minExtent => 250;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
