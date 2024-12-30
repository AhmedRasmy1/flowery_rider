import '../cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/app_constants.dart';
import '../widgets/custom_button_navigation_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    return SafeArea(
      child: BlocProvider(
        create: (context) => LayoutCubit(),
        child: const LayoutBody(),
      ),
    );
  }
}

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    // PermissionService.checkLocationServiceAndPermission();

    /// location
    var cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: AppConstants.viewOptions[cubit.index],
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: cubit.index,
            onItemTapped: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
