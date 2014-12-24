
module Molekul where

import Data.List
import Data.Ord 
import qualified Element as Elements

type Number = Int
data Molekul = Molekul {content :: [(Elements.Element, Number)]} 

instance Show Molekul where
    show (Molekul cnt) = 
        foldl (\str (atom, num) -> str ++ atom ++ if num > 1 then show num else "") "" lst
        where sorted = map (\(atom, num) -> (Elements.name atom, num)) cnt
              lst    = sortBy (comparing snd) sorted
    

    
