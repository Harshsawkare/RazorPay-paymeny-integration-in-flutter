
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(){
    var options = {
      "key" : "rzp_test_ykqs4Jhk8jQEwy",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "Audrey Hope",
      "description" : "you are paying us",
      "prefill" : {
        "contact" : "1077247777",
        "email" : "audreyhopesfor@nyc.com"
      },
      "external" : {
        "wallets" : ["paytm", "gpay",]
      }
    };

    try{
      razorpay.open(options);
    }
    catch(e){
      print("ERROR OPENING RAZORPAY : "+e.toString());
    }
  }

  void handlerPaymentSuccess(){
    print("Payment Successful");
  }

  void handlerErrorFailure(){
    print("Payment Error");
  }

  void handlerExternalWallet(){
    print("External Wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("RazorPay Payment Integration",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),),
      ),

      body: Column(
        children: [

          Row(
            children: [
              Expanded(child: Container()),
              Image.asset("images/flutter.jpeg", width: 110, height: 110, fit: BoxFit.fitHeight,),
              Image.asset("images/razorpay.jpeg", width: 110, height: 140, fit: BoxFit.fitHeight,),
              Expanded(child: Container()),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: TextField(
              controller: textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount to pay"
              ),
            ),
          ),
          RaisedButton(
            color: Colors.blue,
              child: Text("Proceed",
                style: TextStyle(
                    color: Colors.white,
                ),),
            onPressed: (){
              openCheckout();
            }
          )
        ],
      ),
    );
  }
}
