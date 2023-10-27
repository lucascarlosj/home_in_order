import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/ui/widgets/custom_stepper/custom_stepper_controller.dart';
import 'package:micro_design_system/ui/widgets/custom_stepper/step.dart';

class CustomStepper extends StatefulWidget {
  final List<CustomStep> children;
  final String title;
  final CustomStepperController controller;
  final bool useCloseIconFirstStep;
  final VoidCallback? onBack;

  CustomStepper({
    required this.controller,
    required this.children,
    required this.title,
    this.useCloseIconFirstStep = true,
    this.onBack,
  });

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  void initState() {
    super.initState();
    widget.controller.listLength = widget.children.length;
    widget.controller.state.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: AnimatedBuilder(
              animation: widget.controller.state,
              builder: (context, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: widget.children[widget.controller.state.value],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  AppBar? _buildAppBar() {
    if (widget.children[widget.controller.state.value].hasAppBar) {
      return AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: widget
                    .children[widget.controller.state.value].appbarTextColor ??
                Colors.black,
          ),
        ),
        backgroundColor: widget.children[widget.controller.state.value]
                .appbarBackgroundColor ??
            Colors.transparent,
        leading: IconButton(
          onPressed: widget.onBack ?? _getAppBarLeadingIconPressed(),
          icon: _getAppBarLeadingIcon(),
        ),
      );
    }
    return null;
  }

  VoidCallback _getAppBarLeadingIconPressed() {
    return widget.controller.state.value == 0 && widget.useCloseIconFirstStep
        ? context.pop
        : widget.controller.back;
  }

  Icon _getAppBarLeadingIcon() {
    return Icon(
        widget.controller.state.value == 0 && widget.useCloseIconFirstStep
            ? Icons.close
            : Icons.arrow_back);
  }
}
