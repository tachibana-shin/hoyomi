export function hashToInt(input: string): number {
  let hash = 0x811c9dc5; // FNV-1a offset basis

  for (let i = 0; i < input.length; i++) {
    hash ^= input.charCodeAt(i);
    hash = Math.imul(hash, 0x01000193); // FNV prime
    hash >>>= 0; // Convert to uint32
  }

  // Bit mixing for more randomness
  hash = (hash ^ (hash >>> 16)) >>> 0;
  hash = Math.imul(hash, 0x45d9f3b) >>> 0;
  hash = (hash ^ (hash >>> 16)) >>> 0;

  // Ensure result fits within 31-bit unsigned integer
  return hash & 0x7fffffff;
}
