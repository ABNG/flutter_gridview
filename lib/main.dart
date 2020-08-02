import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/size_config.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black87),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.defaultSize * 1.2);
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //you can also use SliverGridDelegateWithMaxCrossAxisCount where you don't need to specify crossaxiscount it will be according to device width
              crossAxisCount:
                  SizeConfig.orientation == Orientation.portrait ? 1 : 2,
              mainAxisSpacing: SizeConfig.defaultSize * 2,
              childAspectRatio: 1.65,
              crossAxisSpacing: SizeConfig.defaultSize * 2),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) => Container(
            color: Color(0xFFffbbaa * index),
            child: Text(
              "HELLO",
              textScaleFactor: SizeConfig.defaultSize * 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
