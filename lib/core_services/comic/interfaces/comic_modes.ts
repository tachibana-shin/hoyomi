export enum ComicModes {
  leftToRight = "leftToRight",
  rightToLeft = "rightToLeft",
  topToBottom = "topToBottom",
  webToon = "webToon"
}

export function modeUsingPageView(mode: ComicModes): boolean {
  return (
    mode === ComicModes.leftToRight ||
    mode === ComicModes.rightToLeft ||
    mode === ComicModes.topToBottom
  )
}
