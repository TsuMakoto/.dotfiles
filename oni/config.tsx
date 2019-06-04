import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
  oni.input.unbind("<C-p>")
  oni.input.unbind("<S-C-p>")
  const isNormalMode =
    () => oni.editors.activeEditor.mode === "normal"
  oni.input.bind("<C-:>", "commands.show", isNormalMode)
}

module.exports = {
    activate,
    "autoClosingPairs.enabled": false,
    "ui.colorscheme": "tender",
    "commandline.mode": false,
    "editor.errors.slideOnForce": false,
    "editor.fontLigatures": false,
    "editor.fontSize": "11px",
    "editor.fontWeight": "normal",
    "editor.linePadding": 1,
    "editor.quickInfo.enabled": false,
    "editor.scrollBar.visible": false,
    "oni.loadInitVim": true,
    "oni.hideMenu": true,
    "oni.useDefaultConfig": false,
    "sidebar.enabled": false,
    "statusbar.enabled": false,
    "tabs.mode": "native",
    "ui.animations.enabled": false,
    "ui.fontSmoothing": "auto",
    "explorer.persistDeletedFiles": false,
    "editor.backgroundOpacity": 0.9,
    "editor.backgroundImageUrl": "~/.myData/pic/Pokémon.jpg"
}
