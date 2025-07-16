import { register } from "../register"

declare global {
  function addEventListener(name: string, callback: (data: any) => void): void
  function removeEventListener(
    name: string,
    callback: (data: any) => void
  ): void
}

const messageListeners = new Map<string, Set<(data: any) => void>>()

const {
  addEventListener: addEventListenerOrigin,
  removeEventListener: removeEventListenerOrigin
} = globalThis
export function addEventListener(event: string, callback: (data: any) => void) {
  let list = messageListeners.get(event)
  if (!list) {
    list = new Set()
    messageListeners.set(event, list)
  }
  list.add(callback)
  addEventListenerOrigin.call(globalThis, event, callback)
}

export function removeEventListener(
  event: string,
  callback: (data: any) => void
) {
  messageListeners.get(event)?.delete(callback)
  removeEventListenerOrigin.call(globalThis, event, callback)
}

function __$$DART_SEND_MESSAGE$$__(event: string, data: any) {
  messageListeners.get(event)?.forEach((callback) => {
    try {
      callback(data)
    } catch (e) {
      console.error("Error in message listener for event:", event, e)
    }
  })
}

register({ addEventListener, removeEventListener, __$$DART_SEND_MESSAGE$$__ })
