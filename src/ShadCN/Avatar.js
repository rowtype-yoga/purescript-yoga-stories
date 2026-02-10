import { createElement } from "react"
import { Avatar as AvatarPrimitive } from "radix-ui"

var rootCls = "relative flex size-8 shrink-0 overflow-hidden rounded-full select-none"
var imageCls = "aspect-square size-full"
var fallbackCls = "bg-muted text-muted-foreground flex size-full items-center justify-center rounded-full text-sm"

export function avatarImpl(props) {
  var { children, ...rest } = props
  return createElement(AvatarPrimitive.Root, { className: rootCls, "data-slot": "avatar", ...rest }, ...([].concat(children)))
}

export function avatarImageImpl(props) {
  var { ...rest } = props
  return createElement(AvatarPrimitive.Image, { className: imageCls, "data-slot": "avatar-image", ...rest })
}

export function avatarFallbackImpl(props) {
  var { children, ...rest } = props
  return createElement(AvatarPrimitive.Fallback, { className: fallbackCls, "data-slot": "avatar-fallback", ...rest }, ...([].concat(children)))
}
