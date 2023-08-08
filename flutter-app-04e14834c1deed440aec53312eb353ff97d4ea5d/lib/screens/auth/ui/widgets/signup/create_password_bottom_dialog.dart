part of './phone_bottom_dialog.dart';

void showCreatePasswordBottomDialog(BuildContext context, SignUpVModel vModel) {
  showAppBottomSheet(context,
      initialChildSize: 0.45,
      useRootNavigator: true,
      child: _BuildCreatePasswordField(
        vmodel: vModel,
      ));
}

class _BuildCreatePasswordField extends StatefulWidget {
  final SignUpVModel vmodel;

  const _BuildCreatePasswordField({Key? key, required this.vmodel})
      : super(key: key);

  @override
  _BuildCreatePasswordFieldState createState() =>
      _BuildCreatePasswordFieldState();
}

class _BuildCreatePasswordFieldState extends State<_BuildCreatePasswordField> {
  late final SignUpVModel _vmodel;

  @override
  void initState() {
    _vmodel = widget.vmodel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpVModel>.value(
      value: _vmodel,
      child: AppLoaderOverlay(
        child: BlocConsumer<BlocAuth, StateBlocAuth>(
          listener: (context, state) async {
            if (state is StateAuthLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
            if(state is StateRegisterConfirmSuccess){
              Navigator.of(context, rootNavigator: true).pop();
              showReferalCodeBottomDialog(context, widget.vmodel);
            }
            if (state is StateAuthError) {
              showAppDialog(
                context,
                body: state.error.message,
                onTap: () => context.read<BlocAuth>().add(EventAuthInit())
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<SignUpVModel, _StateVModel>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).create_password,
                        style: ProjectTextStyles.ui_20Medium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      widget.vmodel.password,
                      const SizedBox(
                        height: 20,
                      ),
                      widget.vmodel.repeatPassword,
                      const SizedBox(
                        height: 20,
                      ),
                      MainButton(
                        title: S.of(context).next,
                        onTap: () {
                          if (widget.vmodel.password.validated &&
                              widget.vmodel.repeatPassword.validated) {
                            context.read<BlocAuth>().add(EventRegisterConfirm(password: _vmodel.password.controller.text));
                          }
                        },
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
