#
# Generated file, do not edit.
#

list(APPEND FLUTTER_PLUGIN_LIST
  app_links
  battery_plus
  firebase_auth
  firebase_core
  flutter_inappwebview_windows
  flutter_qjs
  flutter_volume_controller
  fullscreen_window
  media_kit_libs_windows_video
  media_kit_video
  screen_brightness_windows
  screen_retriever_windows
  share_plus
  sqlite3_flutter_libs
  url_launcher_windows
  volume_controller
  window_manager
)

list(APPEND FLUTTER_FFI_PLUGIN_LIST
  rust_lib_hoyomi
)

set(PLUGIN_BUNDLED_LIBRARIES)

foreach(plugin ${FLUTTER_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${plugin}/windows plugins/${plugin})
  target_link_libraries(${BINARY_NAME} PRIVATE ${plugin}_plugin)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES $<TARGET_FILE:${plugin}_plugin>)
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${plugin}_bundled_libraries})
endforeach(plugin)

foreach(ffi_plugin ${FLUTTER_FFI_PLUGIN_LIST})
  add_subdirectory(flutter/ephemeral/.plugin_symlinks/${ffi_plugin}/windows plugins/${ffi_plugin})
  list(APPEND PLUGIN_BUNDLED_LIBRARIES ${${ffi_plugin}_bundled_libraries})
endforeach(ffi_plugin)
