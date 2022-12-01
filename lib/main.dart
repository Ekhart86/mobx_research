import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_research/counter.dart';
import 'package:mobx_research/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterExample(),
    );
  }
}

class CounterExample extends StatefulWidget {
  const CounterExample({Key? key}) : super(key: key);

  @override
  CounterExampleState createState() => CounterExampleState();
}

class CounterExampleState extends State<CounterExample> {
  ReactionDisposer? bottomSheet;
  ReactionDisposer? secondScreen;
  final counter = Counter();

  @override
  void initState() {
    _setReactions(context);
    super.initState();
  }

  @override
  void dispose() {
    bottomSheet?.reaction.dispose();
    secondScreen?.reaction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('MobX Counter'),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50.0),
                counter.isLoading
                    ? const SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SizedBox(
                        width: 50,
                        height: 50,
                        child: Text(
                          '${counter.value}',
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                const SizedBox(height: 50.0),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed:
                        counter.isLockedButtons ? () {} : counter.increment,
                    child: const Text('Increment'),
                  ),
                ),
                const SizedBox(height: 50.0),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed:
                        counter.isLockedButtons ? () {} : counter.decrement,
                    child: const Text('Decrement'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _setReactions(BuildContext context) {
    bottomSheet = autorun(
      (reaction) {
        if (counter.value == 5) _showBottomSheet(context);
      },
    );
    secondScreen = autorun(
      (reaction) {
        if (counter.value == 8) _navigateToSecondScreen(context);
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('Option 1'),
              Text('Option 2'),
              Text('Option 3'),
            ],
          ),
        );
      },
    );
  }

  void _navigateToSecondScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );
  }
}
