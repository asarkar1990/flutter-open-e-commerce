import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

class ProductAddEditView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Product product = Product();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Add/Edit"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                var form = _formKey.currentState;
                if (form.validate()) {
                  /// data is valid. lets save the form.
                  form.save();

                  product.inStock = true;

                  /// form data is now valid. you may save to db.
                  FirebaseFirestore.instance
                      .collection("Products")
                      .doc()
                      .set(product.toMap());
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            children: [
              // this.name,
              TextFormField(
                initialValue: product.name,
                decoration: InputDecoration(
                  labelText: "Product Name",
                ),
                validator: (value) => _validate(value, "Product Name"),
                onSaved: (value) {
                  product.name = value;
                },
              ),
              // this.price,
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue:
                    product.price != null ? product.price.toString() : '',
                validator: (value) => _validate(value, "Price"),
                decoration: InputDecoration(
                  labelText: "Product price",
                ),
                onSaved: (value) {
                  product.price = double.parse(value);
                },
              ), // this.imageUrl,
              TextFormField(
                initialValue: product.imageUrl,
                validator: (value) => _validate(value, "Image Url"),
                decoration: InputDecoration(
                  labelText: "Product Image Url",
                ),
                onSaved: (value) => product.imageUrl = value,
              ), // this.description,
              TextFormField(
                initialValue: product.description,
                validator: (value) => _validate(value, "Description"),
                decoration: InputDecoration(
                  labelText: "Product description",
                ),
                minLines: 2,
                maxLines: 4,
                onSaved: (value) => product.description = value,
              ),

              // this.manufacturer,
              TextFormField(
                initialValue: product.manufacturer,
                validator: (value) => _validate(value, "Manufacturer"),
                decoration: InputDecoration(
                  labelText: "Product manufacturer",
                ),
                onSaved: (value) => product.manufacturer = value,
              ),
              SizedBox(
                height: 20.0,
              ),
              // this.inStock,
            ],
          ),
        ),
      ),
    );
  }

  _validate(value, fieldName) {
    if (value.isEmpty) {
      return "$fieldName is required.";
    } else
      return null;
  }
}
