import { responseToJson } from "./response-to-json"

describe("responseToJson", () => {
  it("should serialize a response with body and headers", async () => {
    const bodyContent = JSON.stringify({ message: "Success" })
    const response = new Response(bodyContent, {
      status: 200,
      statusText: "OK",
      headers: {
        "content-type": "application/json",
        "x-custom-header": "CustomValue"
      }
    })

    const json = await responseToJson(response)

    expect(json.status).toBe(200)
    expect(json.statusText).toBe("OK")
    expect(json.headers["content-type"]).toBe("application/json")
    expect(json.headers["x-custom-header"]).toBe("CustomValue")
    expect(json.body).toBe(bodyContent)
  })

  it("should handle a response without body", async () => {
    const response = new Response(null, {
      status: 204,
      statusText: "No Content",
      headers: {
        "content-type": "application/json"
      }
    })

    const json = await responseToJson(response)

    expect(json.status).toBe(204)
    expect(json.statusText).toBe("No Content")
    expect(json.headers["content-type"]).toBe("application/json")
    expect(json.body).toBe("")
  })

  it("should handle a response with empty string body", async () => {
    const response = new Response("", {
      status: 200,
      statusText: "OK",
      headers: {
        "content-type": "text/plain"
      }
    })

    const json = await responseToJson(response)

    expect(json.status).toBe(200)
    expect(json.statusText).toBe("OK")
    expect(json.headers["content-type"]).toBe("text/plain")
    expect(json.body).toBe("")
  })
})
