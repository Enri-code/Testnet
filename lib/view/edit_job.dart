import 'package:flutter/material.dart';

class EditJobScreen extends StatefulWidget {
  const EditJobScreen({Key? key}) : super(key: key);

  @override
  State<EditJobScreen> createState() => _EditJobScreenState();
}

class _EditJobScreenState extends State<EditJobScreen> {
  final formKey = GlobalKey<FormState>();
  static const _titleStyle =
          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      _subtitleStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w300);

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
                    SizedBox(height: 20),
                    Text('Role Details', style: _titleStyle),
                    SizedBox(height: 16),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _TextField(
                            hint: 'Marketing Specialist',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 16),
                          _TextField(
                            hint: 'Remote',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 26),
                          Text('Job Details', style: _titleStyle),
                          SizedBox(height: 16),
                          Text('Pay', style: _subtitleStyle),
                          SizedBox(height: 2),
                          _TextField(
                            hint: r'$11 - $23 per hour',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 16),
                          Text('Job type', style: _subtitleStyle),
                          SizedBox(height: 2),
                          _TextField(
                            hint: r'Full-time, Part-time, Contract',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 16),
                          Text('Number of openings for this position',
                              style: _subtitleStyle),
                          SizedBox(height: 2),
                          _TextField(
                            hint: r'2',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 16),
                          Text('Schedule', style: _subtitleStyle),
                          SizedBox(height: 2),
                          _TextField(
                            hint: r'8 hour shift',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 24),
                          _ExtrasSection(
                            title: Text('Benefits', style: _titleStyle),
                            tag: Text('+ Tuition Reimbursement'),
                          ),
                          SizedBox(height: 24),
                          _ExtrasSection(
                            title: Text('Supplemental pay', style: _titleStyle),
                            tag: Text('+ Signing Bonus'),
                          ),
                          SizedBox(height: 24),
                          Text('Job Settings', style: _titleStyle),
                          SizedBox(height: 16),
                          Text('Country and language', style: _subtitleStyle),
                          SizedBox(height: 2),
                          _TextField(
                            hint: r'United States, English',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 16),
                          Text('Promotion location', style: _subtitleStyle),
                          SizedBox(height: 2),
                          _TextField(
                            hint: r'Remote',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 16),
                          Text('Expect to hire within', style: _subtitleStyle),
                          SizedBox(height: 2),
                          _TextField(
                            hint: r'1 to 3 days',
                            onChanged: (_) {},
                          ),
                          SizedBox(height: 220),
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
                  SizedBox(height: 16),
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
                  SizedBox(height: 40),
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
        color: Color(0xffECDFFF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.visibility_off), SizedBox(width: 8), title],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(24),
            ),
            child: tag,
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(onPressed: () {}, child: Text('+ Add')),
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
