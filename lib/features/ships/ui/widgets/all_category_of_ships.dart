import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/features/ships/data/models/ship_model.dart';
import 'package:space_app/features/ships/ui/widgets/ships_grid_view.dart';

class AllCategoryOfShips extends StatelessWidget {
  final List<ShipModel> ships;

  const AllCategoryOfShips({
    super.key,
    required this.ships,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 10.h,
        ),
        child: ShipsGridView(ships: ships),
      ),
    );
  }
}
