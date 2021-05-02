import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/profile_add_edit_view.dart';

class ProfileView extends StatelessWidget {
  Profile _profile;

  ProfileView(
    this._profile,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileAddEditView(
                              profile: _profile,
                            )));
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Icon(Icons.person),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.greenAccent,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        _profile.name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Full Name"),
                    ),
                    ListTile(
                      title: Text(_profile.email ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Email Id"),
                    ),
                    ListTile(
                      title: Text(_profile.mobileNumber ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Mobile Number"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(Icons.home_outlined),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.yellow,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(_profile.addressLine1 ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Address"),
                    ),
                    ListTile(
                      title: Text(_profile.landMark ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Landmark"),
                    ),
                    ListTile(
                      title: Text(_profile.area ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Area"),
                    ),
                    ListTile(
                      title: Text(_profile.city ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("City"),
                    ),
                    ListTile(
                      title: Text(_profile.state ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("State"),
                    ),
                    ListTile(
                      title: Text(_profile.country ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Country"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
