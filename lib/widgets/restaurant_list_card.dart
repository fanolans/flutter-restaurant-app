import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/list_restaurants.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class RestaurantListCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantListCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RestaurantDetailPage(idDetail: restaurant.id);
        }));
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Expanded(
          flex: 2,
          child: Hero(
            tag: restaurant.pictureId,
            child: Image.network(
              "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
              width: 100,
            ),
          )),
      title: Text(restaurant.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.redAccent,
                size: 18,
              ),
              Text(restaurant.city),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              ),
              Text("${restaurant.rating}"),
            ],
          ),
        ],
      ),
    );
  }
}