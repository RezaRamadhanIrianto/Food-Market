part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationsPage(
          title: "Yeay! Completed",
          subtitle: "Now you are able to order\nsome foods as a self reward",
          picturePath: "assets/food_wishes.png",
          buttonTitle1: "Order Other Foods",
          buttonTap1: () {},
          buttonTitle2:  "Find Foods",
          buttonTap2: (){},
      )
    );
  }
}
