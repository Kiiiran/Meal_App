import 'package:flutter/material.dart';
import 'package:mealapp1/models/meal.dart';
import 'package:mealapp1/screens/meal_details.dart';
import 'package:mealapp1/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String? title;
  final List<Meal> meals;
 

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal,
        
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh >>> Nothing is here',
              style: Theme.of(context).textTheme.headlineLarge!
                ..copyWith(color: Theme.of(context).colorScheme.onBackground)),
          SizedBox(
            height: 8,
          ),
          Text('Choose another category!!!',
              style: Theme.of(context).textTheme.bodyLarge!
                ..copyWith(color: Theme.of(context).colorScheme.onBackground))
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectMeal: selectMeal,
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
