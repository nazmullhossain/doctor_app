import 'package:flutter/material.dart';

class ConsultingCard extends StatelessWidget {
  final String type, status, image, name, timeRange;
  final bool? instantCall;
  final Color ? color;
  final void Function()? onTap;
  const ConsultingCard({
    Key? key,
    required this.type,
    required this.status,
    required this.image,
    required this.name,
    required this.timeRange,
    this.instantCall, this.onTap, this.color,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    height: 30,
                    width: 30,
                  )),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        type,
                        style: const TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        status,
                        style: const TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    timeRange,
                    style: const TextStyle(fontSize: 12,letterSpacing: 1.5),
                  )
                ],
              ),
              instantCall == true ? const Spacer() : const SizedBox(),
              if (instantCall == true) ...[
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
