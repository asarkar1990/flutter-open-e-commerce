import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/views/profile_update.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://scontent.fgau4-1.fna.fbcdn.net/v/t1.0-9/71497124_1215757148610075_8960003087485894656_o.jpg?_nc_cat=104&ccb=1-3&_nc_sid=e3f864&_nc_ohc=M5xUK0shLTsAX_Wq48S&_nc_ht=scontent.fgau4-1.fna&oh=b57673b44fd3b23869568980177cc48f&oe=60865C99',
                width: 200,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Name'),
            SizedBox(
              height: 10,
            ),
            Text('date of birth'),
            SizedBox(
              height: 10,
            ),
            Text('Email'),
            SizedBox(
              height: 10,
            ),
            Text('Phone Number'),
            SizedBox(
              height: 10,
            ),
            Center(child: ElevatedButton(onPressed: (){}, child: Text("Save"))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileUpdate()),
                  );
                },
                child: Center(child: Text('Update Profile'),)
            )],
        ),
      ),
    ));
  }
}
