import { OImage } from "./interfaces/o_image"
import { SettingField } from "./interfaces/setting/setting_field"
import { WebRule } from "./interfaces/web_rule"

export interface ServiceInit {
  name: string
  uid?: string
  faviconUrl: OImage
  rootUrl: string
  captchaUrl?: () => string
  settings?: SettingField[]
  webRules?: WebRule[]
  fetchHeadless?: boolean
  fetchBaseUrl?: string
  onBeforeInsertCookie?: (oldCookie?: string) => string | undefined
}

export abstract class BaseService {
  abstract init: ServiceInit
  abstract get uid(): string
  abstract get name(): string
  abstract get baseUrl(): string
}
