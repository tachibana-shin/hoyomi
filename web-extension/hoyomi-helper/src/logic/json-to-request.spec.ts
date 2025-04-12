import { jsonToRequest } from "./json-to-request"

describe("jsonToRequest", () => {
  it("should create a Request object with correct properties", async () => {
    const requestJson = {
      url: "https://example.com/api/data",
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer token"
      },
      body: '{"key":"value"}',
      mode: "cors",
      credentials: "same-origin",
      cache: "default",
      redirect: "follow",
      referrer: "about:client",
      referrerPolicy: "no-referrer-when-downgrade",
      integrity: "",
      keepalive: false
    }

    const request = jsonToRequest(requestJson)

    expect(request.url).toBe(requestJson.url)
    expect(request.method).toBe(requestJson.method)
    expect(request.mode).toBe(requestJson.mode)
    expect(request.credentials).toBe(requestJson.credentials)
    expect(request.cache).toBe(requestJson.cache)
    expect(request.redirect).toBe(requestJson.redirect)
    expect(request.referrer).toBe(requestJson.referrer)
    expect(request.referrerPolicy).toBe(requestJson.referrerPolicy)
    expect(request.integrity).toBe(requestJson.integrity)
    expect(request.keepalive).toBe(requestJson.keepalive)

    // Kiểm tra headers
    for (const [key, value] of Object.entries(requestJson.headers)) {
      expect(request.headers.get(key)).toBe(value)
    }

    // Kiểm tra body
    const text = await request.text()
    expect(text).toEqual(requestJson.body)
  })

  it("should handle requests without a body", async () => {
    const requestJson = {
      url: "https://example.com/api/data",
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
    }

    const request = jsonToRequest(requestJson)

    expect(request.url).toBe(requestJson.url)
    expect(request.method).toBe(requestJson.method)
    expect(request.mode).toBe(requestJson.mode)
    expect(request.credentials).toBe(requestJson.credentials)
    expect(request.cache).toBe(requestJson.cache)
    expect(request.redirect).toBe(requestJson.redirect)
    expect(request.referrer).toBe(requestJson.referrer)
    expect(request.referrerPolicy).toBe(requestJson.referrerPolicy)
    expect(request.integrity).toBe(requestJson.integrity)
    expect(request.keepalive).toBe(requestJson.keepalive)

    // Kiểm tra headers
    for (const [key, value] of Object.entries(requestJson.headers)) {
      expect(request.headers.get(key)).toBe(value)
    }

    // Kiểm tra body
    const text = await request.text()
    expect(text).toBe("")
  })

  it("should handle different HTTP methods", () => {
    const methods = ["GET", "POST", "PUT", "DELETE"]

    methods.forEach((method) => {
      const requestJson = {
        url: "https://example.com/api/data",
        method: method,
        headers: {},
        mode: "cors",
        credentials: "same-origin",
        cache: "default",
        redirect: "follow",
        referrer: "about:client",
        referrerPolicy: "no-referrer-when-downgrade",
        integrity: "",
        keepalive: false
      }

      const request = jsonToRequest(requestJson)
      expect(request.method).toBe(method)
    })
  })
})
