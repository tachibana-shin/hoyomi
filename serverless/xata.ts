// Generated by Xata Codegen 0.30.1. Please do not edit.
import { buildClient } from "npm:@xata.io/client@latest";
import type {
  BaseClientOptions,
  SchemaInference,
  XataRecord,
} from "npm:@xata.io/client@latest";

const tables = [] as const;

export type SchemaTables = typeof tables;
export type InferredTypes = SchemaInference<SchemaTables>;

export type DatabaseSchema = {};

const DatabaseClient = buildClient();

const defaultOptions = {
  databaseURL:
    "https://Tachibana-Shin-s-workspace-lp3l17.us-east-1.xata.sh/db/hoyomi",
};

export class XataClient extends DatabaseClient<DatabaseSchema> {
  constructor(options?: BaseClientOptions) {
    super({ ...defaultOptions, ...options }, tables);
  }
}

let instance: XataClient | undefined = undefined;

export const getXataClient = () => {
  if (instance) return instance;

  instance = new XataClient();
  return instance;
};
