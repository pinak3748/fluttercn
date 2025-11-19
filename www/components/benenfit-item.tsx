import { CheckmarkBadge02Icon } from "@hugeicons/core-free-icons"
import { HugeiconsIcon } from "@hugeicons/react"

export function BenefitItem({
  title,
  description,
}: {
  title: string
  description: string
}) {
  return (
    <div className="flex gap-3">
      <div className="shrink-0 mt-1">
        <HugeiconsIcon
          icon={CheckmarkBadge02Icon}
          size={24}
          color="currentColor"
          strokeWidth={1.5}
        />
      </div>
      <div>
        <h3 className="font-semibold mb-1">{title}</h3>
        <p className="text-sm text-muted-foreground">{description}</p>
      </div>
    </div>
  )
}
