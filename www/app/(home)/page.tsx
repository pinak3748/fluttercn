"use client"

import { ArrowRight02Icon, Copy01Icon } from "@hugeicons/core-free-icons"
import { HugeiconsIcon } from "@hugeicons/react"
import { useState } from "react"
import { toast } from "sonner"

import { BenefitItem } from "@/components/benenfit-item"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Section } from "@/lib/components/section"
import { siteConfig } from "@/lib/config"

export default function HomePage() {
  const [copiedIndex, setCopiedIndex] = useState<number | null>(null)

  const copyToClipboard = async (text: string, index: number) => {
    try {
      await navigator.clipboard.writeText(text)
      setCopiedIndex(index)
      toast.success("Copied to clipboard!")
      setTimeout(() => setCopiedIndex(null), 2000)
    } catch (error) {
      console.error("Failed to copy:", error)
      toast.error("Failed to copy to clipboard")
    }
  }
  const commands = [
    {
      command: "npm install -g fluttercn",
      description: "Installing Fluttercn CLI globally...",
      subtext:
        "We just started, but we have a lot planned. Join us on this journey!",
    },
    {
      command: "fluttercn init",
      description: "Theme configuration created at lib/config/theme.dart",
      subtext:
        "Centralized theming to make your UI consistent and proper. Common widgets so you don't need to worry about components.",
    },
    {
      command: "fluttercn add button",
      subtext:
        "As easy as writing a command. Get the component in your codebase, owning 100% of the code.",
      description: "Button component added to lib/widgets/common/button.dart",
    },
  ]

  return (
    <div className="flex flex-col">
      {/* Hero Section */}
      <Section className="md:py-14">
        <div className="container mx-auto px-4">
          <div className="flex flex-col items-center gap-2 py-8 text-center md:py-16 lg:py-20 xl:gap-4">
            {/* Badge */}
            <Badge
              variant="secondary"
              className="w-fit gap-1 cursor-none border-transparent bg-muted text-muted-foreground px-3 py-1.5 text-xs sm:px-4 sm:py-2 sm:text-sm"
            >
              {/* <span className="flex size-2 rounded-full bg-blue-500" /> */}
              <span className="text-xs font-medium mr-1 sm:mr-2">🎉</span>
              Free & Open Source
              <HugeiconsIcon
                icon={ArrowRight02Icon}
                size={16}
                className="sm:size-5"
                color="currentColor"
                strokeWidth={1.5}
              />
            </Badge>

            {/* Heading */}
            <h1 className="max-w-4xl text-4xl font-semibold tracking-tight text-balance xl:tracking-tighter">
              Beautiful Flutter components for your App
            </h1>

            <p className="max-w-3xl text-base text-balance text-muted-foreground sm:text-md">
              A collection of professionally designed, customizable components.
              Install with a single command, own the code, and build faster.
            </p>

            <div className="flex items-center justify-center gap-2 pt-2">
              <Button asChild>
                <a href="/docs">Get Started</a>
              </Button>
              <Button variant="ghost" asChild>
                <a href="/docs/button">View Components</a>
              </Button>
            </div>

            {/* Terminal-like UI showing install -> init -> add component commands */}
            <div className="w-full max-w-2xl mx-auto mt-12 rounded-lg overflow-hidden bg-code border border-border shadow-lg text-left">
              <div className="flex items-center px-4 py-2.5 bg-muted/50 border-b border-border">
                <div className="flex space-x-1.5">
                  <span className="inline-block size-2.5 rounded-full bg-red-500"></span>
                  <span className="inline-block size-2.5 rounded-full bg-yellow-500"></span>
                  <span className="inline-block size-2.5 rounded-full bg-green-500"></span>
                </div>
                <span className="ml-3 text-xs text-muted-foreground font-mono tracking-wide">
                  Terminal
                </span>
              </div>
              <div className="px-6 py-5 space-y-6 font-mono text-sm bg-code text-code-foreground">
                {commands.map((command, index) => (
                  <div className="space-y-1.5" key={`command-${index}`}>
                    <div className="flex items-center gap-2 group">
                      <span className="text-primary/70 font-semibold text-xs">
                        $
                      </span>
                      <code className="text-primary/70 select-all font-medium">
                        {command.command}
                      </code>
                      <button
                        onClick={() => copyToClipboard(command.command, index)}
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-1.5 hover:bg-muted/50 rounded-md cursor-pointer"
                        aria-label="Copy command to clipboard"
                        title="Copy command"
                      >
                        <HugeiconsIcon
                          icon={Copy01Icon}
                          size={16}
                          color={copiedIndex === index ? "#0c0c22" : "currentColor"}
                          strokeWidth={1.5}
                        />
                      </button>
                    </div>
                    <div className="pl-2 space-y-1 text-xs">
                      <div className="flex items-start gap-1 text-muted-foreground">
                        <span className="text-green-500 text-lg leading-4">
                          ✓
                        </span>
                        <span>{command.description}</span>
                      </div>
                      <div className="pl-4 text-muted-foreground/70 italic leading-relaxed">
                        {command.subtext}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </Section>

      <Section className="md:py-14">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-12 space-y-1">
            <h2 className="max-w-4xl text-2xl font-semibold tracking-tight text-balance xl:tracking-tighter">
              Why Choose Fluttercn?
            </h2>
            <p className="max-w-3xl text-base text-balance font-normal text-muted-foreground sm:text-md mx-auto">
              Built for developers who want control and speed
            </p>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mx-auto">
            <BenefitItem
              title="No Package Dependencies"
              description="Components are copied to your project. You own and control every line of code."
            />
            <BenefitItem
              title="Full Code Ownership"
              description="Modify, extend, or customize components however you need. No black boxes."
            />
            <BenefitItem
              title="Theme Integration"
              description="Works seamlessly with your existing Flutter theme configuration."
            />
            <BenefitItem
              title="CLI-Powered"
              description="Fast workflow with automatic file management and import path fixing."
            />
            <BenefitItem
              title="Curated Quality"
              description="Only production-ready components that have been tested in real projects."
            />
            <BenefitItem
              title="Native Flutter"
              description="Built with standard Flutter widgets. No external dependencies required."
            />
          </div>
        </div>
      </Section>

      {/* Footer */}
      <footer className="border-t border-border bg-background">
        <div className="container mx-auto px-4 py-8">
          <div className="flex flex-col items-center justify-center gap-4 text-center">
            <div className="flex items-center gap-2">
              <img
                src="/logo-dark.png"
                alt="Flutter CN"
                width={20}
                height={20}
                className="inline-block rounded-sm"
              />
              <span className="font-semibold text-sm">{siteConfig.name}</span>
            </div>
            <nav className="flex flex-wrap items-center justify-center gap-4 text-sm text-muted-foreground">
              <a
                href="/docs/installation"
                className="hover:text-foreground transition-colors"
              >
                Docs
              </a>
              <a
                href="/docs/components"
                className="hover:text-foreground transition-colors"
              >
                Components
              </a>
            </nav>
            <p className="text-xs text-muted-foreground">
              © {new Date().getFullYear()} {siteConfig.name}. Free & Open Source.
            </p>
          </div>
        </div>
      </footer>
    </div>
  )
}
