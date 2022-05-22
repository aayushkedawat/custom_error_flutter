import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final String stackTrace;
  const CustomErrorWidget(
      {Key? key, required this.message, required this.stackTrace})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/images/custom_error.png'),
            ),
            Expanded(
                child: Column(
              children: [
                const Text(
                  'Oops!! Something went wrong',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kDebugMode ? Colors.red : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  kDebugMode
                      ? message
                      : 'Sorry for the inconvinience caused, we have informed our developers about this issue.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                if (kDebugMode)
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  content: SingleChildScrollView(
                                      child: Text(stackTrace)),
                                ));
                      },
                      child: const Text('Show full stack trace'))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
