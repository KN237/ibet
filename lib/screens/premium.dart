import 'package:Ibet/models/fixtures.dart';
import 'package:flutter/material.dart';
import 'package:Ibet/helpers/frontHelpers.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:Ibet/widgets.dart';
import '../models/league.dart';

class Premium extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FrontHelpers().gris,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.3,
                  child: Center(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _buildFixtures();
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }

}

class _buildFixtures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MatchCard(isPremium: true,);
  }
}
