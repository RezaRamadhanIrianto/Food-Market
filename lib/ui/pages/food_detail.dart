part of 'pages.dart';

class FoodDetail extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  FoodDetail({this.onBackButtonPressed, this.transaction});
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int quatity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.transaction.food.picturePath),
                      fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    //Back Vutton
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackButtonPressed != null) {
                              widget.onBackButtonPressed();
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.all(3),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black12),
                              child:
                                  Image.asset("assets/back_arrow_white.png")),
                        )),
                  ),
                  //// Body
                  Container(
                    margin: EdgeInsets.only(top: 180),
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 134,
                                  child: Text(widget.transaction.food.name,
                                      style: blackTextFontStyle2),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                RatingStars(rate: widget.transaction.food.rate),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quatity = max(1, quatity - 1);
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/btn_min.png"))),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    quatity.toString(),
                                    textAlign: TextAlign.center,
                                    style: blackTextFontStyle2,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quatity = min(999, quatity + 1);
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/btn_add.png"))),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                          child: Text(
                            widget.transaction.food.description,
                            style: greyFontStyle,
                          ),
                        ),
                        Text("Ingredients", style: blackTextFontStyle3),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          child: Text(widget.transaction.food.ingredients,
                              style: greyFontStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Price",
                                    style:
                                        greyFontStyle.copyWith(fontSize: 13)),
                                Text(
                                  NumberFormat.currency(
                                          locale: "id-ID",
                                          symbol: "IDR ",
                                          decimalDigits: 0)
                                      .format(quatity *
                                          widget.transaction.food.price),
                                  style: blackTextFontStyle2.copyWith(
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                                width: 163,
                                height: 45,
                                child: RaisedButton(
                                  onPressed: () {
                                    Get.to(PaymentPage(
                                        transaction: widget.transaction
                                            .copyWith(
                                                quantity: quatity,
                                                total: quatity *
                                                    widget.transaction.food
                                                        .price)));
                                  },
                                  color: mainColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text("Order Now",
                                      style: blackTextFontStyle3.copyWith(
                                          fontWeight: FontWeight.w500)),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
