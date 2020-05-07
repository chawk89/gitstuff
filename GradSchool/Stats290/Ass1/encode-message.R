message <- '
- It is better to have 100 functions operate on one data structure than 10 functions on 10 data structures.
- If a program manipulates a large amount of data, it does so in a small number of ways.
Alan Perlis, Epigrams in Programming.'

mchar <- strsplit(message, split="")[[1]]
mcharFreq <- sort(table(mchars))
mcharLeafList <- lapply(seq(mcharFreq),
                        function(i) makeLeaf(weight=mcharFreq[i],
                                             symbol=names(mcharFreq)[i]))

codeTree <- createCodeTree(mcharLeafList)
encoded <- encode(codeTree, mchar)

