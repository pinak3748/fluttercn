import { siteConfig } from "@/lib/config"
import type { BaseLayoutProps } from "fumadocs-ui/layouts/shared"

export function baseOptions(options?: { hideLinks?: boolean }): BaseLayoutProps {
  return {
    nav: {
      title: (
        <>
          <img
            src="/logo-dark.png"
            alt="Flutter CN"
            width={24}
            height={24}
            className="inline-block rounded-sm"
          />
          Flutter CN
        </>
      ),
      url: "/",
    },
    ...(options?.hideLinks
      ? {}
      : {
          links: siteConfig.navItems.map((item) => ({
            type: "main" as const,
            text: (
              <span className="flex items-center gap-1.5 font-medium ">
                {item.label}
                {!item.isAvailable && (
                  <span className="inline-flex items-center rounded-md bg-muted px-2 py-0.5 text-xs font-normal text-muted-foreground">
                    Coming soon
                  </span>
                )}
              </span>
            ),
            url: item.isAvailable ? item.href : "#",
            active: "nested-url" as const,
            ...(item.isAvailable ? {} : { external: false }),
          })),
        }),
  }
}
