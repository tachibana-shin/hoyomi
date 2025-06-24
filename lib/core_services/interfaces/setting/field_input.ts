import { type SettingField } from "./setting_field"
import { BaseService } from "../../service"

export interface FieldInput extends SettingField {
  placeholder: string
  defaultFn: (service: BaseService) => string
  maxLines: number
  appear: boolean
}
