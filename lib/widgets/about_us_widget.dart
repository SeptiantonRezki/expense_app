import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Spending App. Dibuat oleh Rizky Ramadhan, @jmiryas (IG) & @dendengcrap (Twitter) dengan menggunakan Flutter.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
