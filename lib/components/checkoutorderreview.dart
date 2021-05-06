import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';


class OrderReview extends StatelessWidget {
var Products_on_the_cart = [
  {
    "name": "Adidas Hoodie",
  "description": "Trefoil White Hoodie",
    "picture" : 'https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/a0809d4b25354abeaa5aa92901113e90_9366/Trefoil_Hoodie_White_DU7780_01_laydown.jpg',
    "price": "R 250.00",
    "quantity": "x1"
  },
  {"name": "Pride and Prejudice",
    "description": "Novel by Jane Austen",
    "picture": 'https://i0.wp.com/itsanenchantedlife.com/wp-content/uploads/2019/09/Pride-and-Prejudice-Books-1.png?resize=410%2C485&ssl=1',
    "price": "R 799.99",
    "quantity": "x1"
  },
  {
    "name": "Nike Air Force",
    "description": "Pink- air force shoes for women",
    "picture": 'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2020%2F11%2Fnike-air-force-1-pixel-white-black-sail-beige-ck6649-100-200-release-010.jpg?quality=95&w=1170&cbr=1&q=90&fit=max',
    "price":"R 499.99",
    "quantity": "x1"
  },
  {"name": "Iphone 11",
    "description": "new iPhone 11 Pro Max with a clear black case",
    "picture": 'https://switch.com.my/wp-content/uploads/2019/09/iPhone-11-Pro-Max-Clear-Case-in-black.jpg',
    "price": "R 270.00",
    "quantity": "x1",
  }
];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Order Review',
          style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.white60,

      ),
      body: ListView.builder(
          itemCount: Products_on_the_cart.length,
          itemBuilder: (BuildContext context, int index) {
            return Single_cart_product(
                prod_name: Products_on_the_cart[index]["name"],
                prod_picture: Products_on_the_cart[index]["picture"],
                prod_price: Products_on_the_cart[index]["price"],
                prod_quantity: Products_on_the_cart[index]["quantity"],
                prod_description: Products_on_the_cart[index]["description"],
              );



            /*Card(
              color: Color(0xB7242424),
              child: ListTile(
                leading: new Image.network('https://i0.wp.com/itsanenchantedlife.com/wp-content/uploads/2019/09/Pride-and-Prejudice-Books-1.png?resize=410%2C485&ssl=1',width: 80.0,height: 80.0,),
                title: new Text("Book",style:TextStyle(color: Colors.white) ),
                subtitle: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text("Description",style:TextStyle(color: Colors.grey))
                        )
                      ],
                    ),
                    new Container(
                      alignment: Alignment.bottomLeft,
                      child: new Text("x2",style:TextStyle(color: Color(0xFFFDD835)) ),
                    ),
                    new Container(
                      alignment: Alignment.bottomRight,
                      child: new Text("R100",style:TextStyle(color: Color(0xFFFDD835)) ),
                    )
                  ],
                ),

              ),
            );*/
          },
        ),

      bottomNavigationBar: new Container(
        color: Color(0xD2242424),
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("ORDER SUBTOTAL                                       R 2 219.97 \nDELIVERY                                                       R  250.00",style: TextStyle(color: Colors.white),),
                  subtitle: new Text(" \n TOTAL                             R 2 469.97",style: TextStyle(color:Colors.white ,fontSize: 19.0),),
            )
            )

          ],
        ),
      )
    );

  }
}

class Single_cart_product extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_quantity;
  final prod_description;


  Single_cart_product({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_quantity,
    this.prod_description
});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xB7242424),
      child: ListTile(
        leading: new Image.network(prod_picture,width: 80.0,height: 80.0,),
        title: new Text(prod_name,style:TextStyle(color: Colors.white) ),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(prod_description,style:TextStyle(color: Colors.grey))
                )
              ],
            ),
            new Container(
              alignment: Alignment.bottomLeft,
              child: new Text(prod_quantity,style:TextStyle(color: Color(0xFFFDD835)) ),
            ),
            new Container(
              alignment: Alignment.bottomRight,
              child: new Text(prod_price,style:TextStyle(color: Color(0xFFFDD835)) ),
            )
          ],
        ),

      ),
    );
  }
}


