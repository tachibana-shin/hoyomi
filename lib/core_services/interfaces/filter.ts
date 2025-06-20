export interface Option {
  name: string
  value: string
  selected?: boolean // default: false
}

export interface Filter {
  name: string
  key: string
  multiple: boolean
  options: Option[]
}
