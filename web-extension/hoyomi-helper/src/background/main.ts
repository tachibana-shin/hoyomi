import { onMessage } from "webext-bridge/background"
import { jsonToRequest } from "~/logic/json-to-request"
import { responseToJson } from "~/logic/response-to-json"

// only on dev mode
if (import.meta.hot) {
  // @ts-expect-error for background HMR
  import("/@vite/client")
  // load latest content script
  import("./contentScriptHMR")
}
onMessage("fetch", async ({ data }) => {
  const request = jsonToRequest(data)
  const response = await fetch(request)

  return responseToJson(response)
})
