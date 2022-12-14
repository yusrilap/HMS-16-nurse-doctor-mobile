import 'package:hms_16/Models/data.dart';
// import 'package:hms_16/Views/login_page.dart';
// import 'package:hms_16/Views/sign_up_page.dart';
import 'package:hms_16/Widgets/button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

int activeIndex = 0;

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            // carouselController: controlSlider,
            itemCount: adddata.length,
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
              initialPage: 0,
            ),
            itemBuilder: (context, index, pageindex) => CardItem(
                netimage: adddata[index].networkimage,
                deks: adddata[index].text),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: adddata.length,
            effect: JumpingDotEffect(
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
          Button(
            bgcolor: Color.fromARGB(255, 205, 205, 205),
            text: 'SIGN UP NOW!',
            margin: EdgeInsets.only(top: 50),
            onpressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SignUp1Page()));
            },
          ),
          Button(
            text: "SIGN IN",
            bgcolor: Colors.black,
            margin: EdgeInsets.only(top: 15),
            onpressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String netimage;
  final String deks;
  const CardItem({required this.netimage, required this.deks, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(netimage), fit: BoxFit.fitHeight)),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                deks,
                style: GoogleFonts.balsamiqSans(fontSize: 14),
              ))
        ],
      ),
    );
  }
}
