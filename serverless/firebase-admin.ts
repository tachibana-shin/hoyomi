import admin from "firebase-admin-release"
import type typeAdmin from "firebase-admin"

const serviceAccountKey = await Deno.readTextFile("./service-account-key.json")

export const app = (admin as typeof typeAdmin).initializeApp({
  credential: admin.credential.cert(JSON.parse(serviceAccountKey))
})
