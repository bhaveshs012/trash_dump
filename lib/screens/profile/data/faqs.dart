class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

List<FAQ> faqList = [
  FAQ(
    question: 'How can I schedule a waste pickup through the app?',
    answer:
        'To schedule a waste pickup, simply open the app and navigate to the schedule a waste pickup section (Second Tab). Click on the Add A Trash Pickup Button on the bottom right corner. Choose a convenient date and time, provide your address details, and select the type of waste you want to dispose of. Our team will then confirm the pickup and handle the rest.',
  ),
  FAQ(
    question: 'What types of waste can be picked up through the app?',
    answer:
        'Our waste pickup app accepts various types of waste, including general household waste, recyclable materials, electronic waste (e-waste), and organic waste. We strive to provide comprehensive waste management solutions for our users',
  ),
  FAQ(
    question: 'How does the buying process work in the app\'s recycled store?',
    answer:
        'The in-built store within our app offers a range of recycled products. To make a purchase, browse through the available items, select the ones you want, and proceed to the checkout. We offer you convinient Cash on Delivery service. The recycled products will be delivered to your doorstep.',
  ),
  FAQ(
    question: 'Are the recycled products in the app\'s store of good quality?',
    answer:
        ' Absolutely! We ensure that all the recycled products available in our app\'s store meet high-quality standards. Each item undergoes thorough inspection and testing to ensure its durability, functionality, and overall quality. We aim to provide eco-friendly options without compromising on quality.',
  ),
  FAQ(
    question:
        'Is there a minimum order requirement for waste pickup or purchases from the recycled store?',
    answer:
        'We have a flexible approach to accommodate our users needs. There is no minimum order requirement for waste pickup, whether you have a small amount or a large quantity to dispose of. Similarly, for purchases in the recycled store, you can buy as little or as much as you want, without any restrictions.',
  ),
];
