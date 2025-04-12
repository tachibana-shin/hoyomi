import { requestToJson } from "./request-to-json"

describe("requestToJson", () => {
  it("should serialize a POST request with JSON body", async () => {
    const originalRequest = new Request("https://example.com/api/data", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer token"
      },
      body: JSON.stringify({ key: "value" }),
      mode: "cors",
      credentials: "same-origin",
      cache: "default",
      redirect: "follow",
      referrer: "about:client",
      referrerPolicy: "no-referrer-when-downgrade",
      integrity: "",
      keepalive: false
    })

    const json = await requestToJson(originalRequest)

    expect(json.url).toBe(originalRequest.url)
    expect(json.method).toBe(originalRequest.method)
    expect(json.mode).toBe(originalRequest.mode)
    expect(json.credentials).toBe(originalRequest.credentials)
    expect(json.cache).toBe(originalRequest.cache)
    expect(json.redirect).toBe(originalRequest.redirect)
    expect(json.referrer).toBe(originalRequest.referrer)
    expect(json.referrerPolicy).toBe(originalRequest.referrerPolicy)
    expect(json.integrity).toBe(originalRequest.integrity)
    expect(json.keepalive).toBe(originalRequest.keepalive)

    // Kiểm tra headers
    for (const [key, value] of originalRequest.headers.entries()) {
      expect(json.headers[key]).toBe(value)
    }

    // Kiểm tra body
    expect(json.body).toBe(await originalRequest.clone().text())
  })

  it("should serialize a GET request without body", async () => {
    const originalRequest = new Request("https://example.com/api/data", {
      method: "GET",
      headers: {
        Accept: "application/json"
      },
      mode: "cors",
      credentials: "same-origin",
      cache: "default",
      redirect: "follow",
      referrer: "about:client",
      referrerPolicy: "no-referrer-when-downgrade",
      integrity: "",
      keepalive: false
    })

    const json = await requestToJson(originalRequest)

    expect(json.url).toBe(originalRequest.url)
    expect(json.method).toBe(originalRequest.method)
    expect(json.mode).toBe(originalRequest.mode)
    expect(json.credentials).toBe(originalRequest.credentials)
    expect(json.cache).toBe(originalRequest.cache)
    expect(json.redirect).toBe(originalRequest.redirect)
    expect(json.referrer).toBe(originalRequest.referrer)
    expect(json.referrerPolicy).toBe(originalRequest.referrerPolicy)
    expect(json.integrity).toBe(originalRequest.integrity)
    expect(json.keepalive).toBe(originalRequest.keepalive)

    // Kiểm tra headers
    for (const [key, value] of originalRequest.headers.entries()) {
      expect(json.headers[key]).toBe(value)
    }

    // Kiểm tra body
    expect(json.body).toBe("")
  })

  it("should handle different HTTP methods", async () => {
    const methods = ["GET", "POST", "PUT", "DELETE"]

    for (const method of methods) {
      const originalRequest = new Request("https://example.com/api/data", {
        method,
        headers: {},
        mode: "cors",
        credentials: "same-origin",
        cache: "default",
        redirect: "follow",
        referrer: "about:client",
        referrerPolicy: "no-referrer-when-downgrade",
        integrity: "",
        keepalive: false
      })

      const json = await requestToJson(originalRequest)
      expect(json.method).toBe(method)
    }
  })
})
