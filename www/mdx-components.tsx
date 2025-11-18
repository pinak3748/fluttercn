import { CodeFigure } from "@/components/code-figure"
import { Accordion, Accordions } from "fumadocs-ui/components/accordion"
import defaultMdxComponents from "fumadocs-ui/mdx"
import type { MDXComponents } from "mdx/types"
import { MobileScreenshot, MobileScreenshots } from "./components/mobile-preview"

export function getMDXComponents(components?: MDXComponents): MDXComponents {
  return {
    ...defaultMdxComponents,
    Accordion,
    Accordions,
    figure: CodeFigure,
    MobileScreenshot,
    MobileScreenshots,
    ...components,
  }
}
