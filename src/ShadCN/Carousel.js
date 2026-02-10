import useEmblaCarousel from "embla-carousel-react";

export const useEmblaCarouselImpl = () => {
  const [ref, api] = useEmblaCarousel({});
  return { ref, api };
};

export const scrollPrevImpl = (api) => api.scrollPrev();
export const scrollNextImpl = (api) => api.scrollNext();
export const canScrollPrevImpl = (api) => api.canScrollPrev();
export const canScrollNextImpl = (api) => api.canScrollNext();
export const onImpl = (event, handler, api) =>
  api.on(event, (a) => handler(a)());
