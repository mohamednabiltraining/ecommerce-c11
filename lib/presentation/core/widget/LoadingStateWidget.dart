import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  String? loadingMessage;
  LoadingStateWidget({this.loadingMessage,super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          Text(loadingMessage ??"")
        ],
      ),
    );
  }
}
