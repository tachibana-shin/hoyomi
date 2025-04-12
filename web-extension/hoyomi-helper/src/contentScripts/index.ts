import { onMessage, sendMessage } from "webext-bridge/content-script"
import { jsonToResponse } from "~/logic/json-to-response"
import { requestToJson } from "~/logic/request-to-json"
;(() => {
  console.info("[vitesse-webext] Hello world from content script")

  // communication example: send previous tab title from background page
  onMessage("tab-prev", ({ data }) => {
    console.log(`[vitesse-webext] Navigate from page "${data.title}"`)
  })

  const script = document.createElement("script")
  script.textContent =
    "(" +
    function () {
      // Save the original fetch function.
      const originalFetch = window.fetch

      window.fetch = async function (url, init) {
        const json = await sendMessage(
          "fetch",
          await requestToJson(new Request(url, init).clone()),
          "background"
        )

        return jsonToResponse(json as unknown as Map<String, String>)
      }
    } +
    ")();"

  // Append the injected script into the document.
  ;(document.head || document.documentElement).prepend(script)
  script.remove()
})()
