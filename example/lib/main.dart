import 'package:country_code_manager/country_code_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Code Manager Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Country Code Manager Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Country? selectedCountry;

  @override
  void initState() {
    CountryCodeManager.instance.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final result = await ShowCountries.show(context);
                if (result != null) {
                  setState(() {
                    selectedCountry = result;
                  });
                }
              },
              child: const Text('Show Countries'),
            ),
            const SizedBox(height: 20),
            Text(selectedCountry?.name ?? ''),
            const SizedBox(height: 20),
            ShowFlag(countryCode: selectedCountry?.code ?? 'US'),
            const SizedBox(height: 20),
            ShowDialCode(
              initialValue: selectedCountry?.dialCode,
              onSelected: (value) {
                debugPrint(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
