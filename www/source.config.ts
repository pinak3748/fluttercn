import {
  defineConfig,
  defineDocs,
  frontmatterSchema,
  metaSchema,
} from "fumadocs-mdx/config"
import rehypePrettyCode from "rehype-pretty-code"

import { transformers } from "@/lib/highlight-code"

// You can customise Zod schemas for frontmatter and `meta.json` here
// see https://fumadocs.dev/docs/mdx/collections
export const docs = defineDocs({
  dir: "content/docs",
  docs: {
    schema: frontmatterSchema,
    postprocess: {
      includeProcessedMarkdown: true,
    },
  },
  meta: {
    schema: metaSchema,
  },
})

export default defineConfig({
  mdxOptions: {
    rehypePlugins: (plugins) => {
      plugins.shift()
      plugins.push([
        rehypePrettyCode as any,
        {
          theme: {
            dark: "github-dark",
            light: "github-light-default",
          },
          transformers: [
            ...transformers,
            {
              pre(node) {
                // Enable line numbers by default
                const codeElement = node.children?.find(
                  (child: any) =>
                    child.type === "element" && child.tagName === "code"
                )
                if (codeElement) {
                  codeElement.properties = codeElement.properties || {}
                  codeElement.properties["data-line-numbers"] = ""
                }
              },
            },
          ],
        },
      ])

      return plugins
    },
  },
})
