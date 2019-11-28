all: tsz.gen.hfst tsz.mor.hfstol

tsz.lexc.hfst: tsz.lexc
		hfst-lexc tsz.lexc -o tsz.lexc.hfst
tsz.twol.hfst: tsz.twol
		hfst-twolc tsz.twol -o tsz.twol.hfst
tsz.gen.hfst: tsz.lexc.hfst tsz.twol.hfst
		hfst-compose-intersect -1 tsz.lexc.hfst -2 tsz.twol.hfst -o tsz.gen.hfst


tsz.mor.hfst: tsz.gen.hfst
	hfst-invert $< -o tsz.mor.hfst

tsz.mor.hfstol: tsz.mor.hfst
	hfst-fst2fst -w $< -o tsz.mor.hfstol
