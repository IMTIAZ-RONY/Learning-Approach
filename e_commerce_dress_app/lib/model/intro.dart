class Intro{
  String title;
  String description;
  String image;
  Intro({required this.title,required this.description,required this.image});
}

List<Intro>introData=[

  Intro(
      title:"Choose Products",

      description:'A product is the item offered for sale.\nA product can be a service or an item. It can be physical or in virtual or cyber form.',

      image:  'assets/images/choose.png'),

  Intro(
      title: "Make Payment",

      description: 'Payment is the transfer of money\nservices in exchange product or Payments\ntypically made terms agreed.',

      image: 'assets/images/make-payment.png'),
  Intro(
      title: "Get Your Order",

      description:'Business or commerce an order is a stated\nintention either spen to engage in a\ncommercial transaction specific products.',

      image: 'assets/images/get-your-order.png' ),
];