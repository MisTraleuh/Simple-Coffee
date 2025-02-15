import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes;

  const SizeSelector({Key? key, required this.sizes}) : super(key: key);

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.sizes.length, (index) {
        bool isSelected = index == _selectedIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 40,
            width: 110,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: isSelected
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                widget.sizes[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black54,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
