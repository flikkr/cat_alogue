import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SampleAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample animations'),
      ),
      body: ListView(
        children: [
          Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_daZky5.json'
          ),
          Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_F8lz4p.json',
          ),
          Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_rYjLry.json',
          ),
          Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_0FQ4S0.json',
          ),
          Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_H3UrCA.json',
          ),
        ],
      ),
    );
  }
}
