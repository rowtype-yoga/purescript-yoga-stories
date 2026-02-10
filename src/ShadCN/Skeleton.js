import { createElement } from "react"

var cls = "bg-accent animate-pulse rounded-md"

export function skeletonImpl(props) {
  return createElement("div", { className: cls, ...props })
}
