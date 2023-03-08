import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../modules/web_view/web_view.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  String? Function(String?)? validate,
  VoidCallback? onTap,
  Function? onChange,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
}) {
  return TextFormField(
    validator: validate,
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    onTap: () {
      onTap!();
      print('Taped');
    },
    onChanged: (String s) => onChange!(s),
    decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        ),
        label: Text(label),
        prefixIcon: Icon(prefix),
        border: const OutlineInputBorder()),
  );
}

Widget buildNewsItem(articale, context) {
  return InkWell(
    onTap: () {
      navigateTo(
          context,
          WebviewScreen(
            url: '${articale['url']}',
          ));
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // image: DecorationImage(
              //   // NetworkImage('${articale['urlToImage']}'),
              //   fit: BoxFit.cover,
              // ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: articale['urlToImage'] == null
                ? const Icon(
                    Icons.info,
                  )
                : FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: '${articale['urlToImage']}',
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${articale['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    Jiffy(articale['publishedAt']).yMMMMd,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndKill(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
