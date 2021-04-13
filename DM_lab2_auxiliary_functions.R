# Data Mining course 2020/2021: lab2 - auxiliary functions
# author: Andrzej Janusz
# email: a.janusz@mimuw.edu.pl

# a function which removes non-freqent itemsets from a transaction
# it gets as an input a vector of itemsets (a transaction) and a vector itemsets to remove
filterItems = function(itemSet, itemsToRm)  {
  if(length(itemsToRm) > 0) {
    idxToRm = which(itemSet %in% itemsToRm)
    if(length(idxToRm) > 0) itemSet = itemSet[-idxToRm]
  }
  return(itemSet)
}

# a function which removes empty transactions from a list
removeEmptyTrans = function(transactionList) {
  if(length(transactionList) > 0)  {
    transToRm = which(sapply(transactionList, length) < 1)
    if(length(transToRm) > 0) transactionList = transactionList[-transToRm]
  }
  return(transactionList)
}

# a function which creates candidates for frequent itemsets size N+1 from frequent itemsets size N
# (we investigate lexically sorted itemsets and marge those with matchig prefixes of size N-1)
# as an input, this function gets a vector of itemsets
createCandidates = function(freqItemSets)  {
  candidatesSet = list()
  if(length(freqItemSets) > 1) {
    tmpItems = strsplit(freqItemSets, "_")
    if(length(tmpItems[[1]]) > 1) {
      itemPrefixes = sapply(tmpItems, function(x) paste(x[1:(length(x)-1)], collapse = "_"))
      itemSurfixes = sapply(tmpItems, function(x) x[length(x)])
      i = 1
      while(i < length(tmpItems)) {
        tmpPrefix = itemPrefixes[i]
        tmpSurfix = itemSurfixes[i]
        j = i + 1
        while(j <= length(tmpItems) && tmpPrefix == itemPrefixes[j]) {
          candidatesSet[[length(candidatesSet) + 1]] = paste(freqItemSets[i], 
                                                             itemSurfixes[j], sep = "_")
          j = j + 1
        }
        i = i + 1
      }
    } else {
      for(i in 1:(length(freqItemSets)-1)) {
        tmpCandidate = freqItemSets[i]
        for(j in (i+1):length(freqItemSets)) {
          if(freqItemSets[j] != freqItemSets[i]) {
            candidatesSet[[length(candidatesSet) + 1]] = paste(freqItemSets[i], 
                                                               freqItemSets[j], sep = "_")
          }
        }
      }
    }
  }
  
  if(length(candidatesSet) > 0) {
    candidatesSet = unique(unlist(candidatesSet))
    candidatesSet = candidatesSet[order(candidatesSet)]
  }
  return(candidatesSet)
}

# a function which eliminates non-frequent itemsets using the "aprori rule"
# (i.e. every subset of a frequent itemset must be frequent)
# as an input, this function gets a single candidating itemset and a list of 
# shorter frequent itemsets
aprioriEliminate = function(itemSet, freqItemSets)  {
  itemsVec = strsplit(itemSet, "_")[[1]]
  N = length(itemsVec)
  eliminateFlag = FALSE
  i = 1
  while(!eliminateFlag & i <= N) {
    if(!(paste(itemsVec[-i], collapse="_") %in% freqItemSets)) eliminateFlag = TRUE
    i = i + 1
  }
  return(eliminateFlag)
}
# the end of definitions of auxilary functions
