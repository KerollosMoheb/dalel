import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        colorBehindNavBar: Colors.white,
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: HomeView(),
    ),
    CartView(),
    SearchView(),
    ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.imagesChatInactive),
      icon: SvgPicture.asset(Assets.imagesChatActive),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.imagesShoppingCartInactive),
      icon: SvgPicture.asset(Assets.imagesShoppingCartActive),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.imagesSearchInactive),
      icon: SvgPicture.asset(Assets.imagesSearchActive),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.imagesPersonInactive),
      icon: SvgPicture.asset(Assets.imagesPersonActive),
    ),
  ];
}
