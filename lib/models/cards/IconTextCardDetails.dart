import 'package:flutter/material.dart';

class IconTextCardDetails extends StatelessWidget {
  final String icon;
  final String title;
  final bool isDark;
  final List<String> buttonLabels;
  final List<String> buttonsDescription;

  const IconTextCardDetails({
    Key? key,
    required this.icon,
    required this.title,
    required this.isDark,
    required this.buttonLabels,
    required this.buttonsDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? textButtonColor = isDark ? Colors.black : Colors.black;
    Color? backgroundPopUp = isDark ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.7);
    return Dialog(
      backgroundColor: backgroundPopUp,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              icon,
              width: 60,
              height: 60,
              color: isDark ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 15),
            Text(title, style: TextStyle(fontSize: 24, color: isDark ? Colors.black : Colors.white)),
            const SizedBox(height: 20),
            ...buttonLabels.asMap().entries.map((entry) {
              int idx = entry.key;
              String label = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    final datas = await Navigator.pushNamed(
                      context,
                      '/completeTheField',
                      arguments: {
                        'icon': icon,
                        'title': title,
                        'label': label,
                        'description': buttonsDescription[idx],
                      },
                    );
                    if (datas != null) {
                      Navigator.of(context).pop(datas);
                    }
                  },
                  child: Text(label, style: TextStyle(color: textButtonColor)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}