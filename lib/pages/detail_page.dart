import 'package:flutter/material.dart';
import 'package:plants/colors.dart' as AppColors;
import 'package:plants/helpers/currency_formater_helper.dart';
import 'package:plants/model/plant_model.dart';
import 'package:plants/widgets/description_widget.dart';
import 'package:plants/widgets/shopping_basket.dart';

class DetailPage extends StatefulWidget {
  final Plant plant;

  DetailPage(this.plant);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    _buildPlantInfo(),
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

  Widget _buildPlantInfo() {
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
                CurrencyFormater.usdFormat(widget.plant.price),
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
                '${widget.plant.size}',
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
          image: AssetImage(widget.plant.image),
          fit: BoxFit.fitHeight,
          width: MediaQuery.of(context).size.width / 1.1,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      child: Container(
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
            SizedBox(
              height: 30.0,
            ),
            Description(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            SizedBox(height: 30.0),
            Text(
              'DetailPages',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.0),
            Text(
              'Plant height: 35-45cm;',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: AppColors.descriptionTextColor,
                height: 1.4,
              ),
            ),
            Text(
              'Nursery pot width: 12cm',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: AppColors.descriptionTextColor,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
