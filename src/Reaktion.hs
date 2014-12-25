
module Reaktion where

import qualified Molekul as M
import qualified Element as E
import qualified Salt    as S

data Reacting = Molekul | Element | Salt
data Part = Part {part :: (Int, Reacting)}

data Reaction = Reaction {educs :: [Part], products :: [Part]}

instance Show Reaction where
    show (Reaction edu pro) = foldl (\t (Part (f, p)) -> t ++ "lala") "" edu
