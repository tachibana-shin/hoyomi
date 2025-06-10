enum ComicModes { leftToRight, rightToLeft, topToBottom, webToon }

bool modeUsingPageView(ComicModes mode) {
  if (mode == ComicModes.leftToRight ||
      mode == ComicModes.rightToLeft ||
      mode == ComicModes.topToBottom) {
    return true;
  }

  return false;
}
