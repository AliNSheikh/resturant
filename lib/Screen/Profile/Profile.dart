import 'package:flutter/material.dart';
import 'package:task3/Screen/google_map/google.dart';
class Profile6 extends StatefulWidget {
  @override
  State<Profile6> createState() => _Profile6State();
}

class _Profile6State extends State<Profile6> {
  @override
  Widget build(BuildContext context) {
    var heghitC = MediaQuery.of(context).size.height;
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(),
          _buildMainInfo(context, widthC),
          SizedBox(height: heghitC * 0.01),
          _buildInfo(context, widthC),
        ],
      ),
    ));
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.4),
                  Color(0xE7E7600D).withOpacity(0.4),
                  Color(0xE7D9D2E7).withOpacity(0.4),
                  Color(0xE7E7600D).withOpacity(0.4),
                  Colors.white.withOpacity(0.4),
                ]),
          ),
        ),
        Ink(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(150),
              bottomLeft: Radius.circular(150),
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xE7E7600D),
                  Color(0xE7D9D2E7),
                  Color(0xE7E7600D),
                  Colors.white,
                ]),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 85),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.white,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('image/ali.jpg'),
                            ),
                            CircleAvatar(
                              radius: 15,
                              child: Icon(Icons.camera_alt),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMainInfo(BuildContext context, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Text('Ali Sheikh',
          style: TextStyle(
              fontSize: 25,
              color: Color(0xE7E7600D),
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfo(BuildContext context, double width) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: ListTile(
                    leading: Icon(Icons.email, color: Color(0xE7E7600D)),
                    title: Text("E-Mail"),
                    subtitle: Text("Ali@gmail.com"),
                  ),
                ),
                Divider(
                  color: Color(0xE7E7600D),
                ),
                TextButton(
                  onPressed: () {},
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Color(0xE7E7600D)),
                    title: Text("Phone Number"),
                    subtitle: Text("+971-501646033"),
                  ),
                ),
                Divider(
                  color: Color(0xE7E7600D),
                ),
                TextButton(
                  onPressed: () {},
                  child: ListTile(
                    leading: Icon(Icons.person, color: Color(0xE7E7600D)),
                    title: Text("About"),
                    subtitle: Text("AliSH"),
                  ),
                ),
                Divider(
                  color: Color(0xE7E7600D),
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GoogleMaptest()));
                      },
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.location_on, color: Color(0xE7E7600D)),
                    title: Text("Location"),
                    subtitle: Text("UAE"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
