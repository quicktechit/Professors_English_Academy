import '../consts/consts.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: LoaderController.to.isLoading.value,
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}