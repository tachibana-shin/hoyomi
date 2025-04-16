import type Browser from "webextension-polyfill"

export interface PropsCreateRule {
  regexFilter?: string
  shortRegexFilter?: string
  urlFilter?: string
  referer: string
  sendFrom: string
}

export function createRule(
  id: number,
  {
    regexFilter,
    shortRegexFilter,
    urlFilter,
    referer,
    sendFrom
  }: PropsCreateRule
): Browser.DeclarativeNetRequest.Rule {
  return {
    id,
    priority: 2,
    action: {
      type: "modifyHeaders",
      // Modify request header (optional)
      requestHeaders: [
        {
          header: "Referer",
          operation: "set",
          value: referer
        }
      ],
      responseHeaders: [
        {
          // Since credentials are allowed, we must specify the exact Origin
          header: "Access-Control-Allow-Origin",
          operation: "set",
          // Here we set the allowed Origin to the local development host.
          value: sendFrom
        },
        {
          header: "Access-Control-Allow-Methods",
          operation: "set",
          value: "PUT, GET, HEAD, POST, DELETE, OPTIONS"
        },
        {
          header: "Access-Control-Allow-Credentials",
          operation: "set",
          value: "true"
        }
      ]
    },
    condition: {
      // Only target requests going to foo.com or bar.com
      ...(!urlFilter
        ? {
            regexFilter: shortRegexFilter
              ? `^(https?:\\/\\/(.+\\.)?(${shortRegexFilter}))(.+)?`
              : regexFilter
          }
        : undefined),
      ...(urlFilter ? { urlFilter } : undefined),
      // urlFilter: `||${new URL(url).hostname}`,
      resourceTypes: [
        "csp_report",
        "font",
        "image",
        "main_frame",
        "media",
        "object",
        "other",
        "ping",
        "script",
        "stylesheet",
        "sub_frame",
        // biome-ignore lint/suspicious/noExplicitAny: <explanation>
        "webbundle" as unknown as any,
        "websocket",
        // biome-ignore lint/suspicious/noExplicitAny: <explanation>
        "webtransport" as unknown as any,
        "xmlhttprequest"
      ],
      // Restrict to requests initiated from localhost (any port).
      initiatorDomains: [new URL(sendFrom).hostname]
    }
  }
}

export function createCorsRule(
  id: number,
  sendFrom: string
): Browser.DeclarativeNetRequest.Rule {
  return {
    id: id,
    priority: 1,
    action: {
      type: "modifyHeaders",
      // Modify request header (optional)
      requestHeaders: [
        {
          header: "Referer",
          operation: "remove"
        }
      ],
      responseHeaders: [
        {
          // Since credentials are allowed, we must specify the exact Origin
          header: "Access-Control-Allow-Origin",
          operation: "set",
          // Here we set the allowed Origin to the local development host.
          value: "*"
        },
        {
          header: "Access-Control-Allow-Methods",
          operation: "set",
          value: "PUT, GET, HEAD, POST, DELETE, OPTIONS"
        },
        {
          header: "Access-Control-Allow-Credentials",
          operation: "set",
          value: "true"
        }
      ]
    },
    condition: {
      // Only target requests going to foo.com or bar.com
      // urlFilter: `||${new URL(url).hostname}`,
      urlFilter: ".*",
      resourceTypes: [
        "csp_report",
        "font",
        "image",
        "main_frame",
        "media",
        "object",
        "other",
        "ping",
        "script",
        "stylesheet",
        "sub_frame",
        // biome-ignore lint/suspicious/noExplicitAny: <explanation>
        "webbundle" as unknown as any,
        "websocket",
        // biome-ignore lint/suspicious/noExplicitAny: <explanation>
        "webtransport" as unknown as any,
        "xmlhttprequest"
      ],
      // Restrict to requests initiated from localhost (any port).
      initiatorDomains: [new URL(sendFrom).hostname]
    }
  }
}
