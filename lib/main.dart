import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_practice/ui/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


//  Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: BankCard(
//                       cardHolder: 'Zainab Ali',
//                       cardNumber: '1234 5678 9012 3456',
//                       validThru: '12/24',
//                       color: Colors.blue,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: BankCard(
//                         cardHolder: 'Zain alia',
//                         cardNumber: '2345 6789 0123 4567',
//                         validThru: '11/25',
//                         color: Colors.green),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: BankCard(
//                       cardHolder: 'Bisma asif',
//                       cardNumber: '3456 7890 1234 5678',
//                       validThru: '10/26',
//                       color: Colors.red,
//                     ),
//                   ),
// class BankCard extends StatelessWidget {
//   final String cardHolder;
//   final String cardNumber;
//   final String validThru;
//   final Color color;

//   const BankCard({
//     required this.cardHolder,
//     required this.cardNumber,
//     required this.validThru,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       height: 150,
//       width: 300,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(20.0),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             offset: Offset(2, 2),
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               cardHolder,
//               style: TextStyles.cardHolder,
//             ),
//             const SizedBox(height: 10),
//             Text(
//               cardNumber,
//               style: TextStyles.cardNumber,
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'VALID THRU',
//                       style: TextStyles.validThruLabel,
//                     ),
//                     Text(
//                       validThru,
//                       style: TextStyles.validThru,
//                     ),
//                   ],
//                 ),
//                 const Icon(
//                   Icons.credit_card,
//                   color: Colors.white70,
//                   size: 24,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }