import type { OImage } from "./interfaces/o_image"
import type { SettingField } from "./interfaces/setting/setting_field"
import type { WebRule } from "./interfaces/web_rule"

export interface ServiceInit {
  name: string
  uid?: string
  faviconUrl: OImage
  rootUrl: string
  version?: string
  description?: string
  language?: string
  captchaUrl?: () => string
  settings?: SettingField[]
  webRules?: WebRule[]
  fetchHeadless?: boolean
  fetchBaseUrl?: string
  onBeforeInsertCookie?: (oldCookie?: string) => string | undefined
}
