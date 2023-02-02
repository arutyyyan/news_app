import 'package:flutter/material.dart';
import 'package:news_app/dummy_text.dart';

class NewsDetailScreen extends StatelessWidget {
  final url;
  final title;
  final text;
  final ind;

  NewsDetailScreen(this.url, this.title, this.text, this.ind);

  final String _text = Dummy().dummyText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('News Detail'),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('News Detail'),
              centerTitle: true,
              background: Hero(
                tag: ind,
                child: Image.network(url),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                padding: EdgeInsets.all(25),
                child: Column(children: [
                  Text(
                    title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    _text,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ])),
          ]))
        ],
      ),
    );
  }
}
