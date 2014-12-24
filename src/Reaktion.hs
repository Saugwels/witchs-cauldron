
module Reaktion where

import qualified Molekul as M
import qualified Element as E
import qualified Salt    as S

data Part = ReactingMol {factorMol :: Int, mol :: M.Molekul)}
            |ReactingSalt {factorSalt :: Int, salt :: S.Salt)}

data Reaction = Reaction {educs :: Part, products :: Part}

letReact :: [Part] -> [Part]
