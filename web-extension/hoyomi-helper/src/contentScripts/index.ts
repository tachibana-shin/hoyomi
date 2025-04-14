import { sendMessage } from "webext-bridge/content-script"
import Browser from "webextension-polyfill"

document.documentElement.addEventListener(
  // biome-ignore lint/suspicious/noExplicitAny: <explanation>
  "_$install_web_rules_rq_" as unknown as any,
  async (event: CustomEvent<string>) => {
    // biome-ignore lint/suspicious/noExplicitAny: <explanation>
    // biome-ignore lint/style/useSingleVarDeclarator: <explanation>
    let id: string, json: string
    try {
      const data = JSON.parse(event.detail)
      id = data.id
      json = data.json
    } catch {
      return
    }

    try {
      await sendMessage(
        "install_web_rules",
        { json, origin: location.origin },
        "background"
      )

      document.documentElement.dispatchEvent(
        new CustomEvent("_$install_web_rules_rs_", {
          detail: JSON.stringify({ id, ok: true })
        })
      )
    } catch (error) {
      document.documentElement.dispatchEvent(
        new CustomEvent("_$install_web_rules_rs_", {
          detail: JSON.stringify({
            id,
            ok: false,
            error: error?.toString ?? "unknown_error"
          })
        })
      )
    }
  }
)

const script = document.createElement("script")
script.type = "module"
if (import.meta.env.DEV)
  script.src = `http://localhost:${
    import.meta.env.PORT ?? 3303
  }/contentScripts/inject.ts`
else
  script.src = Browser.runtime.getURL("dist/contentScripts/inject.global.js")

  // Append the injected script into the document.
;(document.head || document.documentElement).prepend(script)
script.remove()
