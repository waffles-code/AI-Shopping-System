import 'package:flutter/material.dart';

class CheckOutAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Align(
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                alignment: Alignment(-0.95, 0),
              ),
              subtitle: Align(
                child: Text(
                  "11 Maclaren st,MarshallTown,Johannesburg",
                  style: TextStyle(fontSize: 15),
                ),
                alignment: Alignment(-0.7, 0),
              ),
              leading: Icon(Icons.house, size: 20, color: Colors.black),
            ),
            Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 100,
              color: Colors.black,
            ),
            ListTile(
              title: Align(
                child: Text(
                  "Work",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                alignment: Alignment(-0.95, 0),
              ),
              subtitle: Align(
                child: Text(
                  "104 Stiemens st,Braamfontein,Johannesburg",
                  style: TextStyle(fontSize: 15),
                ),
                alignment: Alignment(-0.7, 0),
              ),
              leading: Icon(Icons.work, size: 20, color: Colors.black),
            ),
            Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 100,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "Add new Address",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(Icons.add, size: 20, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 100,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Text("Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row

                    children: [
                  Container(
                      width: 500,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.black87,
                          hintText: 'new Address',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w300),
                      )),
                  //====================================================================================row
                ]
                    //====================================================================================rowEnded
                    )),
            SizedBox(
              height: 10,
            ),
            Text("Street Address",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                  Container(
                      width: 500,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.black87,
                          hintText: 'Street and number / P.O. box',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w300),
                      )),
                  //====================================================================================row
                ]
                    //====================================================================================rowEnded
                    )),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                  Container(
                      width: 500,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.black87,
                          hintText:
                              'Apartment, suit, unit, building, floor etc',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w300),
                      )),
                  //====================================================================================row
                ]
                    //====================================================================================rowEnded
                    )),
            Text("City",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                  Container(
                      width: 500,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.black87,
                          hintText: ' ',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w300),
                      )),
                  //====================================================================================row
                ]
                    //====================================================================================rowEnded
                    )),
            SizedBox(
              height: 15,
            ),
            Text("Province",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                  Container(
                      width: 500,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.black87,
                          hintText: ' ',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w300),
                      )),
                  //====================================================================================row
                ]
                    //====================================================================================rowEnded
                    )),
            SizedBox(
              height: 15,
            ),
            Text("Zip Code",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //====================================================================================row
                    children: [
                  Container(
                      width: 500,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: '',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w300),
                      )),
                  //====================================================================================row
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 20,
                    thickness: 2,
                    indent: 20,
                    endIndent: 100,
                    color: Colors.black,
                  ),

                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff181818),
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w300,
                        ),
                        side: BorderSide(color: Colors.black, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      onPressed: () {},
                      child: Text("Save Address"),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white, // background
                        primary: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w300,
                        ),
                        side: BorderSide(color: Colors.black, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      onPressed: () {},
                      child: Text("Discard"),
                    ),
                  ),
                ]
                    //====================================================================================rowEnded
                    )),
          ],
        ),
      ),
    );
  }
}
