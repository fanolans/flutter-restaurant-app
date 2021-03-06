import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/utils/restaurant_result_state.dart';
import 'package:restaurant_app/widgets/restaurant_error.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/list_page';
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantListProvider>(builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = state.result.restaurants[index];
                return CardRestaurant(restaurant: restaurant);
              });
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const RestaurantError(),
                const SizedBox(height: 8),
                Text(state.message),
                const SizedBox(height: 8),
              ],
            ),
          );
        } else if (state.state == ResultState.noConnection) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const RestaurantError(),
                const SizedBox(height: 8),
                Text(state.message),
                const SizedBox(height: 8),
              ],
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const RestaurantError(),
                const SizedBox(height: 8),
                Text(state.message),
                const SizedBox(height: 8),
              ],
            ),
          );
        } else {
          return const Center(child: Text(''));
        }
      }),
    );
  }
}
