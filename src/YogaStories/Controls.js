import React from "react";

export function inputImpl(props) {
  return React.createElement("input", props);
}

export function elImpl(tag) {
  return function (props) {
    return function (children) {
      return React.createElement(tag, props, ...children);
    };
  };
}

export function parseFloat_(s) {
  return globalThis.parseFloat(s);
}

export function parseInt_(s) {
  return globalThis.parseInt(s, 10);
}
