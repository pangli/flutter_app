import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'kp/model/counter_model.dart';
import 'kp/viewModel/count_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CounterViewModel(CounterModel());
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.title),
              if (viewModel.errorMessage != null)
                Text(
                  'Error: ${viewModel.errorMessage}',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.apply(color: Colors.red),
                ),
              Text(
                'Count: ${viewModel.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
