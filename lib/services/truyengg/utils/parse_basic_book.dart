import 'package:honyomi/services/interfaces/basic_book.dart';
import 'package:honyomi/services/interfaces/basic_image.dart';
import 'package:honyomi/services/interfaces/route.dart';
import 'package:honyomi/utils/time_utils.dart';
import 'package:html/dom.dart';

BasicBook parseBasicBook(Element itemBook, String referer) {
  final String slug = itemBook
      .querySelector("a")!
      .attributes["href"]!
      .split("/")
      .last
      .replaceFirst(".html", "");
  final $image = itemBook.querySelector("img")!;
  final BasicImage image = BasicImage(
      src: $image.attributes["data-src"]!, headers: {"referer": referer});
  final String name = itemBook.querySelector(".book_name")?.text ??
      itemBook.querySelector("img")!.attributes['alt']!;

  final Route lastChap = Route(
      name: itemBook.querySelector(".cl99")!.text.trim(),
      slug: itemBook
          .querySelector(".cl99")!
          .attributes["href"]!
          .split("/")
          .last
          .replaceFirst(".html", ""));

  final timeAgoElement = itemBook.querySelector(".time-ago");
  final timeAgo =
      timeAgoElement != null ? convertTimeAgoToUtc(timeAgoElement.text) : null;
  final String? notice = itemBook.querySelector(".type-label")?.text;

  final rateValueText = itemBook.querySelector(".rate-star")?.text.trim();
  final double? rate =
      rateValueText != null ? double.tryParse(rateValueText) : null;

  return BasicBook(
      image: image,
      lastChap: lastChap,
      timeAgo: timeAgo,
      notice: notice,
      name: name,
      slug: slug,
      rate: rate);
}
