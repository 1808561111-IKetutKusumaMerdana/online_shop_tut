import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_shop_app/models/fonts_product.dart';
import 'package:online_shop_app/ui/home_try_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  startTimer() {
    Timer(const Duration(seconds: 5), () async {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return HomeTryPage();
      })));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://ouch-cdn2.icons8.com/d4Io_OT5QSIqdaBYTKejx0PTQC2I59eI1MKt6tu06Fo/rs:fit:256:176/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzIx/L2NmZjBlMjYyLWVh/Y2QtNDU3NS04OWNm/LTU3NGRhMDUzZWZi/Ni5zdmc.png",
                // fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "ProductoBuy",
                  style: productFonts.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    letterSpacing: 1.5,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
