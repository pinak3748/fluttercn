import Image from "next/image"

interface MobileScreenshotProps {
  src: string
  alt: string
  width?: number
}

export function MobileScreenshot({
  src,
  alt,
  width = 320,
}: MobileScreenshotProps) {
  const clampedWidth = Math.min(Math.max(width, 220), 420)

  return (
    <div className="flex w-full justify-center py-8">
      <div
        className="relative select-none"
        style={{ width: `min(${clampedWidth}px, 90vw)` }}
      >
        <div className="relative aspect-[9/19.5] rounded-[42px] ">
          <div className="relative h-full w-full overflow-hidden rounded-[24px] bg-black">
            <Image
              src={src}
              alt={alt}
              fill
              sizes="(max-width: 768px) 90vw, 360px"
              className="object-cover"
              priority={false}
              loading="lazy"
            />
          </div>
        </div>
      </div>
    </div>
  )
}

export function MobileScreenshots({ children }: { children: React.ReactNode }) {
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 my-8">
      {children}
    </div>
  )
}
