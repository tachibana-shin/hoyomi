export interface Paginate<T> {
  items: T[]
  page: number
  totalItems: number
  totalPages: number
}

export function createFakePaginate<T>(item: T): Paginate<T> {
  return {
    items: Array(30).fill(item),
    page: 1,
    totalItems: 30,
    totalPages: 1
  }
}
