require("pscl")

fm <- glm(halsteadData$defects ~ halsteadData$uniq_Op+halsteadData$uniq_Opnd+halsteadData$i+halsteadData$LocCodeAndComment+halsteadData$lOBlank)
summary(fm)
mcFadden <- pR2(fm)[4]
mcFadden