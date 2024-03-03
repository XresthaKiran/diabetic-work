import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waste/test.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    try {
      navigateToHome();
    } catch (e) {
      print('Error navigating to home: $e');
    }
  }

  Future<void> navigateToHome() async {
    try {
      // Delay execution for 5 seconds
      await Future.delayed(const Duration(seconds: 5));

      // Navigate to TFLitePage and replace the current page in the navigation stack
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TFLitePage()),
      );
    } catch (e) {
      print('Error navigating to home: $e');
      // Handle the error, show a message, or take appropriate action
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      resizeToAvoidBottomInset: false,
      // body: SizedBox(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Center(
      //           child: Padding(
      //             padding: const EdgeInsets.only(
      //               top: 120,
      //               bottom: 50,
      //               left: 60,
      //               right: 60,
      //             ),
      //             child: Text(
      //               '“Diabetic Retinopathy”',
      //               style: GoogleFonts.capriola(
      //                 fontSize: 32,
      //                 fontWeight: FontWeight.w400,
      //                 color: const Color(0xfff7e5b7),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           width: MediaQuery.of(context).size.width / 4,
      //           height: MediaQuery.of(context).size.width / 4
      //         ),
      //         SizedBox(height: MediaQuery.of(context).size.width / 17),
      //         Text(
      //           'AI tool',
      //           style: GoogleFonts.lato(
      //             fontSize: 32,
      //             fontWeight: FontWeight.w400,
      //             color: const Color(0xfff7e5b7),
      //           ),
      //         ),
      //         SizedBox(
      //           height: MediaQuery.of(context).size.width / 2,
      //           child: const SpinKitCircle(
      //             color: Colors.lightBlueAccent,
      //             size: 50.0,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 430,
                child: Column(
                  children: [
                    Container(
                      width: 430,
                      height: 400,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD6CFF1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(43),
                            bottomRight: Radius.circular(106),
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(
                            "assets/doctor.png",
                            fit: BoxFit.contain,
                            width: 400,
                            height: 400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 48),
                    
                 
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome to\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'COVID 19 Center',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Here provides some features. \n It’s very useful during a pandemic.\n Stay Healthy, Stay Safe.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                 ElevatedButton(onPressed:() {
                     Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const TFLitePage()),
                  );
                  },
                child: Text('Discover Now'),
                  )
                  ],
                ),
              ),
            ),
          ),
        ),
      );  
  }
}
