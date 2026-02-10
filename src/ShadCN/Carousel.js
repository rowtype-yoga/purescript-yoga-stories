import useEmblaCarousel from "embla-carousel-react";

export const useEmblaCarouselImpl = (tuple, opts) => {
  const [ref, api] = useEmblaCarousel(opts);
  return tuple(ref)(api);
};

export const scrollPrevImpl = (api) => api.scrollPrev();
export const scrollNextImpl = (api) => api.scrollNext();
export const canScrollPrevImpl = (api) => api.canScrollPrev();
export const canScrollNextImpl = (api) => api.canScrollNext();
export const onReInitImpl = (handler, api) =>
  api.on("reInit", (a) => handler(a)());
export const onSelectImpl = (handler, api) =>
  api.on("select", (a) => handler(a)());
