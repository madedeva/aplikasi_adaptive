import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

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
                  onPressed: () {
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
                  },
                )
              : ElevatedButton(
                  onPressed: () {
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
                  },
                  child: const Text('Android Button'))),
    );
  }
}
