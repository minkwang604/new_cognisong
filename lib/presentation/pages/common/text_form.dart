import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.name,
    required this.onChanged,
    required this.isShow,
    required this.isShowIcon,
    required this.hintText,
    this.iconPressed,
    this.isVisible = false,
  });

  final String name;
  final Function onChanged;
  final bool isShow;
  final bool isShowIcon;
  final bool isVisible;
  final String hintText;
  final Function? iconPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextField(
          obscuringCharacter: '*',
          obscureText: !isShow,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              focusColor: Theme.of(context).primaryColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              )),
              suffixIcon: isShowIcon
                  ? IconButton(
                      iconSize: 24,
                      onPressed:
                          iconPressed != null ? () => iconPressed!() : () => {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: isVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ))
                  : null,
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xff878787)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)))),
          onChanged: (value) => onChanged(value),
        ),
      ],
    );
  }
}
