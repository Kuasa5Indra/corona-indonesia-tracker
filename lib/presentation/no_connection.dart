import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/no-wifi.png'), width: 200, height: 200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Kamu tidak terhubung dengan internet, silahkan coba lagi',
                style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
