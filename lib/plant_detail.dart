import 'package:flutter/material.dart';
import 'package:plants/plant_model.dart';

class PlantDetail extends StatefulWidget {
  final Plant plant;

  PlantDetail(this.plant);

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          // backgroundColor: Colors.white,
          // body: SingleChildScrollView(
          // child: Column(
          // children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                // color: Color.fromRGBO(67, 170, 102, 1),
                // color: Colors.red,
                child: Column(
                  children: <Widget>[
                    _buildMenu(context),
                    _buildPlantInfo(),
                    _buildDescription(),
                    // _buildDivider(),
                  ],
                ),
              ),
              _buildPlantImage(context),
            ],
          ),
        ],
      ),
      // ),
    );
  }

  Widget _buildMenu(context) {
    return Container(
      color: Color.fromRGBO(67, 170, 102, 1),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Stack(
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.white.withOpacity(0.15),
                mini: true,
                elevation: 0.0,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 17.0,
                ),
                onPressed: () {
                  print('FloatingActionButton');
                },
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                child: Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPlantInfo() {
    return Container(
      color: Color.fromRGBO(67, 170, 102, 1),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 25, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  for (String type in widget.plant.type)
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        '${type.toUpperCase()}',
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                widget.plant.name,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'FROM',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8AC7A4),
                ),
              ),
              Text(
                '\$${widget.plant.price}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'SIZES',
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8AC7A4)),
              ),
              Text(
                '${widget.plant.size}',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), color: Colors.black),
            child: Center(
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _buildPlantImage(context) {
    return Positioned(
      left: 100,
      top: 100,
      child: Container(
        // height: 400.0,
        child: Image(
          height: 400,
          image: AssetImage(widget.plant.image),
          fit: BoxFit.fitHeight,
          width: MediaQuery.of(context).size.width / 1.1,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(67, 170, 102, 1),
      child: Container(
        padding: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'All to know...',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 12.0),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Details',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Plant height: 35-45cm;',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  'Nursery pot width: 12cm',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
