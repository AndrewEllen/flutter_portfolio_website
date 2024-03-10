import 'dart:js' as js;

void openUrl({required String url}) {

  js.context.callMethod('open', [url]);

}