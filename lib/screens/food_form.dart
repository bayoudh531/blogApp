import 'dart:io';



import 'package:CWCFlutter/api/food_api.dart';
import 'package:CWCFlutter/model/food.dart';
import 'package:CWCFlutter/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class GalorieForm extends StatefulWidget {
  final bool isUpdating;

  GalorieForm({@required this.isUpdating});

  @override
  _GalorieFormState createState() => _GalorieFormState();
}

class _GalorieFormState extends State<GalorieForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

 
  Galorie _currentFood;
  String _imageUrl;
  File _imageFile;
  TextEditingController subingredientController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    GalorieNotifier foodNotifier = Provider.of<GalorieNotifier>(context, listen: false);

    if (foodNotifier.currentGalorie != null) {
      _currentFood = foodNotifier.currentGalorie;
    } else {
      _currentFood = Galorie();
    }
    _imageUrl = _currentFood.image;
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Text("image placeholder");
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          ElevatedButton(
            style:ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16),
            primary: Colors.black54,
            ),
            onPressed: () => _getLocalImage(), 
            child:Text(
              'Change Image',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            ),
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 250,
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16),
            primary: Colors.black54,),
            child: Text(
              'Change Image',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
          ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    }
  }

  _getLocalImage() async {
    final picker=ImagePicker();
     _imageFile =
        File(await picker.getImage(source:ImageSource.gallery, imageQuality: 50, maxWidth: 400 ).then((pickedFile) => pickedFile.path));
        //(source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);
   
    if (_imageFile != null) {
      setState(() {
        _imageFile = _imageFile;
      });
    }
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      initialValue: _currentFood.name,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Name must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentFood.name = value;
      },
    );
  }

  

  Widget _buildNamePrenomField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nom et Prenom'),
      initialValue: _currentFood.NomPrenom,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nom et Prenom is required';
        }

        if (value.length < 3 || value.length > 100) {
          return 'Name et prenom must be more than 3 and less than 100';
        }

        return null;
      },
      onSaved: (String value) {
        _currentFood.NomPrenom = value;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      initialValue: _currentFood.description,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is required';
        }

        if (value.length < 3 || value.length > 100) {
          return 'Description must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (String value) {
        _currentFood.description = value;
      },
    );
  }

  

  _onGalorieUploaded(Galorie food) {
    GalorieNotifier foodNotifier = Provider.of<GalorieNotifier>(context, listen: false);
    foodNotifier.addGalorie(food);
    Navigator.pop(context);
  }



  _saveGalorie() {
    print('saveGalorie Called');
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print('form saved');

    uploadGalorieAndImage(_currentFood, widget.isUpdating, _imageFile, _onGalorieUploaded);

    print("name: ${_currentFood.name}");
    print("nom et prenom: ${_currentFood.NomPrenom}");
    print("description: ${_currentFood.description}");
    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Galorie Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(children: <Widget>[
            _showImage(),
            SizedBox(height: 16),
            Text(
              widget.isUpdating ? "Edit Galorie" : "Create Galorie",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 16),
            _imageFile == null && _imageUrl == null
                ? ButtonTheme(
                    child: ElevatedButton(
                      onPressed: () => _getLocalImage(),
                      child: Text(
                        'Add Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : SizedBox(height: 0),
            _buildNameField(),
            _buildNamePrenomField(),
            _buildDescriptionField(),
            
            SizedBox(height: 16),
          
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _saveGalorie();
        },
        child: Icon(Icons.save),
        foregroundColor: Colors.white,
      ),
    );
  }
}
