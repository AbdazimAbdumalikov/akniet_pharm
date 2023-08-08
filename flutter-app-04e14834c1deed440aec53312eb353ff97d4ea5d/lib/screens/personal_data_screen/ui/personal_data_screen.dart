import 'dart:io';
import 'dart:ui';

import 'package:europharm_flutter/generated/l10n.dart';
import 'package:europharm_flutter/main.dart';
import 'package:europharm_flutter/main/login_bloc/login_bloc.dart';
import 'package:europharm_flutter/network/models/dto_models/response/cities_response.dart';
import 'package:europharm_flutter/network/models/user_dto.dart';
import 'package:europharm_flutter/screens/personal_data_screen/bloc/bloc_personal_data.dart';
import 'package:europharm_flutter/screens/personal_data_screen/ui/widgets/_vmodel.dart';
import 'package:europharm_flutter/screens/profile_screen/bloc/profile_bloc.dart';
import 'package:europharm_flutter/styles/color_palette.dart';
import 'package:europharm_flutter/styles/text_styles.dart';
import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
import 'package:europharm_flutter/widgets/app_loader_overlay.dart';
import 'package:europharm_flutter/widgets/custom_app_bar.dart';
import 'package:europharm_flutter/widgets/dialogs/two_buttons_dialog.dart';
import 'package:europharm_flutter/widgets/main_button/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDataScreen extends StatefulWidget {
  final UserDTO? user;
  const PersonalDataScreen({
    this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final PersonalDataVModel _vmodel = PersonalDataVModel();

  @override
  void initState() {
    BlocProvider.of<BlocPersonalData>(context).add(EventInitialPersonalData());
    _vmodel.user = widget.user;
    _vmodel.initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLoaderOverlay(
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).personal_data,
        ),
        backgroundColor: ColorPalette.background,
        body: BlocConsumer<BlocPersonalData, StateBlocPersonalData>(
          listener: (context, state) {
            if (state is StateLoadingPersonalData) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if (state is StatePersonalDataError) {
              showAppDialog(
                context,
                body: state.error.message,
              );
            }

            if (state is StateSuccessfullyAccountDeleted) {
              context.read<LoginBloc>().add(LogOutEvent());
              RestartWidget.restartApp(context);
            }

            if (state is StateSuccessfullyEditedProfile) {
              Navigator.pop(context);
              BlocProvider.of<ProfileBloc>(context).add(ProfileEventInitial());
            }
          },
          buildWhen: (p, c) => c is StateReadDataPersonalInfo,
          builder: (context, state) {
            if (state is StateReadDataPersonalInfo) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: _BuildAvatar(
                          vModel: _vmodel,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _BuildPersonalData(
                        vmodel: _vmodel,
                        cities: state.cities,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorPalette.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).contacts,
                              style: ProjectTextStyles.ui_20Medium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // Text(
                            //   S.of(context).email,
                            //   style: ProjectTextStyles.ui_16Medium,
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // _vmodel.email,
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            Text(
                              S.of(context).phone_number,
                              style: ProjectTextStyles.ui_16Medium,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            _vmodel.phoneNumber,
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorPalette.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).password,
                              style: ProjectTextStyles.ui_20Medium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              S.of(context).current_password,
                              style: ProjectTextStyles.ui_16Medium,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            _vmodel.currentPassword,
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              S.of(context).new_password,
                              style: ProjectTextStyles.ui_16Medium,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            _vmodel.newPassword,
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              S.of(context).repeat_password,
                              style: ProjectTextStyles.ui_16Medium,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            _vmodel.repeatPassword,
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MainButton(
                        onTap: () => context.read<BlocPersonalData>().add(
                              EventEditProfile(
                                vModel: _vmodel,
                              ),
                            ),
                        color: ColorPalette.main,
                        title: "Сохранить",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return TwoButtonsDialog(
                                  title: 'Внимание!',
                                  subtitle: 'Вы точно хотите удалить аккаунт?',
                                  firstButtonText: 'Нет',
                                  secondButtonText: 'Да',
                                  onFirstTap: () {
                                    Navigator.pop(context);
                                  },
                                  onSecondTap: () {
                                    context
                                        .read<BlocPersonalData>()
                                        .add(EventDeleteAccount());
                                  },
                                );
                              });
                        },
                        child: Text(
                          'Удалить аккаунт',
                          style: ProjectTextStyles.ui_16Medium.copyWith(
                              decoration: TextDecoration.underline,
                              color: ColorPalette.red),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 85,
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _BuildAvatar extends StatefulWidget {
  final PersonalDataVModel vModel;

  const _BuildAvatar({Key? key, required this.vModel}) : super(key: key);

  @override
  State<_BuildAvatar> createState() => _BuildAvatarState();
}

class _BuildAvatarState extends State<_BuildAvatar> {
  String imagePath = "";

  @override
  void initState() {
    imagePath = widget.vModel.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          debugPrint(image.toString());
          setState(() {
            imagePath = image.path;
            widget.vModel.image = imagePath;
          });
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Stack(
          children: [
            const SizedBox(
              width: 105,
              height: 105,
            ),
            if (imagePath.isNotEmpty)
              Container(
                height: 105,
                width: 105,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: FileImage(File(imagePath)),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              )
            else
              Image.asset(
                "assets/images/png/profile_photo.png",
                width: 105,
                height: 105,
                fit: BoxFit.cover,
              ),
            Positioned(
              top: 78,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(50, 50, 50, 0.4),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 6,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/svg/camera.svg"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      S.of(context).load_data,
                      textAlign: TextAlign.center,
                      style: ProjectTextStyles.ui_10Regular.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorPalette.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BuildPersonalData extends StatefulWidget {
  final PersonalDataVModel vmodel;
  final CitiesResponse cities;

  const _BuildPersonalData({
    Key? key,
    required this.vmodel,
    required this.cities,
  }) : super(key: key);

  @override
  State<_BuildPersonalData> createState() => _BuildPersonalDataState();
}

class _BuildPersonalDataState extends State<_BuildPersonalData> {
  String? cityValue;

  @override
  void initState() {
    super.initState();
    cityValue = widget.cities.data!.first.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).personal_data,
            style: ProjectTextStyles.ui_20Medium,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            S.of(context).first_name,
            style: ProjectTextStyles.ui_16Medium,
          ),
          const SizedBox(
            height: 5,
          ),
          widget.vmodel.name,
          const SizedBox(
            height: 15,
          ),
          Text(
            S.of(context).last_name,
            style: ProjectTextStyles.ui_16Medium,
          ),
          const SizedBox(
            height: 5,
          ),
          widget.vmodel.lastName,
          const SizedBox(
            height: 15,
          ),
          // Text(
          //   S.of(context).country,
          //   style: ProjectTextStyles.ui_16Medium,
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // widget.vmodel.country,
          // const SizedBox(
          //   height: 15,
          // ),
          Text(
            S.of(context).city,
            style: ProjectTextStyles.ui_16Medium,
          ),
          const SizedBox(
            height: 5,
          ),
          // vmodel.city,
          DropdownButtonFormField(
            iconSize: 20,
            value: cityValue,
            decoration: const InputDecoration(
              hintStyle: ProjectTextStyles.ui_16Medium,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: ColorPalette.commonGrey,
                  width: 1,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: Colors.white,
            ),
            items: widget.cities.data!.map((CityData country) {
              return DropdownMenuItem<String>(
                value: country.name,
                child: Text(country.name!),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Выберите город';
              }
              return null;
            },
            onChanged: (e) {
              setState(() {
                cityValue = e.toString();
                widget.vmodel.cityId = widget.cities.data!
                    .firstWhere((element) => element.name == cityValue)
                    .countryId!;
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          // Text(
          //   S.of(context).company_name,
          //   style: ProjectTextStyles.ui_16Medium,
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // widget.vmodel.companyName,
          // const SizedBox(
          //   height: 15,
          // ),
          // Text(
          //   S.of(context).referal_code,
          //   style: ProjectTextStyles.ui_16Medium,
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // widget.vmodel.referalCode,
        ],
      ),
    );
  }
}
