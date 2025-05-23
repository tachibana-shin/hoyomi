import fs from "fs-extra"
import Yaml from "yaml"
import type { Manifest } from "webextension-polyfill"
import type PkgType from "../package.json"
import { isDev, isFirefox, port, r } from "../scripts/utils"

export async function getManifest() {
  const pkg = (await fs.readJSON(r("package.json"))) as typeof PkgType

  // update this file to update this manifest.json
  // can also be conditional based on your need
  const manifest: Manifest.WebExtensionManifest = {
    manifest_version: 3,
    name: pkg.displayName || pkg.name,
    version: pkg.version,
    description: pkg.description,
    background: isFirefox
      ? {
          scripts: ["dist/background/index.mjs"],
          type: "module"
        }
      : {
          service_worker: "./dist/background/index.mjs"
        },
    icons: {
      16: "./assets/logo-512.png",
      48: "./assets/logo-512.png",
      128: "./assets/logo-512.png"
    },
    permissions: [
      "tabs",
      "storage",
      "activeTab",
      "cookies",
      "declarativeNetRequest"
    ],
    host_permissions: ["*://*/*"],
    content_scripts: [
      {
        matches: isDev
          ? ["<all_urls>"]
          : Yaml.parse(await fs.readFile(r("allowlist.yaml"), "utf8"))
              .hosts.map((host: string) => {
                return [`http://${host}/*`, `https://${host}/*`]
              })
              .flat(1),
        all_frames: true,
        run_at: "document_start",
        js: ["dist/contentScripts/index.global.js"]
      }
    ],
    web_accessible_resources: [
      {
        resources: [
          "dist/contentScripts/style.css",
          "dist/contentScripts/inject.global.js"
        ],
        matches: ["<all_urls>"]
      }
    ],
    content_security_policy: {
      extension_pages: isDev
        ? // this is required on dev for Vite script to load
          `script-src \'self\' http://localhost:${port}; object-src \'self\'`
        : "script-src 'self'; object-src 'self'"
    }
  }

  return manifest
}
