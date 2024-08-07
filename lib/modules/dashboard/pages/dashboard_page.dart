import 'package:corelab_challenge/modules/dashboard/pages/controllers/dashboard_controller.dart';
import 'package:corelab_challenge/modules/shared/domain/enums/pages.dart';
import 'package:corelab_challenge/modules/shared/pages/extensions/date_time_extensions.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/inferior_menu.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/search/searcher_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/pages/styles/colors.dart';
import '../../shared/pages/styles/text_styles.dart';
import '../../shared/pages/widgets/not_found_message.dart';
import '../../shared/pages/widgets/product_item.dart';

class DashboardPage extends StatefulWidget {
  final DashboardController controller;
  const DashboardPage({super.key, required this.controller});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearcherAppBar(controller: Modular.get()),
      bottomNavigationBar: const InferiorMenu(page: Pages.dashboard),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ValueListenableBuilder(
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
                      ? const NotFoundMessage()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                                left: 16,
                                top: 20,
                              ),
                              child: Text(
                                'Últimos anúncios',
                                style: AppTextStyle.lastsAnnouncement,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 237,
                              child: ListView.builder(
                                itemCount: products.length,
                                itemBuilder: (_, i) {
                                  DateTime current = products[i].createdAt!;
                                  bool showDate = i == 0 ||
                                      products[i - 1].createdAt!.toDateString() !=
                                          current.toDateString();

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (showDate) ...[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: Text(
                                            current.toDateString(),
                                            style: AppTextStyle.day,
                                          ),
                                        ),
                                        const Divider(color: AppColors.aliceBlue, height: 0),
                                      ],
                                      ProductItem(
                                        condiction: products[i].condiction!.toString(),
                                        imageURL: products[i].imageURL!,
                                        title: products[i].title!,
                                        discount: products[i].discount!,
                                        price: products[i].price!,
                                      ),
                                    ],
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
      ),
    );
  }
}
