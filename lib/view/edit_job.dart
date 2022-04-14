import 'package:flutter/material.dart';
import 'package:testnet/models/job.dart';

class EditJobScreen extends StatefulWidget {
  static const route = '/edit_job_screen';
  const EditJobScreen({Key? key}) : super(key: key);

  @override
  State<EditJobScreen> createState() => _EditJobScreenState();
}

class _EditJobScreenState extends State<EditJobScreen> {
  static const _titleStyle =
          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      _subtitleStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w300);


  final formKey = GlobalKey<FormState>();
  late Job data;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = ModalRoute.of(context)!.settings.arguments as Job;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Edit Job Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child:
                TextButton(onPressed: () {}, child: const Text('Delete Job')),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text('Role Details', style: _titleStyle),
                    const SizedBox(height: 16),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _TextField(
                            hint: data.name,
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 16),
                          _TextField(
                            hint: data.location,
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 26),
                          const Text('Job Details', style: _titleStyle),
                          const SizedBox(height: 16),
                          const Text('Pay', style: _subtitleStyle),
                          const SizedBox(height: 2),
                          _TextField(
                            hint: data.rate,
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 16),
                          const Text('Job type', style: _subtitleStyle),
                          const SizedBox(height: 2),
                          _TextField(
                            hint: data.jobType,
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 16),
                          const Text('Number of openings for this position',
                              style: _subtitleStyle),
                          const SizedBox(height: 2),
                          _TextField(
                            hint: r'2',
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 16),
                          const Text('Schedule', style: _subtitleStyle),
                          const SizedBox(height: 2),
                          _TextField(
                            hint: r'8 hour shift',
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 24),
                          const _ExtrasSection(
                            title: Text('Benefits', style: _titleStyle),
                            tag: Text('+ Tuition Reimbursement'),
                          ),
                          const SizedBox(height: 24),
                          const _ExtrasSection(
                            title: Text('Supplemental pay', style: _titleStyle),
                            tag: Text('+ Signing Bonus'),
                          ),
                          const SizedBox(height: 24),
                          const Text('Job Settings', style: _titleStyle),
                          const SizedBox(height: 16),
                          const Text('Country and language',
                              style: _subtitleStyle),
                          const SizedBox(height: 2),
                          _TextField(
                            hint: r'United States, English',
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 16),
                          const Text('Promotion location',
                              style: _subtitleStyle),
                          const SizedBox(height: 2),
                          _TextField(
                            hint: r'Remote',
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 16),
                          const Text('Expect to hire within',
                              style: _subtitleStyle),
                          const SizedBox(height: 2),
                          _TextField(
                            hint: r'1 to 3 days',
                            onChanged: (_) {},
                          ),
                          const SizedBox(height: 220),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            child: const Text('Save Changes'),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: const Color(0xffB6B7B7),
                            ),
                            child: const Text('Back'),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExtrasSection extends StatelessWidget {
  const _ExtrasSection({Key? key, required this.title, required this.tag})
      : super(key: key);

  final Text title, tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 16, 4),
      decoration: BoxDecoration(
        color: const Color(0xffECDFFF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.visibility_off),
              const SizedBox(width: 8),
              title
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(24),
            ),
            child: tag,
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(onPressed: () {}, child: const Text('+ Add')),
          ),
        ],
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField({Key? key, required this.hint, required this.onChanged})
      : super(key: key);

  final String hint;
  final void Function(String) onChanged;

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  var enabled = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      //enabled: enabled,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: _EditJobScreenState._titleStyle,
        suffixIcon: enabled
            ? null
            : GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, size: 20),
                ),
                onTap: () => setState(() => enabled = true),
              ),
      ),
      toolbarOptions: const ToolbarOptions(selectAll: true, paste: true),
      onEditingComplete: () => setState(() => enabled = false),
      onSubmitted: (_) => setState(() => enabled = false),
      onChanged: widget.onChanged,
    );
  }
}
