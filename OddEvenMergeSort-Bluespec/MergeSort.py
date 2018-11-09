import random
import math
import os

# input parameter setting
inputSize = 32 # make sure the size is power of 2
bitSize = 8 # make sure bitsize is power of 2
verbose = 0 # make it 1 to show debugging output
middleStage = int((math.log(inputSize, 2) - 1) ** 2 + 1)
totalStages = int(math.log(inputSize, 2) ** 2)
flags = [0 for i in range(totalStages)]

def mergeSort(inp, middleStage):
    if(len(inp) == 2):
        if(flags[middleStage-2] == 0):
            if(verbose):
                print("2 input sort at "+str(middleStage-1))
            sortRuleList.append(middleStage-1)
            flags[middleStage-2] = 1
        return [min(inp), max(inp)]
    if(len(inp) > 4):
        subMiddle = int((math.log(len(inp)//2, 2)-1) ** 2 + 1)
    else:
        subMiddle = 2
    l1 = mergeSort(inp[:len(inp)//2], subMiddle)
    l2 = mergeSort(inp[len(inp)//2:], subMiddle)
    return merge(l1, l2, middleStage)

def merge(l1, l2, middleStage):
    if(len(l1) == 2):
        if(flags[middleStage-1] == 0):
            if(verbose):
                print("2 input swap at "+str(middleStage))
            swapRuleDict[middleStage] = 2
            flags[middleStage-1] = 1
        
        l = l1+l2
        evens = [0, 2]
        odds = [1, 3]
        lx = [l[i] for i in evens]
        lx += [l[i] for i in odds]

        if(flags[middleStage+1-1] == 0):
            if(verbose):
                print("2 input sort at "+str(middleStage+1))
            sortRuleList.append(middleStage+1)
            flags[middleStage+1-1] = 1
        
        ly = [min([lx[0],lx[1]]), max([lx[0],lx[1]]), min([lx[2],lx[3]]), max([lx[2],lx[3]])]
        
        if(flags[middleStage+2-1] == 0):
            if(verbose):
                print("2 input merge at "+str(middleStage+2))
            mergeRuleDict[middleStage+2] = 2
            flags[middleStage+2-1] = 1
        return [ly[0], min([ly[1], ly[2]]), max([ly[1], ly[2]]), ly[3]]

    if(flags[middleStage-1] == 0):
        if(verbose):
            print(str(len(l1))+" input swap at "+str(middleStage))
        swapRuleDict[middleStage] = len(l1)
        flags[middleStage-1] = 1
    #swap work
    l = l1+l2
    evens = [i for i in range(2*len(l1)) if i%2 == 0]
    odds = [i for i in range(2*len(l1)) if i%2 ==1]
    lx = [l[i] for i in evens]
    ly = [l[i] for i in odds]
    
    mergeStage = middleStage + 2 * (int(math.log(len(lx), 2)) - 1) + 2
    if(flags[mergeStage-1] == 0):
        if(verbose):
            print(str(len(lx))+" input merge at "+str(mergeStage))
        mergeRuleDict[mergeStage] = len(lx)
        flags[mergeStage-1] = 1

    lxx = merge(lx[:len(lx)//2], lx[len(lx)//2:], middleStage+1)
    lyy = merge(ly[:len(ly)//2], ly[len(ly)//2:], middleStage+1)
    lprefinal = lxx+lyy
    
    lfinal = [lprefinal[0]]
    for i in range(len(lxx)-1):
        if(lprefinal[i+1] <= lprefinal[i+len(lxx)]):
            lfinal.append(lprefinal[i+1])
            lfinal.append(lprefinal[len(lxx)+i])
        else:
            lfinal.append(lprefinal[len(lxx)+i])
            lfinal.append(lprefinal[i+1])
    lfinal.append(lprefinal[len(lprefinal)-1])
    return lfinal

# here are our list and dicts for rules
sortRuleList = []
swapRuleDict = {}
mergeRuleDict = {}

# storing in the input
inp = [random.randint(1, (2**bitSize)-1) for i in range(inputSize)]
out = mergeSort(inp, middleStage)
# debugging purpose
if(verbose):
    print("Input : ")
    print(inp)
    print("Output : ")
    print(out)
    print("Total Stages : "+str(totalStages))
    print("Middle Stage : "+str(middleStage))
    print("Sort Stages : ")
    print(sortRuleList)
    print("Swap Stages")
    print(swapRuleDict)
    print("Merge Stages")
    print(mergeRuleDict)

# Bluespec Code Generation 
l = []
# HEADER
l.append("package MergeSort;\n")
l.append("\timport Vector::*;\n")
l.append("\t(* synthesize *)\n")
l.append("\t\nmodule mkMergeSort(Empty);\n")
l.append("\tVector#("+str(inputSize)+", Reg#(Bit#("+str(bitSize)+"))) storage["+str(totalStages+1)+"];\n")
for x in range(totalStages):
  l.append("\tReg#(Bool) flag"+str(x+1)+" <- mkReg(False);\n")
l.append("\tReg#(Bool) finishFlag <- mkReg(False);\n")
l.append("\n")
for x in range(inputSize):
  l.append("\tstorage[0]["+str(x)+"] <- mkReg("+str(inp[x])+");\n")
l.append("\tfor(Integer i=1; i<"+str(totalStages+1)+"; i=i+1) begin\n")
l.append("\t\tstorage[i] <- replicateM(mkReg(0));\n")
l.append("\tend\n")
l.append("\n")

#creating sort rules
for sortRuleIndex in sortRuleList:
    if(sortRuleIndex != 1):
        aFlag = " && flag"+str(sortRuleIndex-1)
    else:
        aFlag = ""
    l.append("rule rule"+str(sortRuleIndex)+"(!flag"+str(sortRuleIndex)+aFlag+");\n")
    l.append("// 2 input Sort Stage\n")
    l.append("\tlet x = storage["+str(sortRuleIndex-1)+"];\n")
    l.append("\tfor(Integer i=0; i<"+str(int(inputSize//2))+"; i=i+1) begin\n")
    l.append("\t\tif(x[2*fromInteger(i)] <= x[2*fromInteger(i)+1]) begin\n")
    l.append("\t\tstorage["+str(sortRuleIndex)+"][2*fromInteger(i)] <= x[2*fromInteger(i)];\n")
    l.append("\t\tstorage["+str(sortRuleIndex)+"][2*fromInteger(i)+1] <= x[2*fromInteger(i)+1];\n")
    l.append("\tend\n")
    l.append("\telse begin\n")
    l.append("\t\tstorage["+str(sortRuleIndex)+"][2*fromInteger(i)] <= x[2*fromInteger(i)+1];\n")
    l.append("\t\tstorage["+str(sortRuleIndex)+"][2*fromInteger(i)+1] <= x[2*fromInteger(i)];\n")
    l.append("\t\tend\n")
    l.append("\tend\n")
    l.append("\n\tflag"+str(sortRuleIndex)+" <= True;\n")
    l.append("endrule: rule"+str(sortRuleIndex)+"\n")
    l.append("\n")

#creating swap rules
for stageno, size in swapRuleDict.items():
    l.append("rule rule"+str(stageno)+"(!flag"+str(stageno)+" && flag"+str(stageno-1)+");\n")
    l.append("//"+str(size)+" input Swap Stage\n")
    l.append("\tlet x = storage["+str(stageno-1)+"];\n")
    noOfWings = int(inputSize//(2*size))
    wingSize = 2 * size
    cnt = 0
    for x in range(noOfWings):
        ind = [x * wingSize + i for i in range(2*size)]
        evens = [i for i in ind if i%2 == 0]
        odds = [i for i in ind if i%2 == 1]
        for e in evens:
            l.append("\tstorage["+str(stageno)+"]["+str(cnt)+"] <= x["+str(e)+"];\n")
            cnt += 1
        for o in odds:
            l.append("\tstorage["+str(stageno)+"]["+str(cnt)+"] <= x["+str(o)+"];\n")
            cnt += 1
    l.append("\n\tflag"+str(stageno)+" <= True;\n")
    l.append("endrule: rule"+str(stageno)+"\n")
    l.append("\n")

#creating merge rules
for stageno, size in mergeRuleDict.items():
    wingSize = 2 * size
    l.append("rule rule"+str(stageno)+"(!flag"+str(stageno)+" && flag"+str(stageno-1)+");\n")
    l.append("//"+str(wingSize)+" input Merge Stage\n")
    l.append("\tlet x = storage["+str(stageno-1)+"];\n")
    noOfWings = int(inputSize//wingSize)
    cnt = 0
    for x in range(noOfWings):
        l.append("\tstorage["+str(stageno)+"]["+str(cnt)+"] <= x["+str(cnt)+"];\n")
        cnt += 1
        ups = [i for i in range(wingSize*x + 1, wingSize*x + int(wingSize//2))]
        dwns = [i for i in range(wingSize*x + int(wingSize//2), wingSize*(x+1) - 1)]
        for i in range(len(ups)):
            l.append("\tif(x["+str(ups[i])+"] <= x["+str(dwns[i])+"]) begin\n")
            l.append("\t\tstorage["+str(stageno)+"]["+str(cnt)+"] <= x["+str(ups[i])+"];\n")
            l.append("\t\tstorage["+str(stageno)+"]["+str(cnt+1)+"] <= x["+str(dwns[i])+"];\n")
            l.append("\tend\n")
            l.append("\telse begin\n")
            l.append("\t\tstorage["+str(stageno)+"]["+str(cnt)+"] <= x["+str(dwns[i])+"];\n")
            l.append("\t\tstorage["+str(stageno)+"]["+str(cnt+1)+"] <= x["+str(ups[i])+"];\n")
            l.append("\tend\n")
            cnt += 2
        l.append("\tstorage["+str(stageno)+"]["+str(cnt)+"] <= x["+str(cnt)+"];\n")
        cnt += 1
    l.append("\n\tflag"+str(stageno)+" <= True;\n")
    l.append("endrule: rule"+str(stageno)+"\n")
    l.append("\n")

# for debugging (showing output)
l.append("\n// debugging rule\n")
l.append("\n")
l.append("rule rulefinish(flag"+str(totalStages)+" && !finishFlag);\n")
l.append("\tfor(Integer i=0; i<"+str(inputSize)+"; i=i+1) begin\n")
l.append("\t\t$display(\"Input -- %d :::: Output -- \",storage[0][i] ,storage["+str(totalStages)+"][i]);\n")
l.append("\tend\n")
l.append("\tfinishFlag <= True;\n")
l.append("endrule\n\n")
l.append("endmodule: mkMergeSort\n")
l.append("endpackage: MergeSort\n")

#creating bsv file
f = open("MergeSort.bsv", "w")
f.writelines(l)
f.close()

#code execution
print("**** Generated Bluespec code for Odd-Even Merge Sort HW ****")
print("################### Running the BSV File ###################")
print("..... Wait for sometime to get output ....")
os.system("make clean && make run")
