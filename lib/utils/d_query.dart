import 'package:get/get.dart';
import 'package:html/dom.dart';

/// A factory function type that creates a [DQuery] instance for a given CSS selector.
///
/// - [selector]: The CSS selector string.
/// - [single]: If `true`, selects only the first matching element. Defaults to `false`.
typedef DollarFunction = DQuery Function(String selector, {bool single});

/// A jQuery-like wrapper for a list of HTML [Element] objects,
/// providing convenient methods for DOM traversal, manipulation, and data extraction.
class DQuery {
  /// The underlying list of HTML elements wrapped by this DQuery object.
  final List<Element> _elements;

  // --- Constructor & Static Factory ---

  /// Creates a DQuery instance wrapping the provided list of elements.
  DQuery(this._elements);

  /// Creates a [DollarFunction] factory bound to the given [Document].
  /// This allows creating DQuery instances using CSS selectors within that document.
  ///
  /// Example:
  /// ```dart
  /// final $ = DQuery.fromDocument(myHtmlDocument);
  /// final titleText = $('h1').text();
  /// final firstParagraph = $('p', single: true);
  /// ```
  static DollarFunction fromDocument(Document document) {
    return (String selector, {single = false}) => DQuery(
      single
          ? [document.querySelector(selector)].whereType<Element>().toList()
          : document.querySelectorAll(selector),
    );
  }

  // --- Properties ---

  /// Returns `true` if the collection contains no elements.
  get isEmpty => _elements.isEmpty;

  /// Returns `true` if the collection contains one or more elements.
  get isNotEmpty => _elements.isNotEmpty;

  /// Returns the number of elements in the collection.
  get length => _elements.length;

  // --- Attribute/Property Access ---

  /// Gets the value of the specified attribute for the *first* element in the collection.
  /// Returns an empty string (`''`) if the element doesn't exist or the attribute is missing.
  String attr(String name) =>
      _elements.isNotEmpty ? _elements.first.attributes[name] ?? '' : '';

  /// Gets the value of the specified attribute for the *first* element in the collection.
  /// Returns `null` if the element doesn't exist or the attribute is missing.
  String? attrRaw(String name) =>
      _elements.isNotEmpty ? _elements.first.attributes[name] : null;

  /// Gets the value of the specified property (attribute) for the *first* element.
  /// In this implementation, it behaves identically to [attrRaw].
  /// Returns `null` if the element doesn't exist or the property is missing.
  String? prop(String name) => attrRaw(name);

  /// Gets the value of the specified `data-*` attribute for the *first* element in the collection.
  /// For example, `data('id')` retrieves the value of the `data-id` attribute.
  /// Returns an empty string (`''`) if the element doesn't exist or the attribute is missing.
  String data(String name) => attr('data-$name');

  /// Gets the `value` attribute of the *first* element in the collection.
  /// Convenience method for `attr('value')`.
  String val() => attr('value');

  /// Gets the combined inner HTML of the *first* element in the collection.
  /// Returns an empty string (`''`) if the collection is empty.
  String html() => _elements.firstOrNull?.innerHtml ?? '';

  /// Gets the combined text content of the *first* element, including descendants, trimmed.
  /// Returns an empty string (`''`) if the collection is empty.
  String text() => textRaw() ?? '';

  /// Gets the combined text content of the *first* element, including descendants, trimmed.
  /// Returns `null` if the collection is empty.
  String? textRaw() => _elements.firstOrNull?.text.trim();

  /// Gets the class name(s) of the *first* element in the collection.
  /// Returns an empty string (`''`) if the collection is empty.
  String className() => _elements.firstOrNull?.className ?? '';

  // --- Traversal/Filtering (Single Element Focus) ---

  /// Gets the immediate parent of each element in the current set, wrapped in a new DQuery object.
  DQuery parent() {
    final parentElements = _elements
        .map((e) => e.parentNode)
        .whereType<Element>()
        .toList();
    return DQuery(parentElements);
  }

  /// Gets the immediately following sibling of each element in the set of matched elements.
  DQuery prev() {
    final prevElements = _elements
        .map((e) => e.previousElementSibling)
        .whereType<Element>()
        .toList();
    return DQuery(prevElements);
  }

  /// Gets the immediately following sibling of each element in the set of matched elements.
  DQuery next() {
    final nextElements = _elements
        .map((e) => e.nextElementSibling)
        .whereType<Element>()
        .toList();
    return DQuery(nextElements);
  }

  /// Reduces the set of matched elements to the first one in the set.
  DQuery first() {
    final first = _elements.firstOrNull;
    if (first != null) return DQuery([first]);
    return DQuery([]);
  }

  /// Reduces the set of matched elements to the final one in the set.
  DQuery last() {
    final last = _elements.lastOrNull;
    if (last != null) return DQuery([last]);
    return DQuery([]);
  }

  /// Reduces the set of matched elements to the one at the specified index.
  /// Supports negative indexing (e.g., -1 for the last element).
  /// Returns an empty DQuery object if the index is out of bounds.
  DQuery eq(int index) {
    final len = _elements.length;
    if (len == 0) return DQuery([]);
    if (index < 0) {
      index += len;
    } else if (index >= len) {
      index = index - len;
    }

    return DQuery([_elements[index]]);
  }

  // --- Traversal/Filtering (Set Focus) ---

  /// Gets the descendants of each element in the current set of matched elements,
  /// filtered by a selector.
  DQuery query(String selector) {
    final found = _elements
        .expand((e) => e.querySelectorAll(selector))
        .toList();
    return DQuery(found);
  }

  /// Gets the *first* descendant element that matches the selector for *each* element
  /// in the current set. Stops searching after the first match within each element.
  /// Returns a DQuery object containing the first matched descendant found.
  DQuery queryOne(String selector) {
    for (final element in _elements) {
      final child = element.querySelector(selector);
      if (child != null) return DQuery([child]); // Return the first match found
    }
    return DQuery([]); // Return empty if no match found in any element
  }

  /// Reduces the set of matched elements to those that match the predicate function.
  DQuery where(bool Function(DQuery el) condition) {
    return DQuery(_elements.where((el) => condition(DQuery([el]))).toList());
  }

  /// Finds the first element in the current set that satisfies the provided testing function.
  DQuery findOne(bool Function(DQuery el) condition) {
    final el = _elements.firstWhereOrNull((el) => condition(DQuery([el])));
    if (el != null) return DQuery([el]);
    return DQuery([]);
  }

  /// Creates a new DQuery object with elements generated by skipping the first [count] elements.
  DQuery skip(int count) {
    return DQuery(_elements.skip(count).toList());
  }

  /// Creates a new DQuery object with elements generated by taking the first [count] elements.
  DQuery take(int count) {
    return DQuery(_elements.take(count).toList());
  }

  /// Creates a new DQuery object with the elements in reverse order.
  DQuery reversed() {
    return DQuery(_elements.reversed.toList());
  }

  /// Filters the elements to only those whose text content includes the given [text].
  /// This is case-sensitive. If you want case-insensitive, modify to `.contains(text.toLowerCase())` and use `.toLowerCase()` on both sides.
  DQuery contains(String text) {
    return where((el) => el.text().contains(text));
  }

  /// Returns the first element whose text content includes the given [text].
  /// Returns an empty DQuery if no match is found.
  DQuery containsOne(String text) {
    return findOne((el) => el.text().contains(text));
  }

  // --- Iteration/Transformation ---

  /// Iterates over the DQuery object, executing a function for each matched element.
  void each(void Function(DQuery el) callback) {
    for (final element in _elements) {
      callback(DQuery([element]));
    }
  }

  /// Passes each element in the current matched set through a function,
  /// producing a new list containing the return values.
  List<T> map<T>(T Function(DQuery el) transform) {
    return _elements.map((el) => transform(DQuery([el]))).toList();
  }

  /// Converts the DQuery object into an Iterable of DQuery objects,
  /// each containing a single element from the original set.
  Iterable<DQuery> toList() {
    return _elements.map((element) => DQuery([element]));
  }

  /// A jQuery-like wrapper for HTML [Element] objects, providing convenient methods
  /// for DOM traversal, manipulation, and data extraction in Dart.
  ///
  /// Use [DQuery.fromDocument] to create a factory for selecting elements with CSS selectors.
  /// Supports attribute access, text and HTML extraction, DOM traversal (parent, next, children),
  /// filtering, and iteration over matched elements.
  ///
  /// Example usage:
  ///   final $ = DQuery.fromDocument(document);
  ///   final title = $('h1').text();
  ///   final firstParagraph = $('p', single: true);
  ///
  /// Useful for simplifying HTML parsing and manipulation in Dart applications.
  Element get(int index) {
    return _elements[index];
  }

  /// Gets all following siblings of each element in the set of matched elements.
  /// Optionally filters the siblings by a CSS [selector].
  DQuery nextAll([String? selector]) {
    final result = <Element>[];
    for (final el in _elements) {
      Element? sibling = el.nextElementSibling;
      while (sibling != null) {
        if (selector == null || sibling.matches(selector)) {
          result.add(sibling);
        }
        sibling = sibling.nextElementSibling;
      }
    }
    return DQuery(result);
  }

  /// Gets all preceding siblings of each element in the set of matched elements.
  /// Optionally filters the siblings by a CSS [selector].
  DQuery prevAll([String? selector]) {
    final result = <Element>[];
    for (final el in _elements) {
      Element? sibling = el.previousElementSibling;
      while (sibling != null) {
        if (selector == null || sibling.matches(selector)) {
          result.insert(0, sibling); // preserve order (closest first)
        }
        sibling = sibling.previousElementSibling;
      }
    }
    return DQuery(result);
  }

  /// Gets the children elements of the matched elements.
  /// If [index] is provided, returns only the child at that index of the first element.
  /// If [index] is out of bounds or no elements, returns empty DQuery.
  DQuery children([int? index]) {
    if (_elements.isEmpty) return DQuery([]);

    if (index == null) {
      final allChildren = _elements.expand((e) => e.children).toList();
      return DQuery(allChildren);
    } else {
      final children = _elements.first.children;
      final len = children.length;

      if (index < 0) {
        index += len;
      } else if (index >= len) {
        index = index - len;
      }

      return DQuery([children[index]]);
    }
  }
}

extension ElementMatchesExt on Element {
  bool matches(String selector) {
    if (parent == null) {
      return false;
    }

    return parent!.querySelectorAll(selector).contains(this);
  }
}
