import 'package:flutter/material.dart';

import 'dummy_text.dart';
import 'news_detail_screen.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> _items = Dummy().items;

  bool _isList = true;
  int _crossAxisCount = 1;
  double _childAspecRatio = 1.5;
  final _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    setState(() {
      _items = [
        ..._items,
        ...[
          {
            'url':
                'https://img.freepik.com/free-vector/news-report-concept-background-design_1017-14197.jpg?w=2000',
            'title': "AAAAAAAAAAAAAA",
            'text':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
          },
          {
            'url':
                'https://media.istockphoto.com/id/1182477852/photo/breaking-news-world-news-with-map-backgorund.jpg?s=612x612&w=0&k=20&c=SQfmzF39HZJ_AqFGosVGKT9iGOdtS7ddhfj0EUl0Tkc=',
            'title': "BBBBBBBBBBBBBBB",
            'text':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
          },
          {
            'url':
                'https://img.freepik.com/free-vector/news-report-concept-background-design_1017-14197.jpg?w=2000',
            'title': "CCCCCCCCCCCCCCCCCC",
            'text':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
          },
        ]
      ];
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_isList ? 'News List' : 'News Grid'),
          actions: [
            IconButton(
                onPressed: () {
                  if (!_isList) {
                    _childAspecRatio = 1.5;
                    _crossAxisCount = 1;
                    _isList = true;
                    print("from grid to list");
                  } else {
                    _childAspecRatio = 1.03;
                    _crossAxisCount = 2;
                    _isList = false;
                    print("from list to grid");
                  }
                  setState(() {});
                },
                icon: !_isList
                    ? Icon(Icons.list_alt)
                    : Icon(Icons.grid_view_outlined))
          ],
        ),
        body: GridView.builder(
          controller: _controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount,
            childAspectRatio: _childAspecRatio,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemCount: _isList
              ? _items.length + 1
              : (_items.length % 2 == 0
                  ? _items.length + 2
                  : _items.length + 1),
          itemBuilder: (_, int ind) {
            if (ind < _items.length) {
              return _isList
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(
                                  _items[ind]['url'],
                                  _items[ind]['title'],
                                  _items[ind]['text'],
                              ind)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(27, 152, 224, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Hero(
                              tag: ind,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    _items[ind]['url'],
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: 300,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 55,
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                _items[ind]['title'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(
                                  _items[ind]['url'],
                                  _items[ind]['title'],
                                  _items[ind]['text'], ind)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(27, 152, 224, 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.all(3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Hero(
                              tag: ind,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(_items[ind]['url'],
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 150)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 55,
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                _items[ind]['title'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                )),
              );
            }
          },
        ));
  }
}
