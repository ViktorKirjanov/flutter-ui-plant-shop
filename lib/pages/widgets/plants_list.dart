import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants/colors.dart' as AppColors;
import 'package:plants/helpers/currency_formater_helper.dart';
import 'package:plants/model/plant_model.dart';
import 'package:plants/pages/detail_page.dart';

class PlantsList extends StatefulWidget {
  final List<Plant> plants;
  final ScrollController scrollController;
  final int showIndex;

  PlantsList(
    this.plants,
    this.scrollController,
    this.showIndex,
  );

  @override
  _PlantsListState createState() => _PlantsListState();
}

class _PlantsListState extends State<PlantsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        controller: widget.scrollController,
        padding: EdgeInsets.only(left: 40.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return _buildPlantCard(widget.plants[index], index);
        },
        itemCount: widget.plants.length,
      ),
    );
  }

  Widget _buildPlantCard(Plant plant, int index) {
    return Container(
      padding: EdgeInsets.only(right: 15.0, top: 15.0),
      child: GestureDetector(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: (widget.showIndex == index)
                      ? AppColors.mainColor
                      : AppColors.secondColor,
                ),
                height: 350.0,
                width: 220.0,
              ),
              _buildImage(plant.image),
              _buildPrice(plant.price),
              _buildInfo(plant),
              _buildAddToCart(),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(plant: plant),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPrice(double price) {
    return Positioned(
      top: 10.0,
      right: 10.0,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'FROM',
              style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Text(
              CurrencyFormater.usdFormat(price),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String img) {
    return Positioned(
      left: 0.0,
      top: 0.0,
      child: Container(
        width: 270.0,
        height: 270.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(Plant plant) {
    return Positioned(
      top: 245.0,
      left: 25.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 2.0),
          Text(
            plant.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(
                  FontAwesomeIcons.tint,
                  color: Colors.white.withOpacity(0.5),
                  size: 23.0,
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                height: 35.0,
                width: 35.0,
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(
                  FontAwesomeIcons.sun,
                  color: Colors.white.withOpacity(0.5),
                  size: 23.0,
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                height: 35.0,
                width: 35.0,
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(
                  FontAwesomeIcons.thermometerHalf,
                  color: Colors.white.withOpacity(0.5),
                  size: 23.0,
                ),
              ),
              SizedBox(width: 20.0),
              InkWell(
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  child: Icon(
                    FontAwesomeIcons.questionCircle,
                    color: Colors.white.withOpacity(0.5),
                    size: 23.0,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPage(plant: plant),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAddToCart() {
    return Positioned(
      top: 325.0,
      left: 85,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.black,
        ),
        child: Center(
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 28.0,
          ),
        ),
      ),
    );
  }
}
