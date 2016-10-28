print("WITHOUT LOGARITHM")

print("Level 1:")
print(paste(allColumns[smallest_1[1]]))
print(smallestVal_1)
print("-  -  -  -  -  -  -  -  -")


print("Level 2:")
print(paste(allColumns[smallest_2[1]],allColumns[smallest_2[2]]))
print(smallestVal_2)
print("-  -  -  -  -  -  -  -  -")


print("Level 3:")
print(paste(allColumns[smallest_3[1]],allColumns[smallest_3[2]],allColumns[smallest_3[3]]))
print(smallestVal_3)
print("-  -  -  -  -  -  -  -  -")


print("Level 4:")
print(paste(allColumns[smallest_4[1]],allColumns[smallest_4[2]],allColumns[smallest_4[3]],allColumns[smallest_4[4]]))
print(smallestVal_4)
print("-  -  -  -  -  -  -  -  -")


print("Level 5:")
print(paste(allColumns[smallest_5[1]],allColumns[smallest_5[2]],allColumns[smallest_5[3]],allColumns[smallest_5[4]],allColumns[smallest_5[5]]))
print(smallestVal_5)

print("WITH LOGARITHM")


print("Level 1:")
print(paste(allColumns[smallest_1_log[1]]))
print(smallestVal_1_log)
print("-  -  -  -  -  -  -  -  -")


print("Level 2:")
print(paste(allColumns[smallest_2_log[1]],allColumns[smallest_2_log[2]]))
print(smallestVal_2_log)
print("-  -  -  -  -  -  -  -  -")


print("Level 3:")
print(paste(allColumns[smallest_3_log[1]],allColumns[smallest_3_log[2]],allColumns[smallest_3_log[3]]))
print(smallestVal_3_log)
print("-  -  -  -  -  -  -  -  -")


print("Level 4:")
print(paste(allColumns[smallest_4_log[1]],allColumns[smallest_4_log[2]],allColumns[smallest_4_log[3]],allColumns[smallest_4_log[4]]))
print(smallestVal_4_log)
print("-  -  -  -  -  -  -  -  -")


print("Level 5:")
print(paste(allColumns[smallest_5_log[1]],allColumns[smallest_5_log[2]],allColumns[smallest_5_log[3]],allColumns[smallest_5_log[4]],allColumns[smallest_5_log[5]]))
print(smallestVal_5_log)

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

