
module Salt where

import qualified Element as Element

data Ion  = Ion {name :: String, charge :: Int} deriving (Eq)
data Salt = Salt {kation :: Kation, factorKa :: Int
                 ,anion :: Anion, factorAn :: Int}

type Kation = Ion
type Anion  = Ion

instance Show Ion where
    show (Ion ion charging) = ion ++ show (abs charging)
                           ++ (if charging > 0 then "+" else "-")

instance Show Salt where
    show (Salt ka faKa an faAn) = name ka
        ++ (if faKa > 1 && faKa /= faAn then show faKa else "")
        ++ (if faAn > 1 && faKa /= faAn then
            if an `elem` moleculIons then
                ("(" ++ name an ++ ")" ++ show faAn)
                    else (name an ++ show faAn)
            else (name an ++ ""))

genSalt :: Element.Element -> Element.Element -> Salt
genSalt ka an = empiricalFormula (elementToIon ka) (elementToIon an)

empiricalFormula :: Kation -> Anion -> Salt
empiricalFormula metal@(Ion ka kaCharge) nonmetal@(Ion an anCharge)=
    Salt {kation = metal, factorKa = abs anCharge
         ,anion = nonmetal, factorAn = kaCharge}

elementToIon :: Element.Element -> Ion
elementToIon (Element.Element ename p gp) =
    if p==8 then error "Noble Gases won't be Ions!" else Ion {name=ename, charge=ch}
    where ch = if p <= 3 then p else p-8

ionToElement :: Ion -> Element.Element
ionToElement ion = Element.Element {Element.name=(name ion), Element.period=endch, Element.group=2}
        where endch = if (charge ion) <= 3 then (charge ion) else (charge ion)+8

-- Molecular ions
carbonat = Ion {name = "CO3", charge = -2}
sulfat   = Ion {name = "SO4", charge = -2}
nitrat   = Ion {name = "NO3", charge = -1}
phosphat = Ion {name = "PO4", charge = -3}
hydrogenoxid = Ion {name = "OH", charge = -1}
hydrogencarbonat = Ion {name = "HCO3", charge = -1}
hydrogensulfat   = Ion {name = "HSO4", charge = -1}

moleculIons = [carbonat, sulfat, nitrat, phosphat, hydrogenoxid, hydrogencarbonat, hydrogensulfat]
