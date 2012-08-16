module BDeQ where
  import Prelude hiding(head,tail,last,init)
  import DeQ
  data BatchedDeQ a = BDeQ[a][a] deriving (Show,Eq)
  splitLists  :: [a]  -> ([a], [a])
  splitLists []       = ([],[])
  splitLists xs   = ( (take l1 xs) , (take l2 (reverse xs) ) )
    where
      l = length xs
      l1 =  (div l 2)
      l2 =  l1 + (mod l 2)
  instance DeQ BatchedDeQ where
    isEmpty (BDeQ [] []) = True
    isEmpty _            = False

    cons x (BDeQ f b)    = BDeQ (x:f) b

    head (BDeQ [] [])    = error "Empty Deque"
    head (BDeQ [] b)     = head (BDeQ nf nb)
                           where (nb,nf) = splitLists b
    head (BDeQ (x:_) _)  = x

    tail (BDeQ [] [])    = error "Empty Deque"
    tail (BDeQ [] b)     = tail (BDeQ nf nb)
                           where (nb,nf) = splitLists b
    tail (BDeQ (_:f) b)  = BDeQ f b

    snoc x (BDeQ f b)    = BDeQ f (x:b)

    last (BDeQ [] [])    = error "Empty Deque"
    last (BDeQ f [])     = head (BDeQ nf nb)
                           where (nf,nb) = splitLists f
    last (BDeQ _ (x:_))  = x

    init (BDeQ [] [])    = error "Empty Deque"
    init (BDeQ f [])     = init (BDeQ nf nb)
                           where (nf,nb) = splitLists f
    init (BDeQ f (_:b))  = BDeQ f b

    empty = BDeQ [] []
