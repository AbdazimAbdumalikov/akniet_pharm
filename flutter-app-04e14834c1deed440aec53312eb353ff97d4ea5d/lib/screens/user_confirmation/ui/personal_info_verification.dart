// import 'dart:io';

// import 'package:europharm_flutter/generated/l10n.dart';
// import 'package:europharm_flutter/network/models/dto_models/response/marks_response.dart';
// import 'package:europharm_flutter/network/repository/global_repository.dart';
// import 'package:europharm_flutter/screens/user_confirmation/bloc/bloc_verification.dart';
// import 'package:europharm_flutter/screens/user_confirmation/ui/_vmodel.dart';
// import 'package:europharm_flutter/screens/user_confirmation/ui/id_verification.dart';
// import 'package:europharm_flutter/screens/user_confirmation/ui/successful_screen.dart';
// import 'package:europharm_flutter/styles/color_palette.dart';
// import 'package:europharm_flutter/styles/text_styles.dart';
// import 'package:europharm_flutter/utils/app_router.dart';
// import 'package:europharm_flutter/widgets/app_bottom_sheets/app_dialog.dart';
// import 'package:europharm_flutter/widgets/custom_app_bar.dart';
// import 'package:europharm_flutter/widgets/main_button/main_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:loader_overlay/loader_overlay.dart';

// class PersonalInfoVerification extends StatefulWidget {
//   const PersonalInfoVerification({Key? key}) : super(key: key);

//   @override
//   _PersonalInfoVerificationState createState() =>
//       _PersonalInfoVerificationState();
// }

// class _PersonalInfoVerificationState extends State<PersonalInfoVerification> {
//   PersonalInfoVModel? _vmodel;

//   @override
//   void initState() {
//     super.initState();
//     _vmodel = PersonalInfoVModel(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoaderOverlay(
//       child: BlocProvider<BlocVerification>(
//         create: (context) =>
//             BlocVerification(repository: context.read<GlobalRepository>())
//               ..add(EventInitialVerification()),
//         child: Scaffold(
//           appBar: CustomAppBar(
//             title: S.of(context).verification,
//             rootNavigator: true,
//             bottom: const _BuildProgress(),
//             height: 110,
//           ),
//           body: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 10.0,
//               vertical: 16.0,
//             ),
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 60.0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         BlocConsumer<BlocVerification, StateBlocVerification>(
//                           builder: (context, state) {
//                             if (state is StateVerificationFirstStep) {
//                               return _BuildFirstStep(vmodel: _vmodel!);
//                             }
//                             if (state is StateVerificationSecondStep) {
//                               return _BuildSecondStep(
//                                 vmodel: _vmodel!,
//                                 state: state,
//                               );
//                             }
//                             if (state is StateVerificationThirdStep) {
//                               return _BuildThirdStep(
//                                 vmodel: _vmodel!,
//                               );
//                             }
//                             if (state is StateVerificationFourthStep) {
//                               return _BuildFourthStep(
//                                 vmodel: _vmodel!,
//                                 marks: state.marks.toSet().toList(),
//                               );
//                             }
//                             return const SizedBox.shrink();
//                           },
//                           listener: (context, state) {
//                             if (state is StateVerificationLoading) {
//                               context.loaderOverlay.show();
//                             } else {
//                               context.loaderOverlay.hide();
//                             }
//                             if (state is StateVerificationError) {
//                               showAppDialog(
//                                 context,
//                                 body: state.error.message,
//                               );
//                             }
//                             if (state is StateSuccessfulVerification) {
//                               AppRouter.push(context, const SuccessfulScreen());
//                             }
//                           },
//                           buildWhen: (p, c) =>
//                               c is! StateVerificationError ||
//                               c is! StateVerificationLoading,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   left: 0,
//                   child: BlocConsumer<BlocVerification, StateBlocVerification>(
//                     builder: (context, state) {
//                       return _BuildFooter(
//                         state: state,
//                         vmodel: _vmodel!,
//                       );
//                     },
//                     listener: (context, state) {},
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _BuildProgress extends StatelessWidget implements PreferredSizeWidget {
//   const _BuildProgress({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BlocBuilder<BlocVerification, StateBlocVerification>(
//           builder: (context, state) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(6),
//                     child: LinearProgressIndicator(
//                       value: _progressValue(state),
//                       backgroundColor: ColorPalette.lightGrey,
//                       valueColor:
//                           const AlwaysStoppedAnimation(ColorPalette.main),
//                       minHeight: 6,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         S.of(context).personal_data,
//                         style: ProjectTextStyles.ui_16Medium.copyWith(
//                           color: ColorPalette.main,
//                         ),
//                       ),
//                       Text(
//                         S.of(context).steps_count(
//                               _progressValue(state) == 0.25
//                                   ? 1
//                                   : _progressValue(state) == 0.5
//                                       ? 2
//                                       : _progressValue(state) == 0.75
//                                           ? 3
//                                           : 4,
//                             ),
//                         style: ProjectTextStyles.ui_16Medium.copyWith(
//                           color: ColorPalette.main,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             );
//           },
//         )
//       ],
//     );
//   }

//   double _progressValue(state) {
//     if (state is StateVerificationFirstStep) {
//       return 0.25;
//     }
//     if (state is StateVerificationSecondStep) {
//       return 0.5;
//     }
//     if (state is StateVerificationThirdStep) {
//       return 0.75;
//     }
//     if (state is StateVerificationFourthStep) {
//       return 1;
//     }
//     return 0;
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(52);
// }

// class _BuildFirstStep extends StatelessWidget {
//   final PersonalInfoVModel vmodel;

//   const _BuildFirstStep({Key? key, required this.vmodel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         vmodel.firstName,
//         const SizedBox(
//           height: 10,
//         ),
//         vmodel.lastName,
//         const SizedBox(
//           height: 10,
//         ),
//         vmodel.dateOfBirth,
//         const SizedBox(
//           height: 10,
//         ),
//         vmodel.iin,
//       ],
//     );
//   }
// }

// class _BuildSecondStep extends StatelessWidget {
//   final PersonalInfoVModel vmodel;
//   final StateVerificationSecondStep state;

//   const _BuildSecondStep({Key? key, required this.vmodel, required this.state})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         vmodel.carRightsNumber,
//         const SizedBox(
//           height: 10,
//         ),
//         vmodel.carRightsExpire,
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           padding: const EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: ColorPalette.lightGrey,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             children: [
//               if (vmodel.images.isEmpty)
//                 Image.asset(
//                   "assets/images/png/identifications.png",
//                   height: 90,
//                 )
//               else
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2 - 32,
//                       height: 90,
//                       child: Image.file(File(vmodel.images.first)),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2 - 32,
//                       height: 90,
//                       child: Image.file(
//                         File(vmodel.images.last),
//                       ),
//                     ),
//                   ],
//                 ),
//               const SizedBox(
//                 height: 15,
//               ),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: S.of(context).make_photo,
//                       style: ProjectTextStyles.ui_16Medium
//                           .copyWith(color: ColorPalette.darkGrey),
//                     ),
//                     TextSpan(
//                       text: S.of(context).facial_side,
//                       style: ProjectTextStyles.ui_16Medium
//                           .copyWith(color: ColorPalette.main),
//                     ),
//                     TextSpan(
//                       text: S.of(context).and_from,
//                       style: ProjectTextStyles.ui_16Medium
//                           .copyWith(color: ColorPalette.darkGrey),
//                     ),
//                     TextSpan(
//                       text: S.of(context).back_side,
//                       style: ProjectTextStyles.ui_16Medium
//                           .copyWith(color: ColorPalette.main),
//                     ),
//                     TextSpan(
//                       text: S.of(context).side_of_rights,
//                       style: ProjectTextStyles.ui_16Medium
//                           .copyWith(color: ColorPalette.darkGrey),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   AppRouter.push(
//                     context,
//                     const IdVerificationScreen(),
//                     rootNavigator: true,
//                   ).then((value) {
//                     if (value is List<String>) {
//                       vmodel.images = value;
//                       context
//                           .read<BlocVerification>()
//                           .add(EventVerificationSecondStep(idImages: value));
//                     }
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(color: ColorPalette.main),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Text(
//                           S.of(context).photograph,
//                           style: ProjectTextStyles.ui_16Medium.copyWith(
//                             color: ColorPalette.main,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 3,
//                         right: 15,
//                         child: SvgPicture.asset(
//                           "assets/images/svg/arrow_right.svg",
//                           color: ColorPalette.main,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class _BuildThirdStep extends StatefulWidget {
//   final PersonalInfoVModel vmodel;

//   const _BuildThirdStep({Key? key, required this.vmodel}) : super(key: key);

//   @override
//   State<_BuildThirdStep> createState() => _BuildThirdStepState();
// }

// class _BuildThirdStepState extends State<_BuildThirdStep> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 16,
//         ),
//         Container(
//           padding: const EdgeInsets.all(17),
//           decoration: BoxDecoration(
//             color: ColorPalette.lightGrey,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             children: [
//               Image.asset("assets/images/png/verification_image.png"),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 S.of(context).make_rights_with_face_photo,
//                 style: ProjectTextStyles.ui_16Medium.copyWith(
//                   color: ColorPalette.darkGrey,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   final file = await ImagePicker()
//                       .pickImage(source: ImageSource.gallery);
//                   if (file != null) {
//                     setState(() {
//                       widget.vmodel.rightsPicture = file.path;
//                     });
//                   }
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: ColorPalette.main),
//                     color: Colors.transparent,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Text(
//                           S.of(context).photograph,
//                           style: ProjectTextStyles.ui_16Medium.copyWith(
//                             color: ColorPalette.main,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 3,
//                         right: 15,
//                         child: SvgPicture.asset(
//                           "assets/images/svg/arrow_right.svg",
//                           color: ColorPalette.main,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// //123
// class _BuildFourthStep extends StatefulWidget {
//   final PersonalInfoVModel vmodel;
//   final List<Marks> marks;

//   const _BuildFourthStep({Key? key, required this.vmodel, required this.marks})
//       : super(key: key);

//   @override
//   State<_BuildFourthStep> createState() => _BuildFourthStepState();
// }

// class _BuildFourthStepState extends State<_BuildFourthStep> {
//   String markValue = "";

//   @override
//   void initState() {
//     markValue = widget.marks.first.name!;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // vmodel.carType,
//         // DropdownButton(
//         //   items: widget.marks.map((Marks mark) {
//         //     return DropdownMenuItem<String>(
//         //       value: mark.name,
//         //       child: Text(mark.name!),
//         //     );
//         //   }).toList(),
//         //   onChanged: (e) {
//         //     setState(() {
//         //       widget.vmodel.markId = widget.marks
//         //           .firstWhere((element) => element.name == e)
//         //           .id
//         //           .toString();
//         //     });
//         //   },
//         //   // dropdownColor: ,
//         // ),
//         DropdownButtonFormField(
//           dropdownColor: ColorPalette.lightGrey,
//           focusColor: ColorPalette.lightGrey,
//           value: markValue,
//           decoration: InputDecoration(
//             focusColor: ColorPalette.lightGrey,
//             hoverColor: ColorPalette.lightGrey,
//             hintStyle: ProjectTextStyles.ui_16Medium,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide: const BorderSide(
//                 color: Colors.transparent,
//               ),
//               gapPadding: 0.0,
//             ),
//             disabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide: const BorderSide(
//                 color: Colors.transparent,
//               ),
//               gapPadding: 0.0,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide: const BorderSide(
//                 color: Colors.transparent,
//               ),
//               gapPadding: 0.0,
//             ),
//             filled: true,
//             contentPadding: const EdgeInsets.all(16),
//             fillColor: ColorPalette.lightGrey,
//           ),
//           items: widget.marks.map((Marks mark) {
//             return DropdownMenuItem<String>(
//               value: mark.name,
//               child: Text(mark.name!),
//             );
//           }).toList(),
//           validator: (value) {
//             if (value == null) {
//               return 'Выберите марку';
//             }
//             return null;
//           },
//           onChanged: (e) {
//             setState(() {
//               widget.vmodel.markId = widget.marks
//                   .firstWhere((element) => element.name == e)
//                   .id
//                   .toString();
//             });
//           },
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         widget.vmodel.carModel,
//         const SizedBox(
//           height: 10,
//         ),
//         widget.vmodel.carIssueDate,
//         const SizedBox(
//           height: 10,
//         ),
//         widget.vmodel.carDimensions,
//         const SizedBox(
//           height: 10,
//         ),
//         widget.vmodel.governmentNumber,
//         const SizedBox(
//           height: 10,
//         ),
//         widget.vmodel.registrationCertificate,
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           padding: const EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: ColorPalette.lightGrey,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             children: [
//               Text(
//                 S.of(context).load_photo,
//                 style: ProjectTextStyles.ui_16Medium.copyWith(
//                   color: ColorPalette.darkGrey,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: ColorPalette.main),
//                     color: Colors.transparent,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Text(
//                           S.of(context).load_data,
//                           style: ProjectTextStyles.ui_16Medium.copyWith(
//                             color: ColorPalette.main,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 3,
//                         right: 15,
//                         child: SvgPicture.asset(
//                           "assets/images/svg/arrow_right.svg",
//                           color: ColorPalette.main,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//     ;
//   }
// }

// class _BuildFooter extends StatelessWidget {
//   final StateBlocVerification state;
//   final PersonalInfoVModel vmodel;

//   const _BuildFooter({Key? key, required this.state, required this.vmodel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Row(
//         children: [
//           if (state is! StateVerificationFirstStep &&
//               state is! StateVerificationInitial)
//             Row(
//               children: [
//                 MainButton(
//                   buttonHeight: 55,
//                   width: 55,
//                   onTap: () {
//                     if (state is StateVerificationSecondStep) {
//                       context
//                           .read<BlocVerification>()
//                           .add(EventVerificationFirstStep());
//                     }
//                     if (state is StateVerificationThirdStep) {
//                       context
//                           .read<BlocVerification>()
//                           .add(EventVerificationSecondStep());
//                     }
//                     if (state is StateVerificationFourthStep) {
//                       context
//                           .read<BlocVerification>()
//                           .add(EventVerificationThirdStep());
//                     }
//                   },
//                   borderRadius: 10,
//                   borderColor: ColorPalette.main,
//                   color: Colors.transparent,
//                   icon: "assets/images/svg/arrow_left.svg",
//                 ),
//                 const SizedBox(
//                   width: 9,
//                 ),
//               ],
//             )
//           else
//             const SizedBox(),
//           Expanded(
//             child: MainButton(
//               title: S.of(context).next_step,
//               onTap: () {
//                 if (state is StateVerificationFirstStep
//                     // && vmodel.firstStepValidated
//                     ) {
//                   context
//                       .read<BlocVerification>()
//                       .add(EventVerificationSecondStep());
//                 }
//                 if (state is StateVerificationSecondStep
//                     // && vmodel.secondStepValidated
//                     ) {
//                   context
//                       .read<BlocVerification>()
//                       .add(EventVerificationThirdStep());
//                 }
//                 if (state is StateVerificationThirdStep) {
//                   context
//                       .read<BlocVerification>()
//                       .add(EventVerificationFourthStep());
//                 }
//                 if (state is StateVerificationFourthStep
//                     // && vmodel.lastStepValidated
//                     ) {
//                   // AppRouter.push(context, SuccessfulScreen());
//                   context
//                       .read<BlocVerification>()
//                       .add(EventVerificationVerify(vmodel: vmodel));
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
