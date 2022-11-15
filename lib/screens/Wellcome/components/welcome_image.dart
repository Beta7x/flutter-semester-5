import 'package:flutter/material.dart';
import 'package:flutter_admin/utils/config.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Selamat Datang di E-Toll".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: Image(
                image: AssetImage('assets/images/Saly-14.png'),
                fit: BoxFit.cover,
                height: 420,
              ),
            ),
            Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
