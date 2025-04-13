import { jsonToResponse } from "~/logic/json-to-response"
import { requestToJson } from "~/logic/request-to-json"

const fetchOrigin = window.fetch
window.fetch = async (url, init) => {
  const request = new Request(url, init)

  if (new URL(request.url).hostname === location.hostname)
    return fetchOrigin(request)

  const param = await requestToJson(request.clone())
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

// Fake XMLHttpRequest using fetch, now supports addEventListener
window.XMLHttpRequest = class extends XMLHttpRequest {
  private _eventTarget = new EventTarget()

  private _readyState = 0
  get readyState() {
    return this._readyState
  }

  private _status = 0
  get status() {
    return this._status
  }

  private _responseText = ""
  get responseText() {
    return this._responseText
  }

  private _response: ArrayBuffer | null = null
  get response() {
    return this._response
  }

  onreadystatechange: (() => void) | null = null
  onload: (() => void) | null = null
  onerror: ((error: unknown) => void) | null = null
  onabort: (() => void) | null = null

  private _method = "GET"
  private _url = ""
  private _headers: Record<string, string> = {}
  private _body: string | null = null
  private _controller: AbortController | null = null
  private _aborted = false

  open(method: string, url: string, async = true): void {
    this._method = method
    this._url = url
    this._readyState = 1
    this._triggerReadyStateChange()

    if (!async) throw new Error("Synchronous requests are not supported")
  }

  setRequestHeader(header: string, value: string): void {
    this._headers[header] = value
  }

  // biome-ignore lint/suspicious/noExplicitAny: <explanation>
  send(body: any = null): void {
    this._body = body
    this._controller = new AbortController()
    const signal = this._controller.signal

    fetch(this._url, {
      method: this._method,
      headers: this._headers,
      body: this._body,
      signal
    })
      .then(async (res) => {
        if (this._aborted) return

        this._status = res.status
        this._readyState = 2
        this._triggerReadyStateChange()

        this._response = await res.arrayBuffer()
        this._responseText = new TextDecoder().decode(this._response)

        this._readyState = 4
        this._triggerReadyStateChange()

        this._dispatchEvent("load")
        if (typeof this.onload === "function") {
          this.onload()
        }
      })
      .catch((err) => {
        if (this._aborted) {
          this._dispatchEvent("abort")
          if (typeof this.onabort === "function") {
            this.onabort()
          }
        } else {
          this._dispatchEvent("error")
          if (typeof this.onerror === "function") {
            this.onerror(err)
          }
        }
      })
  }

  abort(): void {
    if (this._controller) {
      this._aborted = true
      this._controller.abort()
    }
  }

  // イベントリスナーを追加
  addEventListener(type: string, listener: EventListenerOrEventListenerObject) {
    this._eventTarget.addEventListener(type, listener)
  }

  // イベントリスナーを削除
  removeEventListener(
    type: string,
    listener: EventListenerOrEventListenerObject
  ) {
    this._eventTarget.removeEventListener(type, listener)
  }

  // イベントを発火させる
  private _dispatchEvent(type: string) {
    this._eventTarget.dispatchEvent(new Event(type))
  }

  private _triggerReadyStateChange(): void {
    this._dispatchEvent("readystatechange")
    if (typeof this.onreadystatechange === "function") {
      this.onreadystatechange()
    }
  }
}
