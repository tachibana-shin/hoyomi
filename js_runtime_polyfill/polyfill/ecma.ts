export {}

declare global {
  interface Array<T> {
    at(index: number): T | undefined
    findLast(
      predicate: (value: T, index: number, array: T[]) => unknown
    ): T | undefined
    findLastIndex(
      predicate: (value: T, index: number, array: T[]) => unknown
    ): number
    toReversed(): T[]
    toSorted(compareFn?: (a: T, b: T) => number): T[]
    toSpliced(start: number, deleteCount?: number, ...items: T[]): T[]
    with(index: number, value: T): T[]
  }

  interface Set<T> {
    union(other: Set<T>): Set<T>
    intersection(other: Set<T>): Set<T>
    difference(other: Set<T>): Set<T>
    symmetricDifference(other: Set<T>): Set<T>
  }

  interface ObjectConstructor {
    hasOwn(obj: object, prop: PropertyKey): boolean
  }

  interface PromiseConstructor {
    withResolvers<T>(): {
      promise: Promise<T>
      resolve: (value: T | PromiseLike<T>) => void
      reject: (reason?: any) => void
    }
  }
}

// ===== Array.prototype.at =====
if (!Array.prototype.at) {
  Array.prototype.at = function (index: number) {
    const len = this.length
    const relativeIndex = Math.trunc(index) < 0 ? len + index : index
    return this[relativeIndex]
  }
}

// ===== Array.prototype.findLast =====
if (!Array.prototype.findLast) {
  Array.prototype.findLast = function (predicate) {
    for (let i = this.length - 1; i >= 0; i--) {
      if (predicate.call(this, this[i], i, this)) return this[i]
    }
    return undefined
  }
}

// ===== Array.prototype.findLastIndex =====
if (!Array.prototype.findLastIndex) {
  Array.prototype.findLastIndex = function (predicate) {
    for (let i = this.length - 1; i >= 0; i--) {
      if (predicate.call(this, this[i], i, this)) return i
    }
    return -1
  }
}

// ===== Array.prototype.toReversed =====
if (!Array.prototype.toReversed) {
  Array.prototype.toReversed = function () {
    return [...this].reverse()
  }
}

// ===== Array.prototype.toSorted =====
if (!Array.prototype.toSorted) {
  Array.prototype.toSorted = function (compareFn?) {
    return [...this].sort(compareFn)
  }
}

// ===== Array.prototype.toSpliced =====
if (!Array.prototype.toSpliced) {
  Array.prototype.toSpliced = function (start, deleteCount, ...items) {
    const copy = [...this]
    copy.splice(start, deleteCount as number, ...items)
    return copy
  }
}

// ===== Array.prototype.with =====
if (!Array.prototype.with) {
  Array.prototype.with = function (index, value) {
    const copy = [...this]
    copy[index] = value
    return copy
  }
}

// ===== Set.prototype.* =====
if (!Set.prototype.union) {
  Set.prototype.union = function (other) {
    return new Set([...this, ...other])
  }
}
if (!Set.prototype.intersection) {
  Set.prototype.intersection = function (other) {
    return new Set([...this].filter((v) => other.has(v)))
  }
}
if (!Set.prototype.difference) {
  Set.prototype.difference = function (other) {
    return new Set([...this].filter((v) => !other.has(v)))
  }
}
if (!Set.prototype.symmetricDifference) {
  Set.prototype.symmetricDifference = function (other) {
    return new Set([
      ...[...this].filter((v) => !other.has(v)),
      ...[...other].filter((v) => !this.has(v))
    ])
  }
}

// ===== Object.hasOwn =====
if (!Object.hasOwn) {
  Object.hasOwn = function (obj, prop) {
    return Object.prototype.hasOwnProperty.call(obj, prop)
  }
}

// ===== Promise.withResolvers =====
if (!Promise.withResolvers) {
  Promise.withResolvers = function () {
    let resolve!: (value: any) => void
    let reject!: (reason?: any) => void
    const promise = new Promise<any>((res, rej) => {
      resolve = res
      reject = rej
    })
    return { promise, resolve, reject }
  }
}
