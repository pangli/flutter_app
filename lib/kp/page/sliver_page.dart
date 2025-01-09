import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Sliver App Bar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/header.jpg',
                  fit: BoxFit.fill,
                ),
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground
                ],
              ),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
