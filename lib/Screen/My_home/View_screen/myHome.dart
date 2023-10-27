import 'package:flutter/material.dart';
import 'package:task3/Screen/favorite/favorite_screen.dart';
class HomeNew extends StatefulWidget {
  @override
  _HomeNewState createState() => _HomeNewState();
}
class _HomeNewState extends State<HomeNew> {
  List<String> image = [
    'image/food/1.png',
    'image/food/2.png',
    'image/food/3.png',
    'image/food/4.png',
    'image/food/5.png',
    'image/food/6.png',
    'image/food/7.png',
    'image/food/8.png',
    'image/food/9.png',
    'image/food/10.png',
    'image/food/11.png',
    'image/food/12.png',
    'image/food/13.png',
    'image/food/14.png',
  ];
  List<String> name = [
    'Mankie',
    'Girp',
    'pasta',
    'Lamoyne',
    'ponstar',
    'Charnika',
    'Aboody',
    'Maxico',
    'protocol',
    'Hot Dog',
    'Pizza',
    'Yeslt',
    'Potato',
    'Deemetria',
  ];
  List<String> price = [
    '3\$',
    '5\$',
    '2\$',
    '4\$',
    '1\$',
    '4\$',
    '2\$',
    '3\$',
    '6\$',
    '4\$',
    '5\$',
    '4\$',
    '1\$',
    '3\$',
  ];
  String searchQuery = '';
  List<Map<String, String>> favoriteItems = [];
  @override
  Widget build(BuildContext context) {
    var heightS = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Text('Fast Food',
                style: TextStyle(
                  fontSize: heightS*0.045,
                  fontStyle: FontStyle.italic,
                  fontFamily:'Arial'
                ),),
              ),
              decoration: BoxDecoration(
                color: Color(0xE7E7600D),
              ),
            ),
            ListTile(
              title: Text('Ask a Question'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Color(0xE7E7600D),
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Color(0xE7E7600D),
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Color(0xE7E7600D),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                onTap: (){
                  showSearch(context: context, delegate: DataSearch());
                },
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search'
                ),
              ),
            ),
            SizedBox(height: heightS*0.013),
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,),
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    if (searchQuery.isNotEmpty && !name[index].toLowerCase().contains(searchQuery.toLowerCase())) {
                      return SizedBox.shrink();}
                    return Card(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,builder: (context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(name[index],style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: heightS*0.035
                                  ),),
                                ),
                                content: Image.asset(image[index]),
                                actions: <Widget>[
                                  FloatingActionButton(
                                    clipBehavior: Clip.hardEdge,
                                    backgroundColor: Colors.orange,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(image[index]),
                            ),
                            ListTile(
                              title: Text(name[index]),
                              subtitle: Text('Price: ${price[index]}'),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xE7E7600D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('Buy'),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    favoriteItems.add({
                                      'name': name[index],
                                      'price': price[index],
                                      'image': image[index],
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) => FavoriteScreen(favoriteItems: favoriteItems),
                                    ));
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                  size: 30,
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
class DataSearch extends SearchDelegate<String> {
  List<String> image = [
    'image/food/1.png',
    'image/food/2.png',
    'image/food/3.png',
    'image/food/4.png',
    'image/food/5.png',
    'image/food/6.png',
    'image/food/7.png',
    'image/food/8.png',
    'image/food/9.png',
    'image/food/10.png',
    'image/food/11.png',
    'image/food/12.png',
    'image/food/13.png',
    'image/food/14.png',
  ];
  List<String> name = [
    'Mankie',
    'Girp',
    'pasta',
    'Lamoyne',
    'ponstar',
    'Charnika',
    'Aboody',
    'Maxico',
    'protocol',
    'Hot Dog',
    'Pizza',
    'Yeslt',
    'Potato',
    'Deemetria',
  ];
  List<String> price = [
    '3\$',
    '5\$',
    '2\$',
    '4\$',
    '1\$',
    '4\$',
    '2\$',
    '3\$',
    '6\$',
    '4\$',
    '5\$',
    '4\$',
    '1\$',
    '3\$',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back_ios_new),
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    final List<String> results = name.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },);},);
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = query.isEmpty
        ? name : name
        .where((item) => item.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        String itemName = suggestionList[index];
        String itemPrice = price[index];
        String itemImage = image[index];
        return ListTile(
          leading: Image.asset(itemImage,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name[index]),
              Text('Price: ${price[index]}'),
            ],
          ),
          onTap: () {
            query = itemName;
            close(context, query);
          },
        );
      },
    );
  }
}