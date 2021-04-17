import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//scrollable list view For the Categories
class CategoriesHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.all(10.0),
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            child: Category(
                imageDescription: 'Books',
                imageLocation: 'assets/images/Book.png'),
          ),
          Category(
              imageDescription: 'Clothes',
              imageLocation: 'assets/images/Clothes.png'),
          Category(
              imageDescription: 'Beauty',
              imageLocation: 'assets/images/Garden.png'),
          Category(
              imageDescription: 'Kitchen',
              imageLocation: 'assets/images/Kitchen.png'),
          Category(
              imageDescription: 'Tech',
              imageLocation: 'assets/images/Tech.png'),
        ],
      ),
    );
  }
}

//Instance Class
//We avoid to write on code for every category:)
class Category extends StatelessWidget {
  late final String imageLocation;
  late final String imageDescription;

  Category({required this.imageDescription, required this.imageLocation, t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      //InkWell is to ensure that images/categories are tappable
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 300.0,
          height: 50.0,
          child: ListTile(
            // contentPadding:,
            title: Image.asset(
              imageLocation,
              width: 50,
              height: 150,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imageDescription,
                style: TextStyle(fontSize: 30, fontFamily: 'Inria Serif'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//HorizontalList for Books
class BooksHorizontalList extends StatefulWidget {
  @override
  _BooksHorizontalliststate createState() => _BooksHorizontalliststate();
}

class _BooksHorizontalliststate extends State<BooksHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://i0.wp.com/itsanenchantedlife.com/wp-content/uploads/2019/09/Pride-and-Prejudice-Books-1.png?resize=410%2C485&ssl=1'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 2.0, color: Colors.black)),
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://pictures.abebooks.com/inventory/30690884705.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0532/8555/2298/files/Rupi_Kaur_Books_TSAHFPB.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0532/8555/2298/files/Rupi_Kaur_Books_Home_Body.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0532/8555/2298/files/MAH-cover?v=1616362160g'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://markmanson.net/wp-content/uploads/2019/02/eif-3d-fits-shadow-640x613.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://markmanson.net/images/subtle-art-bestseller-3d-340px-2.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}

//HorizontalList for Clothes
class ClothesHorizontalList extends StatefulWidget {
  @override
  ClothesHorizontalListState createState() => ClothesHorizontalListState();
}

class ClothesHorizontalListState extends State<ClothesHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2020%2F11%2Fnike-air-force-1-pixel-white-black-sail-beige-ck6649-100-200-release-010.jpg?quality=95&w=1170&cbr=1&q=90&fit=max'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://is4.revolveassets.com/images/p4/n/z/DMAR-WZ290_V1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/abc8ee3f-f2b1-4973-917c-979dcf556711/sportswear-tech-fleece-big-kids-boys-pants-MXK20l.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images-na.ssl-images-amazon.com/images/I/610sEP0DlgL._AC_UY445_.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/k6hwczgz1g51qglt8tgk/everyday-plus-cushioned-training-ankle-socks-6-pairs-xql9Hn.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0011/9783/4252/products/20_375a8763-f5d7-4184-a352-4523ef713733.jpg?v=1576267132'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/a0809d4b25354abeaa5aa92901113e90_9366/Trefoil_Hoodie_White_DU7780_01_laydown.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}

//HorizontalList for Beauty
class BeautyHorizontalList extends StatefulWidget {
  @override
  BeautyHorizontalListState createState() => BeautyHorizontalListState();
}

class BeautyHorizontalListState extends State<BeautyHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.ulta.com/is/image/Ulta/2235252_prod_altimg_1?op_sharpen=1&resMode=bilin&qlt=85&wid=800&hei=800&fmt=jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://ae01.alicdn.com/kf/HTB12UzcyNSYBuNjSsphq6zGvVXas/1-Holder-1-Blade-Genuine-Gillette-Fusion-Shaving-Razor-Blades-For-Men-Brands-Straight-Razor.jpg_q50.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://www.clorebeauty.com/pub/media/catalog/product/cache/24cd8a0400cfb240889f41cf95511624/c/0/c00009136.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://spydealz.com/ecom_content/uploads/2020/04/dove-soap-250x250-1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0101/4890/4996/products/3308-maximum-cavity-protection-colgate-toothpaste-100ml-18058112172182_1024x1024.jpg?v=1608113780'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0140/5894/6617/products/14168157_18561790-d2d6-43e9-ae9b-f3e61b7cff0b_700x700.jpg?v=1578797380'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.ctfassets.net/g8qtv9gzg47d/image_post_24951/443acc8772507d80c96cedd8a774d012/Slider_1_-_Nivea_Creme?fl=progressive&fm=jpg&q=80'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}

//HorizontalList for Kitchen
class KitchenHorizontalList extends StatefulWidget {
  @override
  KitchenHorizontalListState createState() => KitchenHorizontalListState();
}

class KitchenHorizontalListState extends State<KitchenHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://mrpg.scene7.com/is/image/MRP/02_4102012236_SI_00?wid=360&hei=540&qlt=70&resMode=bisharp&op_usm=5,0.125,5,1'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://mrpg.scene7.com/is/image/MRP/02_4206012303_SI_00?wid=360&hei=540&qlt=70&resMode=bisharp&op_usm=5,0.125,5,1'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://mrpg.scene7.com/is/image/MRP/02_4108010316_SI_00?wid=360&hei=540&qlt=70&resMode=bisharp&op_usm=5,0.125,5,1'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://mrpg.scene7.com/is/image/MRP/02_4102012251_SI_00?wid=360&hei=540&qlt=70&resMode=bisharp&op_usm=5,0.125,5,1'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://mrpg.scene7.com/is/image/MRP/02_4108010174_SI_00?wid=360&hei=540&qlt=70&resMode=bisharp&op_usm=5,0.125,5,1'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://mrpg.scene7.com/is/image/MRP/02_5103021904_SI_00?wid=360&hei=540&qlt=70&resMode=bisharp&op_usm=5,0.125,5,1'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://d8mkdcmng3.imgix.net/f823/712456.jpg?auto=format&bg=0FFF&fit=fill&h=600&q=100&w=600&s=57043e1da08a0c0e66d6a050ffa5d2e9'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}

//HorizontalList for Tech
class TechHorizontalList extends StatefulWidget {
  @override
  TechHorizontalListState createState() => TechHorizontalListState();
}

class TechHorizontalListState extends State<TechHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.squarespace-cdn.com/content/v1/54d696e5e4b05ca7b54cff5c/1605128373417-456E951XR9VCW7KH9XHN/ke17ZwdGBToddI8pDm48kDLqGnfnaNvb2WAMBrav4WZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0p5uBJOnOmCWBN4JfYsIDyS8QmO_WcYrStKvojNc5P-lyt_XqNqd7Xa98oZlSexa-A/Logic+Pro+X+On+MacBook+Pro.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://switch.com.my/wp-content/uploads/2019/09/iPhone-11-Pro-Max-Clear-Case-in-black.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://ae01.alicdn.com/kf/HTB1oL7gXvvsK1Rjy0Fiq6zwtXXac/Tenkeyless-Mechanical-Keyboard-Red-Switches-Compact-Design-RGB-Backlit-Aluminum-Panel-White-Gaming-Keyboard-US-Layout.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images-na.ssl-images-amazon.com/images/I/61weuAijuBL._SX425_.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://thermaltake.azureedge.net/pub/media/catalog/product/cache/e4fc6e308b66431a310dcd4dc0838059/l/2/l20m01.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/12656072/2020/10/1/950a4b67-45e8-440a-a25f-8c168ebf70321601543242604-Redmi-Earbuds-S-12-Hours-of-Playback-timeIPX4-Sweat-DSP-Envi-1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://www.sony.com/image/dec28ab731dad845e5e299340ac98cd4?fmt=pjpeg&bgcolor=FFFFFF&bgc=FFFFFF&wid=2515&hei=1320'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              width: 200.0,
              height: 300.0,
            ),
          ),
        ],
      ),
    );
  }
}
