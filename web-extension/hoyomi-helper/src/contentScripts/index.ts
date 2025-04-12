import { sendMessage } from "webext-bridge/content-script"

document.documentElement.addEventListener(
  // biome-ignore lint/suspicious/noExplicitAny: <explanation>
  "_$fetch_rq_" as unknown as any,
  async (event: CustomEvent<string>) => {
    // biome-ignore lint/suspicious/noExplicitAny: <explanation>
    // biome-ignore lint/style/useSingleVarDeclarator: <explanation>
    let id: string, param: Record<string, any>
    try {
      const data = JSON.parse(event.detail)
      id = data.id
      param = data.param
    } catch {
      return
    }

    try {
      const json = await sendMessage("fetch", param, "background")

      document.documentElement.dispatchEvent(
        new CustomEvent("_$fetch_rs_", {
          detail: JSON.stringify({ id, ok: true, param: json })
        })
      )
    } catch (error) {
      document.documentElement.dispatchEvent(
        new CustomEvent("_$fetch_rs_", {
          detail: JSON.stringify({
            id,
            ok: false,
            param: error?.toString ?? "unknown_error"
          })
        })
      )
    }
  }
)

const script = document.createElement("script")
script.type = "module"
script.src = `http://localhost:${
  import.meta.env.PORT ?? 3303
}/contentScripts/inject.ts`

// Append the injected script into the document.
;(document.head || document.documentElement).prepend(script)
script.remove()
