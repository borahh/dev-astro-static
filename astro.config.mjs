// @ts-check
import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";

// https://astro.build/config
export default defineConfig({
  server: {
    host: true,
    port: 4321,
  },
  vite: {
    server: {
      host: "0.0.0.0",
      port: 4321,
      hmr: { clientPort: 4321 },
      watch: { usePolling: true },
    },
    plugins: [tailwindcss()],
  },
});
