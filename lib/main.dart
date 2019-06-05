import 'package:flutter/material.dart';
import 'package:plants/plant_model.dart';
import 'package:plants/plants_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page x'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;
  String description;
  int _index = 0;
  int _groupIndex = 0;
  int _value = 0;
  List<List<Plant>> plantGroups = [];

  List<Plant> plants = [
    Plant(
      name: 'Monstera Deliciosa',
      type: ['Outdoor', 'Indoor'],
      top: true,
      plantOfTheMonth: false,
      price: 25.00,
      size: 'Big',
      image: 'assets/images/monstera.png',
      desctiption:
          'Monstera deliciosa, the ceriman, is a species of flowering plant native to tropical forests of southern Mexico, south to Panama. It has been introduced to many tropical areas, and has become a mildly invasive species in Hawaii, Seychelles, Ascension Island and the Society Islands.',
    ),
    Plant(
      name: 'Bird of Paradise',
      type: ['Indoor'],
      top: true,
      plantOfTheMonth: true,
      price: 35.00,
      size: 'Small',
      image: 'assets/images/bird_of_paradise.png',
      desctiption:
          'Strelitzia alba is a herbaceous plant of the Bird of Paradise family and is endemic to the Garden Route along the southernmost coastal regions of the Eastern and Western Cape in South Africa. The Swedish botanist Thunberg, who in 1792 described and published it in Nov. Gen. Pl.: 113 as Strelitzia augusta, first found it in the neighbourhood of the Piesang River at Plettenberg Bay – \'piesang\' being Afrikaans for \'banana\'. Francis Masson, who was then the Botanical Collector for Kew, introduced it to Europe in 1791. This is one of three arborescent Strelitzias, the other two being Strelitzia caudata and Strelitzia nicolai.',
    ),
    Plant(
      name: 'Cat Palm',
      type: ['Indoor', 'Outdoor'],
      top: true,
      plantOfTheMonth: true,
      price: 45.50,
      size: 'Average',
      image: 'assets/images/cat_palm.png',
      desctiption:
          'The Cat Palm is the most popular from the Chamaedora species of trees. The palm itself doesn\'t have a trunk and it’s frawns have a downward growing pattern. They are often used as garden bed “bushy” plants in tropical and subtropical regions under tall growing trees that provide large amounts of shade. The scientific name for the Cat Palm is Chamaedorea (ky-mee-DOR-ee-uh) Cataractarum (kat-uh-RAK-tar-um).',
    ),
  ];

  @override
  void initState() {
    plantGroups.add(plants.where((p) => p.top == true).toList());
    plantGroups
        .add(plants.where((p) => p.type.indexOf('Outdoor') != -1).toList());
    plantGroups
        .add(plants.where((p) => p.type.indexOf('Indoor') != -1).toList());
    plantGroups.add(plants.where((p) => p.plantOfTheMonth == true).toList());

    super.initState();
    tabController = TabController(vsync: this, length: 4);
    scrollController = ScrollController();
    scrollController.addListener(changeDescription);
    setState(() {
      description = plantGroups[_groupIndex][_index].desctiption;
    });
  }

  changeDescription() {
    _value = scrollController.offset.round();
    if (_value > 0) {
      _index = (_value / 300).round();
      setState(() {
        description = plantGroups[_groupIndex][_index].desctiption;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      print('menu');
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    mini: true,
                    elevation: 0.0,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 17.0,
                    ),
                    onPressed: () {
                      print('FloatingActionButton');
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Top Picks',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                isScrollable: true,
                tabs: <Widget>[
                  buildMenuTab('Top'),
                  buildMenuTab('Outdoor'),
                  buildMenuTab('Indoor'),
                  buildMenuTab('Plant of the month'),
                ],
                onTap: (index) {
                  setState(() {
                    _value = 0;
                    _index = 0;
                    _groupIndex = index;
                    description = plantGroups[_groupIndex][_index].desctiption;
                  });
                },
              ),
            ),
            Container(
              height: 435,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  PlantsList(
                    plants.where((p) => p.top == true).toList(),
                    scrollController,
                    _index,
                  ),
                  PlantsList(
                    plants
                        .where((p) => p.type.indexOf('Outdoor') != -1)
                        .toList(),
                    scrollController,
                    _index,
                  ),
                  PlantsList(
                    plants
                        .where((p) => p.type.indexOf('Indoor') != -1)
                        .toList(),
                    scrollController,
                    _index,
                  ),
                  PlantsList(
                    plants.where((p) => p.plantOfTheMonth == true).toList(),
                    scrollController,
                    _index,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
              child: Text(
                plantGroups[_groupIndex][_index].desctiption,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }

  Widget buildMenuTab(String title) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
