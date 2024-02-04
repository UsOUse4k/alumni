import 'dart:io';

import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_back_button.dart';
import 'package:alumni/core/widget/custom_drop_down.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/profile/domain/model/profile_model.dart';
import 'package:alumni/feauture/profile/domain/model/update_profile_model.dart';
import 'package:alumni/feauture/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({Key? key, this.profileModel}) : super(key: key);

  final ProfileModel? profileModel;

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  XFile? image;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  List<String> educationList = [
    "Среднее-Профессиональное",
    "Бакалавриат",
    "Магистратура",
    "Докторантура",
    "Аспирантура"
  ];

  String? selectedEducation;

  List<String> specialityList = [
    "Программист",
    "Врач",
    "Психолог",
    "Переводчик"
  ];

  String? selectedSpeciality;

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

  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController graduateDataController;
  late TextEditingController locationController;
  late TextEditingController phoneNumberController;
  late TextEditingController placeToWorkController;
  late TextEditingController jobPositionController;
  late TextEditingController shortInfoController;
  late TextEditingController accomplishmentController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.profileModel?.name);
    surnameController =
        TextEditingController(text: widget.profileModel?.surname);
    graduateDataController = TextEditingController(
        text: '${widget.profileModel?.yearOfRelease ?? ''}');
    locationController =
        TextEditingController(text: widget.profileModel?.place);
    phoneNumberController =
        TextEditingController(text: widget.profileModel?.phoneNumber);
    placeToWorkController =
        TextEditingController(text: widget.profileModel?.workPlace);
    jobPositionController =
        TextEditingController(text: widget.profileModel?.positionAtWork);
    shortInfoController =
        TextEditingController(text: widget.profileModel?.shortBiography);
    accomplishmentController =
        TextEditingController(text: widget.profileModel?.educationAndGoals);
    selectedSpeciality = widget.profileModel?.specialty;
    selectedEducation = widget.profileModel?.education;
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    graduateDataController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    placeToWorkController.dispose();
    jobPositionController.dispose();
    shortInfoController.dispose();
    accomplishmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: const CustomBackButton(),
        elevation: 0,
        backgroundColor: NeutralColor.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdateSuccess) {
                showSuccessSnackBar('Успешно обновлен профиль', context);
                context.router.pop();
                context.read<ProfileBloc>().add(GetProfileEvent());
              } else if (state is ProfileError) {
                showErrorSnackBar('Ошибка', context);
              }
            },
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFD9D9D9),
                        ),
                        child: widget.profileModel?.avatar != null &&
                                imageFile == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: widget.profileModel!.avatar!,
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
                                    Icons.person,
                                    color: NeutralColor.white,
                                    size: 100,
                                  ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FilledButton(
                        onPressed: () async {
                          await getImage();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(PrimaryColor.s100),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            )),
                        child: const Text('Добавить фото'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 40,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    hintText: 'Напишите Имя',
                    title: 'Имя',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 40,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    hintText: 'Напишите Фамилия',
                    title: 'Фамилия',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    controller: surnameController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    child: CustomDropDown(
                      onChanged: (value) {
                        selectedEducation = value;
                      },
                      value: selectedEducation,
                      items: educationList.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontFamily: 'Intro',
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                      title: 'Образование',
                      hintText: 'Выберите степень',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: CustomDropDown(
                      onChanged: (value) {
                        selectedSpeciality = value;
                      },
                      value: selectedSpeciality,
                      items: specialityList.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontFamily: 'Intro',
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                      title: 'Специальность',
                      hintText: 'Выберите Специальность',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 40,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    hintText: 'Напишите Год выпуска',
                    title: 'Год выпуска',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    controller: graduateDataController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 40,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    hintText: 'Напишите Местоположение',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    title: 'Местоположение',
                    controller: locationController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 40,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    filledColor: NeutralColor.white,
                    hintText: 'Напишите контактый номер',
                    title: 'Контактный номер',
                    controller: phoneNumberController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 40,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hintText: 'Напишите Место работы',
                    title: 'Место работы',
                    controller: placeToWorkController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 40,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hintText: 'Напишите Должность',
                    title: 'Должность',
                    controller: jobPositionController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 100,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hintText: 'Напишите Краткую информацию',
                    title: 'Краткую информацию',
                    maxLines: 4,
                    controller: shortInfoController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textFormFieldHeight: 100,
                    contentPadding: const EdgeInsets.only(top: 10, left: 10),
                    hintStyle:
                        AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
                    isTextRequired: true,
                    isFilled: true,
                    filledColor: NeutralColor.white,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hintText: 'Напишите про образование и ваши успехи',
                    title: 'Образование и Достижения',
                    maxLines: 4,
                    controller: accomplishmentController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: PrimaryButton(
                      onPressed: () {
                        if (isValidate()) {
                          context.read<ProfileBloc>().add(
                                UpdateProfileEvent(
                                  UpdateProfileModel(
                                      name: nameController.text,
                                      surname: surnameController.text,
                                      education: selectedEducation!,
                                      speciality: selectedSpeciality!,
                                      graduationDate:
                                          graduateDataController.text,
                                      location: locationController.text,
                                      phoneNumber: phoneNumberController.text,
                                      placeToWork: placeToWorkController.text,
                                      jobPosition: jobPositionController.text,
                                      shortInfo: shortInfoController.text,
                                      accomplishment:
                                          accomplishmentController.text,
                                      avatar:
                                          widget.profileModel?.avatar != null
                                              ? imageFile != null
                                                  ? File(imageFile!.path)
                                                  : null
                                              : null),
                                ),
                              );
                        } else {
                          showErrorSnackBar('Заполните все поля', context);
                        }
                      },
                      title: 'Изменить',
                      height: 40,
                      backgroundColor: const Color(0xFF153964),
                      textStyle: AFonts.h2i18.copyWith(
                        color: NeutralColor.white,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool isValidate() {
    return nameController.text.isNotEmpty &&
        surnameController.text.isNotEmpty &&
        selectedEducation != null &&
        selectedSpeciality != null &&
        graduateDataController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        placeToWorkController.text.isNotEmpty &&
        jobPositionController.text.isNotEmpty &&
        shortInfoController.text.isNotEmpty &&
        accomplishmentController.text.isNotEmpty;
  }
}
