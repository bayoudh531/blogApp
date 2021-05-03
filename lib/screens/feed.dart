import 'package:CWCFlutter/api/food_api.dart';
import 'package:CWCFlutter/notifier/food_notifier.dart';
import 'package:CWCFlutter/screens/detail.dart';
import 'package:CWCFlutter/screens/food_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GFeed extends StatefulWidget {
  @override
  _GFeedState createState() => _GFeedState();
}

class _GFeedState extends State<GFeed> {
  @override
  void initState() {
    GalorieNotifier foodNotifier = Provider.of<GalorieNotifier>(context, listen: false);
    getGalorie(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    GalorieNotifier foodNotifier = Provider.of<GalorieNotifier>(context);

    Future<void> _refreshList() async {
      getGalorie(foodNotifier);
    }

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
        'Galorie',style: TextStyle(
             fontSize: 35,
             foreground: Paint()
             ..style=PaintingStyle.stroke
             ..strokeWidth=2
             ..color=Colors.yellow[700]      
            ),
        ),
        
      ),
      body: new RefreshIndicator(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(
                foodNotifier.galorieList[index].image != null
                    ? foodNotifier.galorieList[index].image
                    : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              title: Text(foodNotifier.galorieList[index].name),
              onTap: () {
                foodNotifier.currentGalorie = foodNotifier.galorieList[index];
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return GalorieDetail();
                }));
              },
            );
          },
          itemCount: foodNotifier.galorieList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black,
            );
          },
        ),
        onRefresh: _refreshList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          foodNotifier.currentGalorie = null;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return GalorieForm(
                isUpdating: false,
              );
            }),
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
    );
  }
}
