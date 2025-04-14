import Browser from "webextension-polyfill"
import { onMessage } from "webext-bridge/background"
import { jsonToRequest } from "~/logic/json-to-request"
import { responseToJson } from "~/logic/response-to-json"
import { createRule } from "./logic/create-rule"

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

void main()
async function main() {
  await Browser.declarativeNetRequest.updateDynamicRules({
    removeRuleIds: (
      await Browser.declarativeNetRequest.getDynamicRules()
    ).map((item) => item.id)
  })

  await Browser.declarativeNetRequest.updateDynamicRules({
    addRules: [
      createRule({
        regexFilter: "animevietsub\\.lol",
        referer: "https://animevietsub.lol",
        sendFrom: "http://localhost:50231"
      }),
      createRule({
        regexFilter: "sk-hianime\\.animevsub\\.eu\\.org",
        referer: "https://animevsub.eu.org",
        sendFrom: "http://localhost:50231"
      }),
      createRule({
        regexFilter: "storage\\.googleapiscdn\\.com",
        referer: "https://storage.googleapiscdn.com",
        sendFrom: "http://localhost:50231"
      }),
    ]
  })
}
