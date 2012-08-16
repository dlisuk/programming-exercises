module DeQ (DeQ(..)) where
  import Prelude hiding(head,tail,last,init)
  class DeQ q where
    empty     :: q a
    isEmpty   :: q a  -> Bool

    cons      :: a    -> q a -> q a
    head      :: q a  -> a
    tail      :: q a  -> q a

    snoc      :: a    -> q a -> q a
    last      :: q a  -> a
    init      :: q a  -> q a
