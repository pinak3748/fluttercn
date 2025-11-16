import { ArrowRight02Icon } from "@hugeicons/core-free-icons"
import { HugeiconsIcon } from "@hugeicons/react"
import Link from "next/link"

import { BenefitItem } from "@/components/benenfit-item"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Section } from "@/lib/components/section"
import { cn } from "@/lib/utils"

export default function HomePage() {
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
      <section className="py-14">
        <div className="container mx-auto px-4">
          <div className="flex flex-col items-center gap-2 py-8 text-center md:py-16 lg:py-20 xl:gap-4">
            {/* Badge */}
            <Badge
              variant="secondary"
              className="w-fit gap-1 border-transparent bg-primary text-primary-foreground px-4"
            >
              <span className="flex size-2 rounded-full bg-blue-500" />
              Free & Open Source
              <HugeiconsIcon
                icon={ArrowRight02Icon}
                size={24}
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
                <a href="/docs/installation">Get Started</a>
              </Button>
              <Button variant="ghost" asChild>
                <a href="/docs/components">View Components</a>
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
                    <div className="flex items-center gap-2">
                      <span className="text-primary/70 font-semibold text-xs">
                        $
                      </span>
                      <code className="text-primary/70 select-all font-medium">
                        {command.command}
                      </code>
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
      </section>

      <Section>
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-12 space-y-1">
            <h2 className="max-w-4xl text-2xl font-semibold tracking-tight text-balance xl:tracking-tighter">
              Why Choose FlutterCN?
            </h2>
            <p className="max-w-3xl text-base text-balance text-muted-foreground sm:text-md mx-auto">
              Built for developers who want control and speed
            </p>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
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

      {/* Final CTA Section */}
      <Section className="bg-muted/30">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">
            Ready to Build Faster?
          </h2>
          <p className="text-lg text-muted-foreground mb-8">
            Start using FlutterCN today and accelerate your Flutter development.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <Link
              href="/docs/installation"
              className={cn(
                "inline-flex items-center justify-center",
                "px-8 py-3 rounded-lg font-medium",
                "bg-primary text-primary-foreground",
                "hover:bg-primary/90 transition-colors",
                "shadow-sm"
              )}
            >
              Install Now
              <HugeiconsIcon
                icon={ArrowRight02Icon}
                size={24}
                color="currentColor"
                strokeWidth={1.5}
              />
            </Link>
            <Link
              href="/docs/components"
              className={cn(
                "inline-flex items-center justify-center",
                "px-8 py-3 rounded-lg font-medium",
                "bg-secondary text-secondary-foreground",
                "hover:bg-secondary/80 transition-colors",
                "border border-border"
              )}
            >
              Browse Components
            </Link>
          </div>
        </div>
      </Section>
    </div>
  )
}
