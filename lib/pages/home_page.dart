import 'package:flutter/material.dart';
import 'package:plants/model/plant_model.dart';
import 'package:plants/pages/widgets/plants_list.dart';
import 'package:plants/widgets/description_widget.dart';
import 'package:plants/widgets/shopping_basket.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  late String description;
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
      potSize: 12,
      minSize: 35,
      maxSize: 45,
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
      potSize: 12,
      minSize: 35,
      maxSize: 45,
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
      potSize: 12,
      minSize: 35,
      maxSize: 45,
    ),
  ];

  @override
  initState() {
    plantGroups.add(plants.where((p) => p.top == true).toList());
    plantGroups
        .add(plants.where((p) => p.type.indexOf('Outdoor') != -1).toList());
    plantGroups
        .add(plants.where((p) => p.type.indexOf('Indoor') != -1).toList());
    plantGroups.add(plants.where((p) => p.plantOfTheMonth == true).toList());

    tabController = TabController(vsync: this, length: 4);
    scrollController = ScrollController();
    scrollController.addListener(changeDescription);
    setState(() {
      description = plantGroups[_groupIndex][_index].desctiption;
    });
    super.initState();
  }

  changeDescription() {
    _value = scrollController.offset.round();
    if (_value > 0) {
      _index = (_value / 220).round();
      setState(() {
        description = plantGroups[_groupIndex][_index].desctiption;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                'Top Picks',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 35.0),
            _buildMenu(),
            SizedBox(height: 15.0),
            _buildSlider(),
            SizedBox(height: 15.0),
            _buildDescription(),
            SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      child: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 25.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.menu,
                color: Colors.grey,
              ),
              onPressed: () {
                print('menu');
              },
            ),
            ShoppingBasket(inverted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      child: TabBar(
        controller: tabController,
        indicatorColor: Colors.transparent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey.withOpacity(0.5),
        isScrollable: true,
        tabs: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30),
            child: _buildMenuTab('Top'),
          ),
          _buildMenuTab('Outdoor'),
          _buildMenuTab('Indoor'),
          _buildMenuTab('Plant of the month'),
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
    );
  }

  Widget _buildMenuTab(String title) {
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

  Widget _buildSlider() {
    return Container(
      height: 390,
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          PlantsList(
            plants.where((p) => p.top == true).toList(),
            scrollController,
            _index,
          ),
          PlantsList(
            plants.where((p) => p.type.indexOf('Outdoor') != -1).toList(),
            scrollController,
            _index,
          ),
          PlantsList(
            plants.where((p) => p.type.indexOf('Indoor') != -1).toList(),
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
    );
  }

  Widget _buildDescription() {
    return Container(
        padding: EdgeInsets.fromLTRB(40.0, 0.0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Description',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Description(
              text: plantGroups[_groupIndex][_index].desctiption,
            ),
          ],
        ));
  }
}
