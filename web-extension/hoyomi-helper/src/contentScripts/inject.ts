Object.assign(window, {
  _installWebRules(json: string) {
    const id = window.crypto?.randomUUID() ?? Math.random().toString(32)

    return new Promise<void>((resolve, reject) => {
      function handle(event: CustomEvent<string>) {
        let data:
          | { id: string; ok: true }
          | { id: string; ok: false; error: string }
        try {
          data = JSON.parse(event.detail)
          if (data.id !== id) throw new Error("Invalid id")
        } catch {
          return
        }

        if (data.ok) {
          resolve()
        } else {
          reject(new Error(data.error))
        }

        document.documentElement.removeEventListener(
          // biome-ignore lint/suspicious/noExplicitAny: <explanation>
          "_$install_web_rules_rs_" as unknown as any,
          handle
        )
      }

      document.documentElement.addEventListener(
        // biome-ignore lint/suspicious/noExplicitAny: <explanation>
        "_$install_web_rules_rs_" as unknown as any,
        handle
      )
      document.documentElement.dispatchEvent(
        new CustomEvent("_$install_web_rules_rq_", {
          detail: JSON.stringify({ id, json })
        })
      )
    })
  }
})
