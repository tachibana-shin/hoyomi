import { jsonToResponse } from "~/logic/json-to-response"
import { requestToJson } from "~/logic/request-to-json"

window.fetch = async (url, init) => {
  const param = await requestToJson(new Request(url, init).clone())
  const id = window.crypto?.randomUUID() ?? Math.random().toString(32)

  return new Promise((resolve, reject) => {
    function handle(event: CustomEvent<string>) {
      let data:
        | { id: string; ok: true; param: Record<string, string> }
        | { id: string; ok: false; param: string }
      try {
        data = JSON.parse(event.detail)
        if (data.id !== id) throw new Error("Invalid id")
      } catch {
        return
      }

      if (data.ok) {
        resolve(jsonToResponse(data.param))
      } else {
        reject(new Error(data.param))
      }

      document.documentElement.removeEventListener(
        // biome-ignore lint/suspicious/noExplicitAny: <explanation>
        "_$fetch_rs_" as unknown as any,
        handle
      )
    }

    document.documentElement.addEventListener(
      // biome-ignore lint/suspicious/noExplicitAny: <explanation>
      "_$fetch_rs_" as unknown as any,
      handle
    )
    document.documentElement.dispatchEvent(
      new CustomEvent("_$fetch_rq_", {
        detail: JSON.stringify({ id, param })
      })
    )
  })
}
