import 'dart:ui';

import 'package:aifertest/app/module/home/controller/home_controller.dart';
import 'package:aifertest/app/module/home/controller/home_provider.dart';
import 'package:aifertest/app/module/home/model/image_model.dart';
import 'package:aifertest/app/module/home/view/widget/custom_app_bar.dart';
import 'package:aifertest/app/module/home/view/widget/custom_button_widget.dart';
import 'package:aifertest/app/util/app_color.dart';
import 'package:aifertest/app/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'widget/custom_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(homeControllerProvider).getImage(ref, _currentPage);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !ref.read(isLoadingMoreProvider)) {
        _loadMoreImages();
      }
    });
  }

  Future<void> _loadMoreImages() async {
    ref.read(isLoadingMoreProvider.notifier).state = true;
    _currentPage++;
    await ref.read(homeControllerProvider).getImage(ref, _currentPage);
    ref.read(isLoadingMoreProvider.notifier).state = false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeControllerProvider);
    final isLoadingMore = ref.watch(isLoadingMoreProvider);
    final istaped = ref.watch(isblurProvider);

    return DefaultTabController(
      length: 3,
      child: SizedBox(
        child: Column(
          children: [
            customAppbar(),
            const SizedBox(height: 30),
            const CustomTabbar(),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Appcolor.appwhite,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Text(
                            'All Products',
                            style: AppStyle.style2,
                          )),
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        provider.images.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : _buildImage(provider, isLoadingMore, istaped),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildImage(HomeController provider, bool isLoadingMore,
      Map<int, ImageModel> istaped) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: MasonryGridView.builder(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: provider.images.length + (isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < provider.images.length) {
            final image = provider.images[index].urls;
            final imageModel = istaped[index] ?? ImageModel(index: index);
            final idDownloading = imageModel.isDown;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(isblurProvider.notifier).update((state) {
                        final updatedMap = Map<int, ImageModel>.from(state);

                        final currentImageModel = updatedMap[index];
                        if (currentImageModel != null) {
                          updatedMap[index] = ImageModel(
                            index: index,
                            isDown: currentImageModel.isDown,
                            istaped: !currentImageModel.istaped,
                          );
                        } else {
                          updatedMap[index] = ImageModel(
                            index: index,
                            isDown: false,
                            istaped: true,
                          );
                        }

                        return updatedMap;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Image.network(
                            image?.small ?? "",
                            fit: BoxFit.cover,
                          ),
                          if (imageModel.istaped)
                            Positioned.fill(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                            ),
                          if (imageModel.istaped)
                            Positioned.directional(
                              textDirection: TextDirection.ltr,
                              bottom: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: idDownloading
                                    ? const CircularProgressIndicator()
                                    : CustomBtn(
                                        text: 'Download',
                                        onPressed: () {
                                          provider.saveImageToGallery(
                                              image?.small ?? "",
                                              provider.images[index]
                                                      .description ??
                                                  "",
                                              ref,
                                              index,
                                              context);
                                        },
                                      ),
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              '\$${provider.images[index].likes}',
                              style: AppStyle.style2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${provider.images[index].user?.name}',
                          style: AppStyle.style3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.more_horiz)
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
