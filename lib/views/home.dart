import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF348AC7),
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
                    child: SafeArea(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "We can defeat coronavirus",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: "skranji",
                      ),
                    )
                  ],
                )))),
              ),
            ];
          },
          body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(right: 25.0, left: 25, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFEBEBF1),
                    ),
                    height: MediaQuery.of(context).size.height * .15,
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
