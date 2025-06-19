import { Request, type RequestInit } from "./request"
import { Response } from "./response"
import { removeEventListener, addEventListener } from "./dart_send_message"
import { register } from "../register"

declare global {
  var sendMessage: (name: string, param: string) => void
}

interface ResOk {
  __fetch_error__: undefined
  __body: string
  status: number
  statusText: string
  headers: Record<string, string>
  url: string
}
interface ResError {
  __fetch_error__: string
}

export async function fetch(input: string | URL | Request, init?: RequestInit) {
  const request = input instanceof Request ? input : new Request(input, init)
  const requestId = "fetch_" + Math.random().toString(36).slice(2)
  const responseEvent = "response:" + requestId

  return new Promise<Response>((resolve, reject) => {
    const listener = (res: ResOk | ResError) => {
      removeEventListener(responseEvent, listener)
      if (res.__fetch_error__) {
        reject(new Error(res?.__fetch_error__))
      } else {
        const response = new Response((res as ResOk).__body, {
          status: (res as ResOk).status,
          statusText: (res as ResOk).statusText,
          headers: (res as ResOk).headers,
          url: (res as ResOk).url
        })
        resolve(response)
      }
    }

    addEventListener(responseEvent, listener)

    sendMessage(
      "dart_fetch_request",
      JSON.stringify({
        id: requestId,
        url: request.url,
        options: {
          method: request.method,
          headers: Object.fromEntries(request.headers.entries()),
          body: request.body
        }
      })
    )
  })
}

register({ fetch })
