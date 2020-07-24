import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Meal {
  final String name;
  final String image;
  final String category;
  final double price;
  final double lastPrice;
  final double rate;

  Meal(this.name, this.image, this.category, this.price, this.lastPrice,
      this.rate);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Meal> meals = [
    Meal('Chipotle Cheesy Chicken', 'assets/hamburger.png', 'Beef Burger', 2.7,
        3.0, 4.5),
    Meal('Chocoloate Cake', 'assets/cake.png', 'Cake', 9.7, 12.0, 4.7),
    Meal('Cheese pizza', 'assets/pizza.webp', 'Pizza', 11.7, 15.0, 4.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _buildHeader(),
          _buildTitle(),
          _buildFilter(),
          _buildHorizontalList(),
          _buildFoodTypeSection(),
          _buildFoodList()
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFoodList() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFF3CD65).withOpacity(.1),
              Color(0xFFF3CD65).withOpacity(.1),
              Color(0xFFF3CD65).withOpacity(.1),
              Color(0xFFF3CD65).withOpacity(.1),
              Color(0xFFF3CD65).withOpacity(.1),
              Colors.white.withOpacity(0.01),
            ],
          ),
        ),
        child: ListView(

          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          children: <Widget>[
            ...meals.map<Widget>((e) => _buildFoodRow(e)).toList()
          ],
        ),
      ),
    );
  }

  Widget _buildFoodRow(Meal meal) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(3.0, 3.0),
                            blurRadius: 6.0,
                            spreadRadius: 1.0, //
                          ),
                        ]),
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 120, top: 4, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  meal.name,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                _buildFavorite(Colors.grey.withOpacity(.3))
                              ],
                            ),
                            Text(
                              meal.category,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            _buildRate('4.5', '(2k)'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '\$${meal.price.toString()}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '\$${meal.lastPrice.toString()}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  bottom: 0,
                  right: 0,
                ),
                _buildLeadingFoodList(meal),
                _buildBuyButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned _buildBuyButton() {
    return Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3CD65),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                    alignment: Alignment.center,
                    width: 80,
                    height: 40,
                    child: Text(
                      'Buy',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ));
  }

  Container _buildLeadingFoodList(Meal meal) {
    return Container(
        width: 125.0,
        height: 130.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color(0xFFFFF2E1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: const Offset(3.0, 3.0),
                blurRadius: 6.0,
                spreadRadius: 1.0, //
              ),
            ]),
        child: Center(
            widthFactor: 120.0,
            heightFactor: 120.0,
            child: Image.asset(meal.image, width: 120.0, height: 120.0)));
  }

  Widget _buildTitle() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 22.0, color: Colors.black87),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Hello',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFFF2CC63),
                                fontSize: 25,
                                fontWeight: FontWeight.w600))),
                    TextSpan(
                        text: ' Foodie!',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600)))
                  ]),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/hungry.png',
              width: 35,
              height: 35,
            )
          ],
        ));
  }

  Widget _buildFilter() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF3CD65).withOpacity(.01),
                Color(0xFFF3CD65).withOpacity(.1),
                Color(0xFFF3CD65).withOpacity(.1),
                Color(0xFFF3CD65).withOpacity(.1),
                Colors.white.withOpacity(.1),
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                focusColor: Colors.grey,
                hintText: 'Search foods',
                hintStyle: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon: Icon(Icons.filter_list,
                    color: Color(0xFFF3CD65).withOpacity(.8)),
              ),
            ))
      ],
    );
  }

  Widget _buildHorizontalList() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Trendy foods',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600))),
           SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[_buildItemBanner(), _buildItemBanner()],
              ),
            )
          ],
        ));
  }

  Widget _buildHeader() {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.sort,
              size: 30,
              color: Colors.grey[700],
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/bucket.jpg',
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/girl.jpg'),
                )
              ],
            )
          ],
        ));
  }

  Widget _buildFoodCardContent() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[_buildFavorite(Colors.red)],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Gourmet Bacon',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Burger',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '\$2.19',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            _buildRate('4.7', '(2k)')
          ],
        ));
  }

  Row _buildRate(String value, String amount) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: Color(0xFFE29102),
          size: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(value,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14)),
        SizedBox(
          width: 5,
        ),
        Text(amount,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w200, fontSize: 10))
      ],
    );
  }

  Widget _buildFavorite(Color color) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              offset: const Offset(3.0, 3.0),
              blurRadius: 5.0,
              spreadRadius: 2.0, //
            ),
          ]),
      width: 27,
      height: 27,
      child: Icon(
        Icons.favorite,
        color: color,
        size: 17,
      ),
    );
  }

  Widget _buildItemBanner() {
    return Container(
      width: 200,
      height: 150,
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                  clipper: FoodCardClipper(),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3CD65),
                    ),
                  )),
              Positioned(
                right: 0,
                bottom: 0,
                child: ClipPath(
                    clipper: FoodCardClipper(),
                    child: Container(
                      width: 145,
                      height: 145,
                      decoration: BoxDecoration(
                        color: Color(0xFFFBDEA5),
                      ),
                      child: _buildFoodCardContent(),
                    )),
              )
            ],
          ),
          Positioned(
              right: 25,
              bottom: 0,
              child: ClipPath(
                  clipper: FoodCardClipper(),
                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration:
                          BoxDecoration(color: Color(0xFFFFF2E1), boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0, //
                        ),
                      ]),
                      child: Center(
                          widthFactor: 70.0,
                          heightFactor: 70.0,
                          child: Image.asset('assets/hamburger.png',
                              width: 70.0, height: 70.0)))))
        ],
      ),
    );
  }

  Widget _buildFoodTypeSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              _buildSelectedSection('All'),
              ...['Junk Food', 'Drink', 'Meet', 'Fruit', 'Vegetable']
                  .map<Widget>((e) => _buildSimpleSection(e))
                  .toList()
            ],
          )),
    );
  }

  Widget _buildSimpleSection(String label) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          label,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ));
  }

  Widget _buildSelectedSection(String label) {
    return Container(
      width: 50,
      height: 25,
      child: Center(
          child: Text(
        label,
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      )),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color(0xFFFBDEA5)),
    );
  }
}

class FoodCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 20);

    path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    path.lineTo(size.width - 20.0, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 50.0);
    path.quadraticBezierTo(size.width, 30.0, size.width - 20.0, 30.0);
    path.lineTo(20.0, 5.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
