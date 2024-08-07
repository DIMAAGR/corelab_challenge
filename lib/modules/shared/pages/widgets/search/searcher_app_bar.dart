import 'package:corelab_challenge/modules/shared/domain/enums/pages.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/search/search_filter_button.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/search/search_historic.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/search/searcher_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/search_controller.dart';
import '../../styles/colors.dart';

class SearcherAppBar extends StatefulWidget implements PreferredSizeWidget {
  final SearchBarController controller;
  final void Function(String? query)? onSearch;
  final bool showFilter;

  const SearcherAppBar({
    super.key,
    this.showFilter = false,
    required this.controller,
    this.onSearch,
  });

  @override
  Size get preferredSize => Size.fromHeight(_calculateAppBarHeight());

  double _calculateAppBarHeight() {
    final physicalHeight = WidgetsBinding.instance.window.physicalSize.height;
    final devicePixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    return physicalHeight / devicePixelRatio;
  }

  @override
  State<SearcherAppBar> createState() => _SearcherAppBarState();
}

class _SearcherAppBarState extends State<SearcherAppBar> {
  final fieldFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    fieldFocus.addListener(() {
      if (fieldFocus.hasFocus) {
        widget.controller.getSearches();
        widget.controller.adjustAppBarHeight(widget.preferredSize.height);
      } else {
        widget.controller.resetAppBarHeight();
      }
    });
  }

  @override
  void dispose() {
    fieldFocus.dispose();
    super.dispose();
  }

  _onBackPressed() {
    if (fieldFocus.hasFocus) {
      fieldFocus.unfocus();
    } else if (Modular.to.path == Pages.search.toString()) {
      widget.controller.backPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    Widget? leading = Padding(
      padding: const EdgeInsets.only(top: 24),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: _onBackPressed,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24,
        ),
      ),
    );

    bool impliesAppBarDismissal = parentRoute?.impliesAppBarDismissal ?? false;
    bool hasFocus = fieldFocus.hasFocus;

    double searchFieldWidth = screenWidth -
        ((impliesAppBarDismissal || hasFocus) ? 64 : 32) -
        (widget.showFilter ? 56 : 0);

    return ValueListenableBuilder(
      valueListenable: widget.controller.appbarHeight,
      builder: (_, height, __) => Container(
        color: AppColors.primary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (impliesAppBarDismissal || hasFocus) leading,
                SizedBox(
                  width: searchFieldWidth,
                  child: ValueListenableBuilder(
                      valueListenable: widget.controller.showCloseButton,
                      builder: (_, showButton, __) {
                        return SearcherField(
                          onClosePressed: () {
                            fieldFocus.unfocus();
                            widget.controller.clearAndBackToDashboard();
                          },
                          showCloseButton: widget.controller.showCloseButton.value,
                          controller: widget.controller.textController,
                          focus: fieldFocus,
                          onChanged: (text) =>
                              widget.controller.toggleCloseButtonVisibility(text.isNotEmpty),
                          onFieldSubmitted: (text) {
                            fieldFocus.unfocus();
                            widget.controller.doSearch(text);
                            if (widget.onSearch != null) widget.onSearch!(text);
                          },
                        );
                      }),
                ),
                if (widget.showFilter) const SearchFilterButton(),
              ],
            ),
            const SizedBox(height: 10),
            if (fieldFocus.hasFocus)
              ValueListenableBuilder(
                valueListenable: widget.controller.searches,
                builder: (_, searches, ___) {
                  return SearchHistoric(

                    searches: searches,
                    height: height,
                    onPressed: (value) {
                      fieldFocus.unfocus();
                      widget.controller.doSearch(value);
                        if (widget.onSearch != null) widget.onSearch!(value);
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
