import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final TextEditingController _controller = TextEditingController();
  final RxString textValue = ''.obs;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      textValue.value = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search...',
            contentPadding: const EdgeInsets.all(8),
            suffixIcon: textValue.value.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: const Icon(Iconsax.close_circle),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
