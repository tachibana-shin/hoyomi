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
/**
 * Registers a callback function to be invoked when the specified event is triggered.
 *
 * The callback is tracked internally and also registered with the native event system.
 *
 * @param event - The name of the event to listen for
 * @param callback - The function to execute when the event occurs
 */
export function addEventListener(event: string, callback: (data: any) => void) {
  let list = messageListeners.get(event)
  if (!list) {
    list = new Set()
    messageListeners.set(event, list)
  }
  list.add(callback)
  addEventListenerOrigin.call(globalThis, event, callback)
}

/**
 * Unregisters a callback for a specific event and removes it from both the internal listener registry and the native event system.
 *
 * @param event - The name of the event to stop listening for
 * @param callback - The callback function to remove from the event's listeners
 */
export function removeEventListener(
  event: string,
  callback: (data: any) => void
) {
  messageListeners.get(event)?.delete(callback)
  removeEventListenerOrigin.call(globalThis, event, callback)
}

/**
 * Invokes all registered callbacks for a given event with the provided data.
 *
 * Each callback is called in sequence. Errors thrown by individual callbacks are caught and logged without interrupting the invocation of other listeners.
 *
 * @param event - The event name whose listeners should be invoked
 * @param data - The data to pass to each callback
 */
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
