import { type ReactNode } from "react"

import { cn } from "@/lib/utils"

interface SectionProps {
  children: ReactNode
  className?: string
  containerClassName?: string
}

export function Section({
  children,
  className,
  containerClassName,
}: SectionProps) {
  return (
    <section className={cn("py-16 md:py-24", className)}>
      <div
        className={cn(
          "container mx-auto px-4 sm:px-6 lg:px-8",
          containerClassName
        )}
      >
        {children}
      </div>
    </section>
  )
}
