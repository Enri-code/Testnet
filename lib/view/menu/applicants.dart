import 'package:flutter/material.dart';
import 'package:testnet/models/applicant.dart';
import 'package:testnet/theme/colors.dart';
import 'package:testnet/view/widgets/applicant_widgets.dart';

class ApplicantsPage extends StatefulWidget {
  const ApplicantsPage({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  State<ApplicantsPage> createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  labelText: 'Search Applicants',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Image(
                        image: AssetImage('assets/images/slider_toggles.png')),
                  ),
                ),
                toolbarOptions: const ToolbarOptions(
                    selectAll: true, copy: true, paste: true),
                onSubmitted: (val) {},
              ),
              AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                title: const Text('Applicants'),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    widget.controller.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  },
                ),
              ),
              /* GroupButton(
                buttons: const [
                  'All applicants',
                  'Short Listed','Declined','Unsure',
                ],
                unselectedColor: Colors.grey,
                selectedTextStyle: TextStyle(),
                selectedColor: ColorPalette.secondary,
                borderRadius: BorderRadius.circular(10.0),
                onSelected: (i, isSelected) {},
              ), */
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (_, i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              color: Colors.black12),
                        ],
                      ),
                      child: ApplicantTile(
                        Applicant(
                            id: 0,
                            image: AssetImage(''),
                            location: 'New Jersey',
                            name: 'Eric Oneyrulo'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
