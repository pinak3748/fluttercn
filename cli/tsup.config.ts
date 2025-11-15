import fs from "fs-extra";
import { join } from "path";
import { defineConfig } from "tsup";

export default defineConfig({
  entry: ["src/index.ts"],
  format: ["esm"],
  dts: true,
  clean: true,
  shims: true,
  // Copy core directory to dist after build
  onSuccess: async () => {
    const srcCore = join(process.cwd(), "src", "core");
    const distCore = join(process.cwd(), "dist", "core");
    try {
      fs.copySync(srcCore, distCore, { overwrite: true });
      console.log("✓ Copied core directory to dist");
    } catch (error) {
      console.error("Failed to copy core directory:", error);
    }
  },
});