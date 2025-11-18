import defaultMdxComponents from "fumadocs-ui/mdx"
import { Accordion, Accordions } from "fumadocs-ui/components/accordion"
import { CodeFigure } from "@/components/code-figure"
import type { MDXComponents } from "mdx/types"

export function getMDXComponents(components?: MDXComponents): MDXComponents {
  return {
    ...defaultMdxComponents,
    Accordion,
    Accordions,
    figure: CodeFigure,
    ...components,
  }
}
