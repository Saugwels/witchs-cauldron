
module Molekuls where

import Data.List
import qualified Elements as Elements

data Molekul = Molekul {content :: [Elements.Element]} 

instance Show Molekul where
    show (Molekul cnt) = 
        foldl (\str (atom, num) -> str ++ atom ++ if num > 1 then (show num) else "" ) "" lst
        where lst = map (\xs@(x:_) -> ((Elements.name x), length xs)) . group . sort $ cnt
              
    

    
