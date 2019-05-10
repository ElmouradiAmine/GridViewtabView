import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GridView Tabs Stepper',
      home: TheTapBarView(),
    );
  }
}

class TheTapBarView extends StatefulWidget {
  @override
  _TheTapBarViewState createState() => _TheTapBarViewState();
}

class _TheTapBarViewState extends State<TheTapBarView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  TabBar _makeTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: <Widget>[
        Icon(Icons.home),
        Icon(Icons.settings),
      ],
    );
  }

  TabBarView _makeTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Center(child: Text('This is home page.')),
        Center(child: Text('This is settings page.')),
      ],
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: _makeTabBar(),
        title: Text('TabBar Demo'),
      ),
      body: _makeTabBarView(),
    );
  }
}

class TheGridView extends StatefulWidget {
  @override
  _TheGridViewState createState() => _TheGridViewState();
}

class _TheGridViewState extends State<TheGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Demo'),
      ),
      body: _buildGridView(),
    );
  }

  static Card _makeElement(String title, IconData icon) {
    return Card(
      elevation: 2.0,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            Text(title),
          ],
        ),
      ),
    );
  }

  static GridView _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(32.0),
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      childAspectRatio: 1,
      children: <Widget>[
        _makeElement('Home', Icons.home),
        _makeElement('Email', Icons.email),
        _makeElement('Chat', Icons.chat),
        _makeElement('News', Icons.new_releases),
        _makeElement('Network', Icons.network_wifi),
        _makeElement('Options', Icons.settings),
      ],
    );
  }
}
