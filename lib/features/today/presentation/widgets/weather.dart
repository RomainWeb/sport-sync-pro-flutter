import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weather today', style: Theme.of(context).textTheme.labelMedium,),
        const SizedBox(height: 8.0,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for(var item in [0,1,2,3,4,5,6] ) Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
                    height: 135.0,
                    width: 60.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      color: AppColors.primaryColor,
                    ),
                    child: Column(
                      children: [
                        Text('${10 + item} am', style: const TextStyle(color: Colors.white, fontSize: 12.0),),
                        const SizedBox(height: 16.0,),
                        const Icon(FontAwesomeIcons.wind, color: Colors.white, size: 28.0,),
                        const SizedBox(height: 16.0,),
                        const Text('19°c', style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
