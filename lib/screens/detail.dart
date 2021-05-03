import 'package:CWCFlutter/api/food_api.dart';
import 'package:CWCFlutter/model/food.dart';
import 'package:CWCFlutter/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_form.dart';

class GalorieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GalorieNotifier foodNotifier = Provider.of<GalorieNotifier>(context);

    _onGalorieDeleted(Galorie food) {
      Navigator.pop(context);
      foodNotifier.deleteGalorie(food);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(foodNotifier.currentGalorie.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.network(
                  foodNotifier.currentGalorie.image != null
                      ? foodNotifier.currentGalorie.image
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 24),
                Text(
                  foodNotifier.currentGalorie.name,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Text(
                  'Nom et Prenom: ${foodNotifier.currentGalorie.NomPrenom}',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                Text(
                  'Description: ${foodNotifier.currentGalorie.description}',
                  style: TextStyle(fontSize: 18, decoration: TextDecoration.underline),
                ),
              
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return GalorieForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            child: Icon(Icons.edit),
            foregroundColor: Colors.white,
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'button2',
            onPressed: () => deleteGalorie(foodNotifier.currentGalorie, _onGalorieDeleted),
            child: Icon(Icons.delete),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
