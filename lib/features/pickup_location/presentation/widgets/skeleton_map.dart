
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';



class SkeletonMap extends StatelessWidget {
  const SkeletonMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .88,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(

              image: DecorationImage(
                  image: NetworkImage(
                      'https://modo3.com/thumbs/fit630x300/254393/1630719020/%D8%A7%D9%84%D9%81%D8%B1%D9%82_%D8%A8%D9%8A%D9%86_%D8%A7%D9%84%D8%AE%D8%B1%D9%8A%D8%B7%D8%A9_%D9%88%D8%A7%D9%84%D8%B5%D9%88%D8%B1_%D8%A7%D9%84%D8%AC%D9%88%D9%8A%D8%A9.jpg'),
              fit: BoxFit.fill
              )
          ),
        ),
      ),
    );
  }
}
