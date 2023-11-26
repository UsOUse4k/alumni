import 'dart:io';

import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/admin.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/news/domain/model/create_news/create_news.dart';
import 'package:alumni/feauture/news/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:alumni/feauture/news/presentation/widget/create_new_image_card.dart';
import 'package:alumni/feauture/news/presentation/widget/upload_image_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/model/news_detail/news_detail_model.dart'
    as news_detail;

@RoutePage()
class UpdateNewsPage extends StatefulWidget {
  const UpdateNewsPage({Key? key, this.newsDetailModel}) : super(key: key);

  final news_detail.NewsDetailModel? newsDetailModel;

  @override
  State<UpdateNewsPage> createState() => _UpdateNewsPageState();
}

class _UpdateNewsPageState extends State<UpdateNewsPage> {
  XFile? image;
  File? imageFile;

  final ImagePicker _picker = ImagePicker();

  late TextEditingController titleController;
  late TextEditingController paragraphController;

  List<TextEditingController> titleListController = [];
  List<TextEditingController> paragraphListController = [];
  List<XFile> imagesList = <XFile>[];
  List<String> imagesFromInternet = [];

  getImage() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        imageFile = File(image.path);
      });
    } catch (_) {}
    return imageFile;
  }

  Future<void> pickMultipleImages() async {
    List<XFile> resultList = <XFile>[];
    try {
      resultList = await _picker.pickMultiImage();
      if (resultList.isEmpty) return;
    } on Exception catch (e) {}
    if (!mounted) return;

    setState(() {
      imagesList = resultList;
    });
  }

  @override
  void initState() {
    titleController =
        TextEditingController(text: widget.newsDetailModel?.title);
    paragraphController =
        TextEditingController(text: widget.newsDetailModel?.shortDescribe);

    imagesFromInternet = widget.newsDetailModel?.newsImages ?? [];

    for (int i = 0; i < widget.newsDetailModel!.content!.length; i++) {
      titleListController.add(TextEditingController(
          text: widget.newsDetailModel!.content![i].title));
      paragraphListController.add(TextEditingController(
          text: widget.newsDetailModel!.content![i].paragraph));
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    paragraphController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        actions: [
          Visibility(
            visible: Admin.isAdmin ?? false ? true : false,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PrimaryButton(
                width: 180,
                height: 30,
                backgroundColor: const Color(0xFF992124),
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => showNewsDeleteOnConfirm(context),
                  );
                },
                title: 'Удалить новость',
                textStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Intro',
                    fontWeight: FontWeight.w800,
                    color: NeutralColor.white),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is UpdateNewsSuccess) {
              showSuccessSnackBar('Успешно изменена новость', context);
              context.router.pop();
              context
                  .read<NewsBloc>()
                  .add(GetDetailNewsEvent(widget.newsDetailModel!.id!));
            } else if (state is NewsError) {
              showErrorSnackBar(state.message, context);
            } else if (state is NewsDeleteSuccess) {
              showSuccessSnackBar('Новость успешно удалена', context);
              context.router.replace(const HomeRoute());
            }
          },
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFCCCCCC),
                        ),
                        child: widget.newsDetailModel?.poster != null &&
                                imageFile == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      widget.newsDetailModel?.poster ?? '',
                                  fit: BoxFit.cover,
                                  errorWidget: (context, _, __) =>
                                      const Icon(Icons.error),
                                ),
                              )
                            : imageFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.image,
                                    color: NeutralColor.white,
                                    size: 100,
                                  ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: PrimaryButton(
                          onPressed: () async {
                            await getImage();
                          },
                          title: 'Добавить фото',
                          backgroundColor: const Color(0xFF153964),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        title: 'Заголовок новости',
                        textFormFieldHeight: 40,
                        controller: titleController,
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 10),
                        hintStyle: AFonts.r0i15
                            .copyWith(color: const Color(0xFFBCBCBC)),
                        isTextRequired: true,
                        isFilled: true,
                        filledColor: NeutralColor.white,
                        hintText: 'Напишите Заголовок',
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        title: 'Описание',
                        controller: paragraphController,
                        textFormFieldHeight: 80,
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 10),
                        hintStyle: AFonts.r0i15
                            .copyWith(color: const Color(0xFFBCBCBC)),
                        isTextRequired: true,
                        isFilled: true,
                        filledColor: NeutralColor.white,
                        hintText: 'Напишите описание',
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Картинки',
                            style: TextStyle(
                              fontFamily: 'Intro',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              imagesFromInternet.clear();
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      imagesFromInternet.isNotEmpty
                          ? SizedBox(
                              height: 210,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imagesFromInternet.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      height: 200,
                                      width: 230,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: imagesFromInternet[index],
                                          errorWidget: (context, _, __) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : imagesList.isEmpty
                              ? UploadImageCard(
                                  onPressed: () async {
                                    await pickMultipleImages();
                                  },
                                )
                              : SizedBox(
                                  height: 210,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imagesList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CreateNewImageCard(
                                          imagePath: imagesList[index].path,
                                          deleteImage: () {
                                            imagesList.removeAt(index);
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: titleListController.length,
                    (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            title: 'Заголовок',
                            controller: titleListController[index],
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 10),
                            hintStyle: AFonts.r0i15
                                .copyWith(color: const Color(0xFFBCBCBC)),
                            isTextRequired: true,
                            isFilled: true,
                            filledColor: NeutralColor.white,
                            hintText: 'Напишите описание',
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            title: 'Обзац',
                            textFormFieldHeight: 120,
                            maxLines: 10,
                            controller: paragraphListController[index],
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 10),
                            hintStyle: AFonts.r0i15
                                .copyWith(color: const Color(0xFFBCBCBC)),
                            isTextRequired: true,
                            isFilled: true,
                            filledColor: NeutralColor.white,
                            hintText: 'Напишите обзац',
                            textInputAction: TextInputAction.newline,
                            textInputType: TextInputType.name,
                          )
                        ],
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: PrimaryButton(
                          height: 30,
                          onPressed: () {
                            titleListController.add(
                              TextEditingController(),
                            );
                            paragraphListController.add(
                              TextEditingController(),
                            );
                            setState(() {});
                          },
                          title: 'Добавить обзац',
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Intro',
                            color: NeutralColor.white,
                            fontWeight: FontWeight.w700,
                          ),
                          backgroundColor: const Color(0xFF153964),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: PrimaryButton(
                          height: 40,
                          onPressed: () async {
                            if (isValidate()) {
                              List<Content> contents = [];

                              for (int i = 0;
                                  i < titleListController.length;
                                  i++) {
                                contents.add(
                                  Content(
                                    title: titleListController[i].text,
                                    paragraph: paragraphListController[i].text,
                                  ),
                                );
                              }

                              context.read<NewsBloc>().add(
                                    UpdateNewsEvent(
                                        CreateNewsModel(
                                          poster: imageFile,
                                          title: titleController.text,
                                          paragraph: paragraphController.text,
                                          content: contents,
                                          images: imagesList,
                                        ),
                                        widget.newsDetailModel?.id ?? ''),
                                  );
                            } else {
                              showErrorSnackBar("Заполните все поля", context);
                            }
                          },
                          title: 'Изменить',
                          backgroundColor: const Color(0xFF153964),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  bool isValidate() {
    return imageFile != null &&
        titleController.text.isNotEmpty &&
        paragraphController.text.isNotEmpty &&
        titleListController.isNotEmpty &&
        paragraphListController.isNotEmpty &&
        imagesList.isNotEmpty;
  }

  Widget showNewsDeleteOnConfirm(BuildContext context) {
    return AlertDialog(
      backgroundColor: NeutralColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Удаление новости',
        style: TextStyle(
          fontFamily: 'Intro',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Вы точно хотите удалить новость ?',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Intro'),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        PrimaryButton(
          width: 100,
          backgroundColor: const Color(0xFF153964),
          onPressed: () {
            context.router.pop();
          },
          elevation: 0,
          title: 'Нет',
        ),
        PrimaryButton(
          width: 100,
          onPressed: () {
            context.read<NewsBloc>().add(
                  DeleteNewsEvent(
                    widget.newsDetailModel?.id ?? '',
                  ),
                );
            context.router.pop();
          },
          title: 'Да',
          elevation: 0,
          backgroundColor: const Color(0xFFDFDFDF),
          textStyle: const TextStyle(
              fontFamily: 'Intro',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF153964)),
        ),
      ],
    );
  }
}
