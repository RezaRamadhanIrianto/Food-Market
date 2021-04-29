part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentUrl;

  PaymentMethodPage({this.paymentUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IllustrationsPage(
      title: "Finish Your Payment",
      subtitle: "Please select your favourite\npayment method",
      picturePath: "assets/Payment.png",
      buttonTitle1: "Payment Method",
      buttonTap1: () async {
        await launch(paymentUrl);
      },
      buttonTitle2: "Continue",
      buttonTap2: () {
        Get.to(SuccessOrderPage());
      },
    ));
  }
}
