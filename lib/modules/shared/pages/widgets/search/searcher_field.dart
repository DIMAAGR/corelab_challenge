import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../icons/icons.dart';
import '../icons/icons_data.dart';

class SearcherField extends StatefulWidget {
  final VoidCallback onClosePressed;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  final FocusNode focus;
  final bool showCloseButton;
  final TextEditingController controller;
  const SearcherField({
    required this.onClosePressed,
    required this.showCloseButton,
    required this.controller,
    this.onFieldSubmitted,
    required this.focus,
    this.onChanged,
    this.onTap,
    super.key,
  });

  @override
  State<SearcherField> createState() => _SearcherFieldState();
}

class _SearcherFieldState extends State<SearcherField> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, right: 8),
        child: TextFormField(
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          focusNode: widget.focus,
          decoration: InputDecoration(
            hintText: 'Buscar',
            fillColor: Colors.white,
            filled: true,
            hintStyle: AppTextStyle.appbarSearcherField,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.showCloseButton || widget.controller.text.isNotEmpty
                ? CloseButton(
                    color: AppColors.opal,
                    onPressed: widget.onClosePressed,
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AppIcon(
                      AppIconData.search,
                      color: AppColors.primary,
                      size: 8,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
