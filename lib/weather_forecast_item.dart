import 'package:flutter/material.dart';
class HourlyForecastItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String label1;
  const HourlyForecastItem({
    super.key, required this.label, required this.icon, required this.label1

  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

             maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(),
            Icon(icon, size: 36),
            const SizedBox(height: 9,),
            Text(
              label1,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
