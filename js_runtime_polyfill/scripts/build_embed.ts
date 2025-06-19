/// <reference types="@types/bun" />
import { resolve } from "path"

const result = await Bun.build({
  entrypoints: [resolve(import.meta.dirname ?? "", "../embed.ts")],
  format: "iife",
  target: "bun",
  minify: !Bun.argv.includes("--dev")
})

const js = await result.outputs[0]?.text()
if (!js) {
  throw new Error("Build failed or no output found")
}

const dart = `const jsRuntimePolyfill = r'''${js}''';
`

await Bun.write(
  Bun.file(
    resolve(import.meta.dirname ?? "", "../../lib/js_runtime/embed.dart")
  ),
  dart
)

console.log(
  "Dart embed file created successfully at:",
  resolve(import.meta.dirname ?? "", "../../lib/js_runtime/embed.dart")
)
