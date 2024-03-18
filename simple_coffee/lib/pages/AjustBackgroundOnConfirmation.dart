/**************************
*     FLUTTER IMPORTS     *
**************************/
import 'package:flutter/material.dart';

/**************************
*      CUSTOM IMPORTS     *
**************************/
import 'package:simple_coffee/commons/CustomBackgroundDrawer.dart';

class AjustBackgroundOnConfirmation extends StatefulWidget {
  final double height;
  final VoidCallback onConfirm;

  const AjustBackgroundOnConfirmation({
    Key? key,
    required this.height,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<AjustBackgroundOnConfirmation> createState() => _AjustBackgroundOnConfirmationState();
}

class _AjustBackgroundOnConfirmationState extends State<AjustBackgroundOnConfirmation> {
  @override
  Widget build(BuildContext context) {
    return (widget.height != 0 ?
      GestureDetector(
        onTap: widget.onConfirm,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomBackgroundDrawer(
            backgroundColor: Colors.black.withOpacity(0.5),
            child: const Text(""),
          )
        )
      )
      :
      const Text('')
    );
  }
}
