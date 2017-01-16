library(xtable)

models_log <- matrix(0, ncol = 2, nrow = 0)
models_log <- data.frame(models_log)
colnames(models_log) = c("Metrices", "AIC")

models <- matrix(0, ncol = 2, nrow = 0)
models <- data.frame(models_log)
colnames(models) = c("Metrices", "AIC")

models_log[1,] = c("loc", 8330.204)
models_log[2,] = c("lOBlank, uniq_Opnd", 8273.336)
models_log[3,] = c("iv(g), lOBlank, uniq_Opnd", 8251.478)
models_log[4,] = c("v(g), lOBlank, uniq_Opnd, total_Opnd", 8224.101)
models_log[5,] = c("lOBlank, LocCodeAndComment, uniq_Opnd, total_Opnd branchCount", 8209.657)

models[1,] = c("uniq_Opnd", 8522.037)
models[2,] = c("i, uniq_Op", 8414.337)
models[3,] = c("i, LocCodeAndComment, uniq_Op", 8398.804)
models[4,] = c("loc, v, i, uniq_Op", 8377.909)
models[5,] = c("loc, v, i, LocCodeAndComment, uniq_Op", 8369.302)

logTable = xtable(models_log, caption = "Best models with different amounts of metrices from logarithmic data")
Table = xtable(models, caption = "Best models with different amounts of metrices from original data")

print(logTable)
print(Table)

"WITHOUT LOGARITHM"
"Level 1:"
"uniq_Opnd"
"8522.037"
"-  -  -  -  -  -  -  -  -"
"Level 2:"
"i uniq_Op"
"8414.337"
"-  -  -  -  -  -  -  -  -"
"Level 3:"
"i LocCodeAndComment uniq_Op"
"8398.804"
"-  -  -  -  -  -  -  -  -"
"Level 4:"
"loc v i uniq_Op"
"8377.909"
"-  -  -  -  -  -  -  -  -"
"Level 5:"
"loc v i LocCodeAndComment uniq_Op"
"8369.3022"


"WITH LOGARITHM"
"Level 1:"
"loc"
"8330.204"
"-  -  -  -  -  -  -  -  -"
"Level 2:"
"lOBlank uniq_Opnd"
"8273.336"
"-  -  -  -  -  -  -  -  -"
"Level 3:"
"iv(g) lOBlank uniq_Opnd"
"8251.478"
"-  -  -  -  -  -  -  -  -"
"Level 4:"
"v(g) lOBlank uniq_Opnd total_Opnd"
"8224.101"
"-  -  -  -  -  -  -  -  -"
"Level 5:"
"lOBlank LocCodeAndComment uniq_Opnd total_Opnd branchCount"
"8209.657"

