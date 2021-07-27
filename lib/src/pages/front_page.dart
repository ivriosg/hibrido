import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF000000),
            Color(0xFF26437B),
            Color(0xFF183060),
          ],
        ),
      ),
      child: Column(
        children: [
          _firstSection(),
        ],
      ),
    );
  }

  _firstSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/bitcoin.png',
                width: 60.0,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Text(
                  'Una plataforma en línea que automatiza sus operaciones en el mercado de criptomonedas.',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 12.0,
              ),
              primary: Color(0xFFFFCE00),
              elevation: 0.0,
              shape: StadiumBorder(),
            ),
            onPressed: () {},
            child: Text(
              '¡UNETE AL CLUB!',
              style: TextStyle(
                color: Color(0xFF183060),
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
