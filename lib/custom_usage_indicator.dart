import 'package:flutter/material.dart';

class CustomUsageIndicator extends StatelessWidget {
  final String title;
  final num total;
  final num used;
  final bool isRound;

  const CustomUsageIndicator(
    {required this.title,
     required this.total,
     required this.used,
     required this.isRound,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        isRound ?
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: used/total,
                  backgroundColor: Colors.green,
                  color: Colors.orange,
                  strokeWidth: 16,
                  semanticsLabel: 'free',
                ),
                const SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Used: ${used.toStringAsFixed(2)}Mb'),
                    const SizedBox(height: 8,),
                    Text('Total: ${total.toStringAsFixed(2)}Mb'),
                  ],
                ),
              ],
            ),
          ) :
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                  value: used/total,
                  minHeight: 24,
                  backgroundColor: Colors.green,
                  color: Colors.orange,
                  semanticsLabel: 'free',
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Used: ${used.toStringAsFixed(2)}Mb'),
                      const SizedBox(width: 16,),
                      Text('Total: ${total.toStringAsFixed(2)}Mb'),
                  ],)
                ],
              ),
            ),
      ],
    );
  }
}
