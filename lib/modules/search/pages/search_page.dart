import 'package:corelab_challenge/modules/shared/pages/styles/colors.dart';
import 'package:corelab_challenge/modules/shared/pages/styles/text_styles.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/not_found_message.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/domain/enums/pages.dart';
import '../../shared/pages/widgets/inferior_menu.dart';
import '../../shared/pages/widgets/search/searcher_app_bar.dart';
import 'controllers/search_controller.dart';

class SearchPage extends StatefulWidget {
  final SearchPageController controller;
  final String searchQuery;
  const SearchPage({super.key, required this.controller, required this.searchQuery});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.fetchSearch(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearcherAppBar(
        controller: Modular.get(),
        showFilter: true,
        onSearch: (query) {
          widget.controller.clearProducts();
          widget.controller.fetchSearch(query ?? '');
        },
      ),
      bottomNavigationBar: const InferiorMenu(page: Pages.dashboard),
      body: ValueListenableBuilder(
        valueListenable: widget.controller.isLoading,
        builder: (_, loading, __) {
          if (loading.isLoading || loading.isIdle) {
            return const Center(child: CircularProgressIndicator());
          } else if (loading.isError) {
            return const NotFoundMessage();
          } else {
            return ValueListenableBuilder(
              valueListenable: widget.controller.products,
              builder: (_, products, __) {
                return products.isEmpty
                    ? NotFoundMessage(searchText: widget.controller.searchQuery)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              left: 16,
                              top: 20,
                            ),
                            child: Text(
                              '${products.length} resultados encontrados',
                              style: AppTextStyle.productsLength,
                            ),
                          ),
                          const Divider(color: AppColors.aliceBlue, height: 0),
                          Expanded(
                            child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (_, i) {
                                return ProductItem(
                                  condiction: products[i].condiction!.toString(),
                                  imageURL: products[i].imageURL!,
                                  title: products[i].title!,
                                  discount: products[i].discount!,
                                  price: products[i].price!,
                                );
                              },
                            ),
                          ),
                        ],
                      );
              },
            );
          }
        },
      ),
    );
  }
}