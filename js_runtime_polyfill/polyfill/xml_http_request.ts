import { register } from "../register"
import { fetch } from "./fetch"
import { type RequestInit } from "./request"

export class XMLHttpRequest {
  // Constants
  static readonly UNSENT = 0
  static readonly OPENED = 1
  static readonly HEADERS_RECEIVED = 2
  static readonly LOADING = 3
  static readonly DONE = 4

  // Public properties
  readyState = XMLHttpRequest.UNSENT
  status = 0
  statusText = ""
  responseText = ""
  responseType = ""
  response: any = null
  onreadystatechange: (() => void) | null = null

  // Internal
  private method: string = ""
  private url: string = ""
  private _async: boolean = true
  private headers: Record<string, string> = {}
  private body: any = null

  open(method: string, url: string, _async: boolean = true): void {
    this.method = method.toUpperCase()
    this.url = url
    this._async = _async
    this.readyState = XMLHttpRequest.OPENED
    this._triggerReadyStateChange()
  }

  setRequestHeader(name: string, value: string): void {
    this.headers[name] = value
  }

  send(body: any = null): void {
    this.body = body

    const init: RequestInit = {
      method: this.method,
      headers: this.headers,
      body: body
    }

    fetch(this.url, init)
      .then(async (res) => {
        this.status = res.status
        this.statusText = res.statusText
        this.readyState = XMLHttpRequest.HEADERS_RECEIVED
        this._triggerReadyStateChange()

        this.readyState = XMLHttpRequest.LOADING
        this._triggerReadyStateChange()

        this.responseText = await res.text()
        this.response =
          this.responseType === "json"
            ? JSON.parse(this.responseText)
            : this.responseText

        this.readyState = XMLHttpRequest.DONE
        this._triggerReadyStateChange()
      })
      .catch((err) => {
        this.status = 0
        this.statusText = err.message
        this.readyState = XMLHttpRequest.DONE
        this._triggerReadyStateChange()
      })
  }

  abort(): void {
    // Simple polyfill: no actual abort (QuickJS không có AbortController mặc định)
    this.status = 0
    this.statusText = "abort"
    this.readyState = XMLHttpRequest.DONE
    this._triggerReadyStateChange()
  }

  getAllResponseHeaders(): string {
    return ""
  }

  getResponseHeader(name: string): string | null {
    return null
  }

  private _triggerReadyStateChange(): void {
    if (typeof this.onreadystatechange === "function") {
      try {
        this.onreadystatechange()
      } catch (e) {
        console.error("Error in onreadystatechange:", e)
      }
    }
  }
}

register({ XMLHttpRequest })
