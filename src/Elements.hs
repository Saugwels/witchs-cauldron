
module Elements where

data Element = Element {name :: String, period :: Int, group :: Int}

instance Show Element where
    show (Element elementName _ _) = elementName

h = Element {name = "H", period=1, group=1} 

-- metals
li = Element {name = "Li", period=1, group=2}
be = Element {name = "Be", period=2, group=2}
b  = Element {name = "B",  period=3, group=2}
na = Element {name = "Na", period=1, group=3}
mg = Element {name = "Mg", period=2, group=3}
al = Element {name = "Al", period=3, group=3}
k  = Element {name = "K",  period=1, group=4}
ca = Element {name = "Ca", period=2, group=4}
-- nonmetals
c  = Element {name = "C",  period=4, group=2}
n  = Element {name = "N",  period=5, group=2}
o  = Element {name = "0",  period=6, group=2}
f  = Element {name = "F",  period=7, group=2}

cl = Element {name = "Cl", period=7, group=3}

--noble Gases
he = Element {name = "He", period=8, group=1}
ne = Element {name = "Ne", period=8, group=2}
ar = Element {name = "Ar", period=8, group=3}
kr = Element {name = "Kr", period=8, group=4}
xe = Element {name = "Xe", period=8, group=5}
rn = Element {name = "Rn", period=8, group=6}


