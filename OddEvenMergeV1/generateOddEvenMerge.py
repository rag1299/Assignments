import os
import random
import math

inputSize = 64 # input size
bitSize = 8 # bus size
stages = int(math.log(inputSize,2) ** 2)
ruleCount = 0 # initial value
l = []

rulelist = []
for x in range(int(math.log(inputSize,2) ** 2)):
  rulelist.append([]) # created empty rules

def merge(l1, l2, size, stageNo, mf):
  if(size == 2):
    l3 = []
    # print("Swap Stage : "+str(stageNo))
    # rulelist[stageNo-1].append("Swap stage of size : 4")
    rulelist[stageNo-1].append(["swap", 4])
    ll1 = [l1[0], l2[0]]
    ll2 = [l1[1], l2[1]]
    if(ll1[0] <= ll1[1]):
      ll3 = ll1
    else:
      ll3 = [ll1[1], ll1[0]]
    # print("Sort Stage : "+str(stageNo+1))
    # rulelist[stageNo+1-1].append("Sort Stage of size : 2")
    rulelist[stageNo+1-1].append(["sort",2])
    if(ll2[0] <= ll2[1]):
      ll4 = ll2
    else:
      ll4 = [ll2[1], ll2[0]]
    # print("Sort Stage : "+str(stageNo+1))
    # rulelist[stageNo+1-1].append("Sort Stage of size : 2")
    rulelist[stageNo+1-1].append(["sort",2])
    l3.append(ll3[0])
    if(ll3[1] <= ll4[0]):
      l3.append(ll3[1])
      l3.append(ll4[0])
    else:
      l3.append(ll4[0])
      l3.append(ll3[1])
    l3.append(ll4[1])
    # print("oddEven Stage : "+str(stageNo+2))
    # rulelist[stageNo+2-1].append("oddEven Stage of size : 4")
    rulelist[stageNo+2-1].append(["oddEven", 4])
    return l3
  else:
    # print("Swap Stage : "+str(stageNo))
    # rulelist[stageNo-1].append("Swap Stage of size : "+str(2*len(l1)))
    rulelist[stageNo-1].append(["swap",2*len(l1)])
    lx = []
    ly = []
    for x in range(int(size/2)):
      lx.append(l1[2*x])
      ly.append(l1[2*x+1])
    for x in range(int(size/2)):
      lx.append(l2[2*x])
      ly.append(l2[2*x+1])
    lx1 = lx[:(size//2)]
    lx2 = lx[(size//2):]
    ly1 = ly[:(size//2)]
    ly2 = ly[(size//2):]
    lxy1 = merge(lx1, lx2, int(size//2), stageNo+1, mf)
    lxy2 = merge(ly1, ly2, int(size//2), stageNo+1, mf)
    s = len(lxy1)
    lfinal = [lxy1[0]]
    for x in range(s-1):
      if(lxy1[x+1] <= lxy2[x]):
        lfinal.append(lxy1[x+1])
        lfinal.append(lxy2[x])
      else:
        lfinal.append(lxy2[x])
        lfinal.append(lxy1[x+1])
    lfinal.append(lxy2[s-1])
    s = len(lfinal)
    if(mf == -1):
      # print("oddEven Stage : "+str(int(math.log(inputSize,2)) ** 2 - int(math.log(inputSize,2)-math.log(s,2)) ))
      rulelist[int(math.log(inputSize,2)) ** 2 - int(math.log(inputSize,2)-math.log(s,2)) -1].append(["oddEven",s])
    else:
      # print("oddEven Stage : "+str(int(math.log(s,2)-mf+(inputSize//(4*s))) ** 2 - (inputSize//(4*s))+mf))
      # rulelist[int(math.log(s,2)-mf+(inputSize//(4*s))) ** 2 - (inputSize//(4*s))+mf-1].append("oddEven Stage of size : "+str(s))
      rulelist[int(math.log(s,2)-mf+(inputSize//(4*s))) ** 2 - (inputSize//(4*s))+mf-1].append(["oddEven",s])
    return lfinal
def mergeSort(arr, size, stageNo, mf):
  if(size == 2):
    # print("Sort Stage : "+str(stageNo-1))
    # rulelist[stageNo-1-1].append("Sort stage of size : 2")
    rulelist[stageNo-1-1].append(["sort",2])
    if(arr[0] < arr[1]):
      return arr
    else:
      return [arr[1], arr[0]]
  else:
    innerStageNo = (int(math.log(size/2,2)) ** 2)+1
    half1 = arr[:(size//2)]
    half2 = arr[(size//2):]
    l = len(half1)
    l1 = mergeSort(half1, l, innerStageNo, mf+1)
    l2 = mergeSort(half2, l, innerStageNo, mf+1)
    return merge(l1, l2, l, innerStageNo, mf)

p = []
p = []
# print("Printing orignal values:")
for x in range(inputSize):
  p.append(random.randint(1,2**8-1))
  # print(p[x])
pSorted = mergeSort(p, len(p), len(p), -1)
# print("Printing Sorted values:")
# for x in pSorted:
  # print(x)

# for x in range(int(math.log(8,2) ** 2)):
  # print(rulelist[x])


f1 = open("randNumbers.txt", "w")
for x in range(inputSize):
  f1.write(str(random.randint(1,2**bitSize-1))+"\n")
f1.close()

l.append("package MergeSort;\n")
l.append("import Vector::*;\n")
l.append("import RegFile::*;\n")
l.append("(* synthesize *)\n")
l.append("module mkMergeSort(Empty);\n")
l.append("Vector#("+str(inputSize)+", Reg#(Bit#("+str(bitSize)+"))) storage["+str(stages+1)+"];\n")
# l.append("RegFile#(Bit#("+str(int(math.log(inputSize,2)))+"), Bit#("+str(bitSize)+")) inputFile <- mkRegFileFullLoad(\"randNumbers.txt\");\n")
for x in range(stages):
  l.append("Reg#(Bool) flag"+str(x)+" <- mkReg(False);\n")
l.append("Reg#(Bool) finishFlag <- mkReg(False);\n")
l.append("\n")
for x in range(inputSize):
  l.append("storage[0]["+str(x)+"] <- mkReg("+str(random.randint(1,2**bitSize))+");\n")
l.append("for(Integer i=1; i<"+str(stages+1)+"; i=i+1) begin\n")
l.append("storage[i] <- replicateM(mkReg(0));\n")
l.append("end\n")
l.append("\n")


# l.append("rule rule"+str(ruleCount)+"(!flag"+str(ruleCount)+");\n")

# l.append("for(Integer i=0; i<"+str(int(inputSize/2))+"; i=i+1) begin\n") # for start
# l.append("if(storage[0][2*fromInteger(i)] <= storage[0][2*fromInteger(i)+1]) begin\n")
# l.append("storage[1][2*fromInteger(i)] <= storage[0][2*fromInteger(i)];\n")
# l.append("storage[1][2*fromInteger(i)+1] <= storage[0][2*fromInteger(i)+1];\n")
# l.append("end\n")
# l.append("else begin\n")
# l.append("storage[1][2*fromInteger(i)] <= storage[0][2*fromInteger(i)+1];\n")
# l.append("storage[1][2*fromInteger(i)+1] <= storage[0][2*fromInteger(i)];\n")
# l.append("end\n")
# l.append("end\n") # for end

# l.append("flag"+str(ruleCount)+" <= True;\n")
# l.append("endrule\n")

index = 0
for rule in rulelist:
  if(index != 0):
    aFlag = " && flag"+str(index-1)
  else:
    aFlag = ""
  l.append("rule rule"+str(index)+"(!flag"+str(index)+aFlag+");\n")
  r = rule[0]
  if(r[0] == "sort"):
    l.append("// sort Stage\n")
    l.append("\tlet x = storage["+str(index)+"];\n")
    l.append("\tfor(Integer i=0; i<"+str(int(inputSize//r[1]))+"; i=i+1) begin\n")
    l.append("\t\tif(x[2*fromInteger(i)] <= x[2*fromInteger(i)+1]) begin\n")
    l.append("\t\tstorage["+str(index+1)+"][2*fromInteger(i)] <= x[2*fromInteger(i)];\n")
    l.append("\t\tstorage["+str(index+1)+"][2*fromInteger(i)+1] <= x[2*fromInteger(i)+1];\n")
    l.append("\tend\n")
    l.append("\telse begin\n")
    l.append("\t\tstorage["+str(index+1)+"][2*fromInteger(i)] <= x[2*fromInteger(i)+1];\n")
    l.append("\t\tstorage["+str(index+1)+"][2*fromInteger(i)+1] <= x[2*fromInteger(i)];\n")
    l.append("\t\tend\n")
    l.append("\tend\n")

  elif r[0] == "swap":
    l.append("// oddEven swap Stage\n")
    size = r[1]
    size1 = int(r[1]//2)
    l.append("\tlet x = storage["+str(index)+"];\n")
    innerIndex = 0
    for x in range(int(inputSize//size)):
      for y in range(size1):
        l.append("\tstorage["+str(index+1)+"]["+str(innerIndex)+"] <= x["+str((x*size)+(2*y))+"];\n")
        innerIndex += 1
      for y in range(size1):
        l.append("\tstorage["+str(index+1)+"]["+str(innerIndex)+"] <= x["+str((x*size)+(2*y)+1)+"];\n")
        innerIndex += 1

  elif r[0] == "oddEven":
    l.append("// merge Stage\n")
    size = r[1]
    size1 = int(r[1]//2)
    l.append("\tlet x = storage["+str(index)+"];\n")
    # l.append("\t $display(\"this is odd even merge having "+str(r[1])+" size each\");\n")
    innerIndex = 0
    innerIndex1 = 0
    for x in range(int(inputSize//size)):
      innerIndex = 0
      l.append("\tstorage["+str(index+1)+"]["+str(innerIndex1)+"] <= x["+str(x*size)+"];\n")
      innerIndex1 += 1
      innerIndex += 1
      for y in range(size1-1):
        # l.append("\tif(x["+str((size1*x)+1+y)+"] <= x["+str(size1*(x+1)+y)+"]) begin\n")
        l.append("\tif(x["+str(size*x+innerIndex)+"] <= x["+str(size*x+innerIndex+size1-1)+"]) begin\n")
        l.append("\t\tstorage["+str(index+1)+"]["+str(innerIndex1)+"] <= x["+str(size*x+innerIndex)+"];\n")
        l.append("\t\tstorage["+str(index+1)+"]["+str(innerIndex1+1)+"] <= x["+str(size*x+innerIndex+size1-1)+"];\n")
        l.append("\tend\n")
        l.append("\telse begin\n")
        l.append("\t\tstorage["+str(index+1)+"]["+str(innerIndex1)+"] <= x["+str(size*x+innerIndex+size1-1)+"];\n")
        l.append("\t\tstorage["+str(index+1)+"]["+str(innerIndex1+1)+"] <= x["+str(size*x+innerIndex)+"];\n")
        l.append("\tend\n")
        innerIndex1 += 2
        innerIndex += 1
      # l.append("\tstorage["+str(index+1)+"]["+str(innerIndex)+"] <= x["+str(inputSize-1)+"];\n")
      innerIndex += 1
      l.append("\tstorage["+str(index+1)+"]["+str(innerIndex1)+"] <= x["+str(size*x+innerIndex+size1-2)+"];\n")
      innerIndex1 += 1
      innerIndex += 1

  l.append("\n\tflag"+str(index)+" <= True;\n")
  l.append("endrule: rule"+str(index)+"\n")
  l.append("\n")
  index += 1

l.append("// debugging rule\n")
l.append("\n")
# l.append("rule ruleTemp(flag"+str(int(stages+1))+" && !finishFlag);\n")
l.append("rule ruleTemp(flag"+str(len(rulelist)-1)+" && !finishFlag);\n")
l.append("for(Integer i=0; i<"+str(inputSize)+"; i=i+1) begin\n") # for start
# l.append("$display(storage["+str(int(stages))+"][i]);\n")
l.append("$display(\"Output Stage : %d \",storage["+str(len(rulelist))+"][i]);\n")
l.append("end\n") # for end
l.append("finishFlag <= True;\n")
l.append("endrule\n")

l.append("endmodule: mkMergeSort\n")
l.append("endpackage: MergeSort\n")

f = open("MergeSort.bsv", "w")
f.writelines(l)
f.close()

print("**** Generated Bluespec code for OddEvenMergeSort ****")
for rule in rulelist:
  print(rule)
# print("Running the code...")
# os.system("make clean && make run")