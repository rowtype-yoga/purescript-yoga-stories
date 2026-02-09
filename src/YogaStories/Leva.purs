module YogaStories.Leva where

import Effect.Uncurried (EffectFn2, runEffectFn2)
import React.Basic.Hooks.Internal (Hook, unsafeHook)

foreign import data UseControls :: Type -> Type -> Type

foreign import useControlsImpl :: forall r. EffectFn2 String (Record r) (Record r)

useControls :: forall r. String -> Record r -> Hook (UseControls (Record r)) (Record r)
useControls name defaults = unsafeHook (runEffectFn2 useControlsImpl name defaults)
