import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/images.dart';



LGConatiner({required heading, required body, bgColorTXT = '', required onTab}){
  var bgColor = Colors.white;
  if(bgColorTXT=='colored'){
    bgColor = const Color.fromRGBO(78, 0, 118, 0.47);
  }
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:14.0, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(heading, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black, letterSpacing: 1.12, height: 1.5),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(body, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 1.12, height: 1.5),),
                  ),
                  GestureDetector(
                    onTap: onTab,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset('assets/icons/right-arrow_icon.png'),
                    ),
                  )
                ],),
            ),
          ),
        )
      ],),
    ),
  );
}

service_fee_widget({context, title, required onTab}){
  var bgColor = Colors.white;
  return GestureDetector(
    onTap: onTab,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black, letterSpacing: 1.12, height: 1.5),),
            ),
            Image.asset(Images.backArrowIcon)
          ],),
        ),
      ),
    ),
  );
}
