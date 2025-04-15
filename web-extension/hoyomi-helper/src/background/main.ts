import Browser from "webextension-polyfill"
import { onMessage } from "webext-bridge/background"

import { createCorsRule, createRule } from "./logic/create-rule"
import { hashToInt } from "./logic/hash-to-int"

// only on dev mode
if (import.meta.hot) {
  // @ts-expect-error for background HMR
  import("/@vite/client")
  // load latest content script
  import("./contentScriptHMR")
}

interface WebRule {
  readonly regexFilter: string
  readonly referer: string
}
onMessage("install_web_rules", async ({ data: { json, origin } }) => {
  const rules = JSON.parse(json) as readonly WebRule[]
  const rulesInstalled = new Map(
    (await Browser.declarativeNetRequest.getDynamicRules()).map((rule) => [
      rule.id,
      rule
    ])
  )

  try {
    await installRules(rules, origin, rulesInstalled)
  } catch (err) {
    console.warn(err)
    throw err
  }
})

async function installRules(
  rules: readonly WebRule[],
  origin: string,
  rulesInstalled: Map<number, Browser.DeclarativeNetRequest.Rule>
) {
  const addRules: Browser.DeclarativeNetRequest.Rule[] = []
  const removeRuleIds: number[] = []

  // biome-ignore lint/complexity/noForEach: <explanation>
  rules.forEach((rawRule) => {
    const id = hashToInt(`${rawRule.regexFilter}@${rawRule.referer}`)
    const installed = rulesInstalled.get(id)

    const newRule = createRule(id, {
      ...rawRule,
      sendFrom: origin
    })
    if (installed && JSON.stringify(installed) === JSON.stringify(newRule)) {
      return
    }

    if (installed) removeRuleIds.push(installed.id)

    addRules.push(newRule)

    return newRule
  })

  const idCors = hashToInt(`${origin}`)
  const corsRule = createCorsRule(idCors, origin)

  if (rulesInstalled.has(idCors)) {
    if (
      JSON.stringify(rulesInstalled.get(idCors)) !== JSON.stringify(corsRule)
    ) {
      removeRuleIds.push(idCors)
      addRules.push(corsRule)
    }
  } else {
    addRules.push(corsRule)
  }

  await Browser.declarativeNetRequest.updateDynamicRules({
    removeRuleIds,
    addRules
  })
}

// void main()
// async function main() {
//   await Browser.declarativeNetRequest.updateDynamicRules({
//     removeRuleIds: (
//       await Browser.declarativeNetRequest.getDynamicRules()
//     ).map((item) => item.id)
//   })

//   await Browser.declarativeNetRequest.updateDynamicRules({
//     addRules: [
//       createRule({
//         regexFilter: "animevietsub\\.lol",
//         referer: "https://animevietsub.lol",
//         sendFrom: "http://localhost:50231"
//       }),
//       createRule({
//         regexFilter: "sk-hianime\\.animevsub\\.eu\\.org",
//         referer: "https://animevsub.eu.org",
//         sendFrom: "http://localhost:50231"
//       }),
//       createRule({
//         regexFilter: "storage\\.googleapiscdn\\.com",
//         referer: "https://storage.googleapiscdn.com",
//         sendFrom: "http://localhost:50231"
//       })
//     ]
//   })
// }
