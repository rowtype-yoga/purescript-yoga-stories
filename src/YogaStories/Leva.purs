module YogaStories.Leva where

import Prelude

import Foreign (Foreign)
import Prim.RowList (class RowToList)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import React.Basic.Hooks.Internal (Hook, unsafeHook)
import Record.Builder as Builder
import Type.Proxy (Proxy(..))
import YogaStories.Leva.Schema (class WriteSchemaFields, class SchemaToProps, class ReadProps, readProps, writeSchema)

foreign import data UseControls :: Type -> Type -> Type
foreign import useControlsImpl :: EffectFn2 String Foreign Foreign

useControls
  :: forall schema rl props to propsTo
   . RowToList schema rl
  => WriteSchemaFields rl schema () to
  => SchemaToProps rl props
  => ReadProps rl schema () propsTo
  => String
  -> Record schema
  -> Hook (UseControls (Record schema)) (Record propsTo)
useControls name schema = unsafeHook do
  let schemaForeign = writeSchema schema
  result <- runEffectFn2 useControlsImpl name schemaForeign
  pure (Builder.build (readProps (Proxy :: Proxy rl) schema result) {})
