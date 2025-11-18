"use client"

import * as React from "react"

export function CodeFigure({ children, className, ...props }: React.HTMLAttributes<HTMLFigureElement>) {
  const ref = React.useRef<HTMLFigureElement>(null)
  const [code, setCode] = React.useState("")

  React.useEffect(() => {
    if (ref.current) {
      const codeElement = ref.current.querySelector("code[data-raw]")
      if (codeElement) {
        const rawCode = codeElement.getAttribute("data-raw") || codeElement.textContent || ""
        setCode(rawCode)
      } else {
        const codeEl = ref.current.querySelector("code")
        if (codeEl) {
          setCode(codeEl.textContent || "")
        }
      }
    }
  }, [children])

  const isCodeBlock = props["data-rehype-pretty-code-figure"] !== undefined

  return (
    <figure
      ref={ref}
      className={isCodeBlock ? `group ${className || ""}` : className}
      {...props}
    >
      {children}
    </figure>
  )
}

