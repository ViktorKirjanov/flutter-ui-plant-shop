import 'package:flutter/material.dart';
import 'package:plants/colors.dart' as AppColors;
import 'package:plants/helpers/currency_formater_helper.dart';
import 'package:plants/model/plant_model.dart';
import 'package:plants/widgets/description_widget.dart';
import 'package:plants/widgets/shopping_basket.dart';

class DetailPage extends StatelessWidget {
  final Plant plant;

  DetailPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    color: AppColors.mainColor,
                  ),
                ),
                Column(
                  children: <Widget>[
                    _buildHeader(context),
                    _buildPlantInfo(context),
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                _buildPlantImage(context),
              ],
            ),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.only(left: 25.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ShoppingBasket(),
        ],
      ),
    );
  }

  Widget _buildPlantInfo(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  for (String type in plant.type)
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
                plant.name,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'FROM',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.captionTextColor,
                ),
              ),
              Text(
                CurrencyFormater.usdFormat(plant.price),
                style: TextStyle(
                  fontSize: 22.0,
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
                    color: AppColors.captionTextColor),
              ),
              Text(
                '${plant.size}',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 35.0),
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Colors.black,
            ),
            child: Center(
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  Widget _buildPlantImage(context) {
    return Positioned(
      left: 100,
      bottom: 20,
      child: Container(
        child: Image(
          height: 400,
          image: AssetImage(plant.image),
          fit: BoxFit.fitHeight,
          width: MediaQuery.of(context).size.width / 1.1,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(40.0, 0.0, 20.0, 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'All to know ...',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(59, 59, 59, 1),
            ),
          ),
          SizedBox(height: 30.0),
          Description(text: plant.desctiption),
          SizedBox(height: 30.0),
          Text(
            'Detail',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.0),
          Text(
            'Plant height: ${plant.minSize}-${plant.maxSize}cm;',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.descriptionTextColor,
              height: 1.4,
            ),
          ),
          Text(
            'Nursery pot width: ${plant.potSize}cm',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.descriptionTextColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
