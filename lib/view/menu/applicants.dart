import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:testnet/domain/data.dart';
import 'package:testnet/models/applicant.dart';
import 'package:testnet/theme/colors.dart';
import 'package:testnet/view/widgets/applicant_widgets.dart';
import 'package:testnet/view/widgets/load_error.dart';

class ApplicantsPage extends StatefulWidget {
  const ApplicantsPage({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  State<ApplicantsPage> createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage>
    with SingleTickerProviderStateMixin {
  final tabController = GroupButtonController(selectedIndex: 0);
  final pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: 'Search Applicants',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          image:
                              AssetImage('assets/images/slider_toggles.png')),
                    ),
                  ),
                  toolbarOptions: const ToolbarOptions(
                      selectAll: true, copy: true, paste: true),
                  onSubmitted: (val) {},
                ),
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
              GroupButton(
                controller: tabController,
                buttons: const [
                  'All applicants',
                  'Short Listed',
                  'Declined',
                  'Unsure',
                ],
                options: GroupButtonOptions(
                  elevation: 0,
                  selectedShadow: [],
                  unselectedShadow: [],
                  unselectedColor: Colors.grey,
                  mainGroupAlignment: MainGroupAlignment.spaceBetween,
                  selectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 10),
                  unselectedTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 12),
                  selectedColor: ColorPalette.secondary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onSelected: (_, i, __) {
                  pageController.animateToPage(i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    _ApplicantTab(subUrl: ''),
                    _ApplicantTab(subUrl: ''),
                    _ApplicantTab(subUrl: ''),
                    _ApplicantTab(subUrl: ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplicantTab extends StatefulWidget {
  const _ApplicantTab({Key? key, required this.subUrl}) : super(key: key);
  final String subUrl;

  @override
  State<_ApplicantTab> createState() => _ApplicantTabState();
}

class _ApplicantTabState extends State<_ApplicantTab> {
  Future<List<Applicant>>? data;
  var loading = false;

  @override
  void initState() {
    data = DataApi.getApplicants(1);
    loading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (_, AsyncSnapshot<List<Applicant>> shot) {
        if (shot.hasData) {
          loading = false;

          return ListView.builder(
            itemCount: shot.data!.length,
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
                child: ApplicantTile(shot.data![i]),
              );
            },
          );
        }
        if (shot.hasError && !loading) {
          return LoadStateWidget(
            shot.hasError,
            onReload: () {
              setState(() {
                data = DataApi.getApplicants(1);
              });
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
