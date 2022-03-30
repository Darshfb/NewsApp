import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Modules/Widgets/custom_text.dart';
import 'package:newsapp/Modules/webView/webview.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.grey,
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      (article['urlToImage'] == null)
                          ? 'https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png'
                          : '${article['urlToImage']}',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                  top: 15,
                  bottom: 15,
                ),
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: (article['title'].toString() == null)
                            ? 'No Title'
                            : article['title'].toString(),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    if ((article['description'] == null))
                      Expanded(
                        child: CustomText(
                          text: (article['description'] == null)
                              ? ' '
                              : article['description'].toString(),
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    CustomText(
                      text: '${article['publishedAt']}',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
      );
    },
    fallback: (context) => const Center(child: CircularProgressIndicator()));

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
