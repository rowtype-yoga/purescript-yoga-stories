import { createElement } from "react"
import { Toaster as SonnerToaster } from "sonner"

export function sonnerImpl(props) {
  return createElement(SonnerToaster, { "data-slot": "sonner", ...props })
}
