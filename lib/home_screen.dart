import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive App iOS & Android'),
        elevation: 0,
      ),
      body: Center(
          child: isIOS
              ? CupertinoButton.filled(
                  child: const Text('iOS Button'),
                  onPressed: ShowAdaptiveDialog,
                )
              : ElevatedButton(
                  onPressed: ShowAdaptiveDialog,
                  child: const Text('Android Button'))),
    );
  }

  Future ShowAdaptiveDialog() async {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: const Text('iOS Dialog'),
                content: const Text('This is iOS Dialog'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Android Dialog'),
                content: const Text('This is Android Dialog'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ));
    }
  }
}
