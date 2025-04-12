import { describe, it, expect } from "vitest"
import { jsonToResponse } from "./json-to-response"

describe("jsonToResponse", () => {
  it("should create a Response object with correct properties", async () => {
    const responseJson = {
      status: 200,
      statusText: "OK",
      headers: {
        "Content-Type": "application/json",
        "X-Custom-Header": "CustomValue"
      },
      body: '{"message":"Success"}',
      type: "default",
      redirected: true,
      url: "http://example.com"
    }

    const response = jsonToResponse(responseJson)

    expect(response.status).toBe(responseJson.status)
    expect(response.statusText).toBe(responseJson.statusText)

    // Verify headers
    for (const [key, value] of Object.entries(responseJson.headers)) {
      expect(response.headers.get(key)).toBe(value)
    }

    // Verify body
    const text = await response.text()
    expect(text).toBe(responseJson.body)
  })

  it("should handle responses without a body", async () => {
    const responseJson = {
      status: 204,
      statusText: "No Content",
      headers: {
        "Content-Type": "application/json"
      },
      body: null
    }

    const response = jsonToResponse(responseJson)

    expect(response.status).toBe(responseJson.status)
    expect(response.statusText).toBe(responseJson.statusText)

    // Verify headers
    for (const [key, value] of Object.entries(responseJson.headers)) {
      expect(response.headers.get(key)).toBe(value)
    }

    // Verify body
    const text = await response.text()
    expect(text).toBe("")
  })

  it("should handle responses with empty string body", async () => {
    const responseJson = {
      status: 200,
      statusText: "OK",
      headers: {
        "Content-Type": "text/plain"
      },
      body: ""
    }

    const response = jsonToResponse(responseJson)

    expect(response.status).toBe(responseJson.status)
    expect(response.statusText).toBe(responseJson.statusText)

    // Verify headers
    for (const [key, value] of Object.entries(responseJson.headers)) {
      expect(response.headers.get(key)).toBe(value)
    }

    // Verify body
    const text = await response.text()
    expect(text).toBe("")
  })
})
