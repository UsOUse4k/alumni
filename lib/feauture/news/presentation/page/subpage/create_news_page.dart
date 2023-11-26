import 'dart:io';

import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/news/domain/model/create_news/create_news.dart';
import 'package:alumni/feauture/news/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:alumni/feauture/news/presentation/widget/create_new_image_card.dart';
import 'package:alumni/feauture/news/presentation/widget/upload_image_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../../../../core/theme/a_fonts.dart';

@RoutePage()
class CreateNewsPage extends StatefulWidget {
  const CreateNewsPage({Key? key}) : super(key: key);

  @override
  State<CreateNewsPage> createState() => _CreateNewsPageState();
}

class _CreateNewsPageState extends State<CreateNewsPage> {
  XFile? image;
  File? imageFile;

  final ImagePicker _picker = ImagePicker();

  late TextEditingController titleController;
  late TextEditingController paragraphController;

  List<TextEditingController> titleListController = [];
  List<TextEditingController> paragraphListController = [];
  List<XFile> imagesList = <XFile>[];

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
    titleController = TextEditingController();
    paragraphController = TextEditingController();
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
        backgroundColor: NeutralColor.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is CreateNewsSuccess) {
              showSuccessSnackBar('Новость успешно создано', context);
              context.router.pop();
            } else if (state is NewsError) {
              showErrorSnackBar(state.message, context);
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
                        child: imageFile != null
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
                      const Text(
                        'Картинки',
                        style: TextStyle(
                          fontFamily: 'Intro',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      imagesList.isEmpty
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
                                    padding: const EdgeInsets.only(right: 10),
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
                                  CreateNewsEvent(
                                    CreateNewsModel(
                                      poster: imageFile!,
                                      title: titleController.text,
                                      paragraph: paragraphController.text,
                                      content: contents,
                                      images: imagesList,
                                    ),
                                  ),
                                );
                          },
                          title: 'Опубликовать',
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
        titleListController.isNotEmpty &&
        paragraphListController.isNotEmpty &&
        titleController.text.isNotEmpty &&
        paragraphController.text.isNotEmpty &&
        imagesList.isNotEmpty;
  }
}
