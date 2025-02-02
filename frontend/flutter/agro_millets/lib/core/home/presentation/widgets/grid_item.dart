import 'package:agro_millets/core/home/presentation/detail/item_detail.dart';
import 'package:agro_millets/globals.dart';
import 'package:agro_millets/models/millet_item.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GridItem extends StatelessWidget {
  final int index;
  final MilletItem item;

  const GridItem({
    super.key,
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.5 * getWidth(context),
      height:
          index % 2 == 0 ? 0.2 * getHeight(context) : 0.3 * getHeight(context),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                goToPage(context, ItemDetailPage(item: item));
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      offset: const Offset(5.0, 5.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0),
                          ),
                          child: Image.network(
                            item.images[0].toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey.withOpacity(0.2),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 0.5 * constraints.maxWidth,
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: null,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "₹ ${item.price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ]),
                    ],
                  );
                }),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () async {
                showToast("Added to cart");
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      offset: const Offset(0.0, 0.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Icon(
                  MdiIcons.cartPlus,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
