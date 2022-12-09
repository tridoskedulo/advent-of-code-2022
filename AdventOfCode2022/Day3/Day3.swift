//
//  Day3.swift
//  AdventOfCode2022
//
//  Created by Tri Do on 03/12/2022.
//

import Foundation

class Day3 {
    static let characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    class func findSumPriorities() { // Part 1
        let rucksacks = input.components(separatedBy: CharacterSet.newlines)
        var total = 0
        for rucksack in rucksacks {
            if rucksack.count % 2 != 0 { // make sure two array have same lenght
                print("🔵 \(rucksack) 🔵")
                continue
            }
            let fComp = rucksack.prefix(rucksack.count / 2) // first compartment
            let sComp = rucksack.dropFirst(rucksack.count / 2) // second compartment

            let firstItems = Set(Array(fComp))
            let secondItems = Set(Array(sComp))
            if let commonItem = firstItems.intersection(secondItems).first {
                let itemString = String(commonItem)
                let priority = (characters.firstIndex(of: itemString) ?? -1) + 1
                total += priority
            }
        }
        print(total)
    }

    class func findSumBadgePriorities() { // Part 2

        let rucksacks = input.components(separatedBy: CharacterSet.newlines)
        var groupOfThree = [String]()

        var total = 0
        for rucksack in rucksacks {
            if groupOfThree.count < 3 {
                groupOfThree.append(rucksack)
                if groupOfThree.count == 3 {
                    let firstRucksack = Set(Array(groupOfThree[0]))
                    let secondRucksack = Set(Array(groupOfThree[1]))
                    let thirdRucksack = Set(Array(groupOfThree[2]))

                    if let commonItem = firstRucksack.intersection(secondRucksack).intersection(thirdRucksack).first {
                        let itemString = String(commonItem)
                        let priority = (characters.firstIndex(of: itemString) ?? -1) + 1
                        total += priority
                    }
                    groupOfThree.removeAll(keepingCapacity: true)
                }
            }
        }
        print(total)
    }
    
    static let exampleInput = """
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    """
    
    static let input = """
WjmsdnddnmQPZPPJPL
bQllTtpBlgwtrbbCwfZcfSFPSfLCSF
GgVgQrlpphBGrlVGgTtsRHRWVRMzRdVsqdnDnV
MMTcbpnfNGQbMjgsRwSzRptRzz
lPqCCqQdQqQmCPRzRVSwtzgqqwqR
lrDdllPdBWdDFQFnMbDNDn
FldWTldlpBSLzvpnpSTpWbDhbHNDPHhJcNHNDwbH
qVCGQRGrrgMQrJhPNchgvgJhNc
frjGfMrGQMjsRrRQjvQGmrQQszTTpSLBznlzBlLLSBLLSZTn
TPZZZMTTbNTZNtTlTbjPVRVGzpGQLLzdGgmslhzSzgLzQh
wrfwDDvcnFvCfrrSQsmzGGQQdndsGg
qfHwHCqCqCrFJrcBHCCJRmWTRTmVMttjRjRHZMNV
vpbqnzbPmWLFjFLBnjZg
NltQcCClQlcGQGtMTCRdGTGBFZRLZjFFZZhBPLrFHZFjHf
lMtlGMwMsCCNlTwtsCPzzmPmmVpmpWqVWsWz
VmWVSchSrScGtwlVtBnwBVFF
RZZPRNpPCLZvZPZNCLbQPZNBFtttmwBMTMTtttCwtgwBgl
RNNmPvbQQjPRQQNNHpNbhsfzWJqqSJcsGHhHcfhq
dtJvcpccWvLDztRCRRCrCC
qHVslPzPqHqzmPhTzmDFggjrHrSCNFFFSjgR
qPVPMhszZPVhwBZcdpvZJncbcJ
HBNLlBDtvLDHhHLvfwlFjqfQTFqqWfST
ddsGcggJncZVRdGCdZdcWWzSFrjzQFrfTzqfCjFw
VdgscZmbZNBvbDHTbL
GtSZQqpHpHfGHzzqHzHfSbPbnJCrRCnJChmjnJnbSh
DvcTNTDWlNDWdlbnnbjmRhRrCCRd
cclNlwBRvvTNccRlBNRspVLLZzVzVZQqfqqLpzpw
dBSfHdZvMQMdNVpWRmWmLCmmtB
rbTTrrjDcqcrrqrjjJGGclltPCWDmvtpmpPpvRDsCspsLC
vlhjThlqcjrnTvThndddHZngMnfwNQFNFM
tHqfszrgLsvgqtHrHtwVCGBRRjGSCwsCsmmV
MdFMclPmcDQFDlDdlZPmbVpCbFpCbBSCCRGCFpbV
mcDJdDQMcDTZQhhNNPldhhDtvHLgqtzgLvzTzWHWnWfvvz
sVdGlTMMVTGCdsTMHHWWnNBzNWpNWCpW
mPmjFhlwmwmWrpSrSWHB
jhPhjwgthtFFjRwjZgjGdJcdflfqMsZLLsdZdc
CBRsTsBBzLCfLqtqBRPNDQglSttlcgDlgGGt
rJdbrJjrdbVJZdVZCGrNNcgDQlcQrggl
FpFbbppjFCdwmTvsvfzmTnTBfq
cqhcWqqCNjGWqcqhGGZzngftmptLZLGZTn
brJHBbPVHPvSsdHrzQLzZgpfVzpfQtnL
dHFPBPrBJFRzcWNFhWwN
QTBTfQTZsjWDJBJd
FgFWNqWGDPqlPllp
CCvHzSWFrrtvNvNNHLGQQfbVRRfHZcZcVTTTnZ
ZCCHHCVRZzBZQThM
nljDtcqnhcfbwjwltfLQMLLQQppJBMLQJL
qDsqschsqblDqjcqtRmNVVdNsddNNPmFgV
QQRnqGBSpQnMmSGmRQQFtdcbbtHHccjpTFcTfF
wCNPNwNNWNgZHJHJFffqCjbj
ZNPzNWgNrsmzMVqsqs
pVWlMBWjlWWqspWDjdjMpMDCPtmmdbhtQtQtbGPCzChchz
HZNgrHSvHwnFZnvgNvnwLPBGQHmCmtPmtBCGGCmQhG
FrNfvSNSZLZJrJsVlRWWWqRBVTff
PQctSHQDPSQcbShpFzbmFddpmdmR
wqWVwvwNCJRhmdhwJw
nMnWggVqRVZqHBSBsQsQGDSZ
qppwrgZSLsVbbfvZ
hhBHPQQChCDcPcsvvhbGbsllJTfv
MDWmWFCPFWtgpRWjws
bmRjdmrJRjhJdJLZBjTFfHGTtQFTSQBS
wCNVnsspwsnvNDwnsDwSBHtDHHQGTFQFtMrQMS
nWsNvqVgVcqdJrchrz
MZlfqlmblmMRWhWNsjSQfh
CznczgtDFnVtFBNSRNttvhQsNh
SGDFzVrzVPrGHVnzCPVnlZlPwTbpTqlbqLMpbLlq
lbbbGDlwLDLjvDvm
FQfQnLTWVcPChtjmjWSj
cfgzzgfgfVdzTdfNwBpbLbwdRbpZGrdw
mwnWtbmdWdccwtgTmwnQfPqsqLQQJQQLsfQQ
SjrZbhvBZzPHQqfGJfjG
FlrMBSvMZZFBZhShMMdctWDtmFNDbDTmtmpt
ndHWprpqFTnnpdNFlhljzlGTwDGzlhGz
fvZmmVVfJctMZsgMgmcBmsZhwQlGDCzPPZWDGDjCllhC
WsmvmsmRNnpRHdbS
LgZSvhvcsWtcWnjrFrWjjjnPWW
DJDfNlDNRFlpMlFLFP
TmqTqDHdmfwJRwfdQJLHzzSggHZZcGzhtZvcZhzG
lbTpqhhgSlgtlTqSDzzLPPPrLGTTGnLm
VwGfQGBGZWNnmDLPznLB
vQdfZFWvFMMFwWGGhpGqJbpFtgbS
hSvCvFRDwmzCCHrszb
jdMgfTblgjJTLLLzqqGscmPmlqPzHc
bjQLTTbZMfJffZBBWdjBBQwVDntFpRvvDVvSnhppFv
FFnFQndPqzmjHscmJFwc
ZrZrRgDphGGDZgRRBSBNMHHvmwJJSNJHcv
DGrbbthfWWWDgtfffttfpGPVqnmblqPqCdQTlTPCzTll
sHTsGrHpsftmddRRZfRv
MqFcqcMQbMcVPCdFZCzZsRsFzL
qnVlBbcJJbbMcbgQJMMbQlDWWwHWSWwpTsGHGrpDWG
qpmvVVcGvVVcVmDsCfqTHLLJzTjfZzLZ
rSSgwwnSRRBrQrZzZHCQrZ
BFgFRgdNnSBbbnhSMBSNFdsWVtpWmzsGtvpVPvGWVDDN
fBBRfJBzzMRGRzCBgWtbCWtbgHHHWdqt
mvNcDcsDLLnnqfbv
hpTsTsTrDrfpMSFFZjPFMrSP
CNQGGDMFWGnWWvvNMQFPvrgzBLVBLszwgggLgw
mppZVZtZRTbTTpRccVbgrSLzSPSzBrfbPBbSPw
VtZJhRJcTpJTHlhtHZCFFWFjNjGGnFhCqDqG
cppcZGcGgGpdTgSSnmpFMFrFzmwqwmrHwz
RStQJNCNvfBQNjrqmrjFrBMzFB
LJDNNJCDLcdLnSVd
gNrBNSrNNtSjBndzmzlVnm
MbfqfpCLpCsLqsLFSbQLfnMdcdRRcdzldlnljzncnJ
QPQLqZqhSqhvtvTTWrNg
DtrrcGvtLnrrvLrfctfHztrfQpbwwphpdSbbPPPwFSFFRPwH
gggBqTNdTNjqWBlNmCqCmNggQPhpPPPbhhQpSBpJwbSJSQFR
ZglTmgWNgVZMZdsGMcvDcMdMnz
bjtTFsPmmtpvVlQHlQJQnJjn
WzDzwLCSLrrDNLdrSZRCwNzrlQlJMnJQJJVhbcMhgllwnJQh
fRCZzrWRzzGbGvTmBPTf
lVlfJVblPQbllflfLdJdvGpjnFRFqJFnDqpJjnpF
HcwZMgmwWCHHCSwcWCcgSCtCqqpFppGDqvDnRhgnnqFDpjFT
cwCHtGrCssWHCCWZZMbPPNBVbNfVbPllVszf
DSpSnRwrZDPWsJdZ
zjjlQVjlNZmCVCfhCfgFFfFFFqWJbgbFWHJH
lNQMlGjQBZjCmhNMCChGzlVNrpTnccLLwcRwTSppSpprLRcB
vLfvcgglbfLfgqdgNpPtzqDmPzmJTTztPCHT
ZWSQVGwQcWjSshGwVcnSzDJZtPPTzmzzJHCTzDtJ
SjVSrWVhQVQhwrLMcrFbfplcflvv
NgtfSRPnnRrSlgsPhnShDWQlMWpVBMMMpCWVBpCQBB
LLJnvwJvZHZbHTbVCQBppCFJCWWQBz
wHTGZmZvdvLvjLwZdqngNgsGtrDPSDhtNfDf
DwrDRlrwmbSbRgwsSbRwGJvQGqjJqGNTJTNGTSGn
PZdMZzCQFBZWWFQvJZvcNcjqNjjZJG
WHWCFHBBdzzMWhPFtFdMzlRsVbVmDrRVVrtQplwVwD
bpWbJMWpJbprfNMrBfJfprWhPnGtnHnLHjPPjLvsWnHGvGvj
qZdgVVgDQhQZlwcqgDcchldjjmLtntmntPQsmLnLPjssnL
RVRlgcSSdglZczdqbTCrhBrBpNBSBSbF
SgbGvfbnGgmnNnnzqMqqHHRzbZBzZR
TWlssdFwWdtswWPtTtWltwdVHlZZzRHZBZRzrprqHMpqgZrq
dssdCWTFwSvgmDjDCG
pqsDnNzzZsdZSnDSpwjBCBWvgjvWjNFWQgWC
lVGtRtLMGGfbTGTtTbQCQnBQBnBFgFQcgjfc
GPbTbPtnPttmLTGRRbtmdwSDwpwwhZqmdpzDhDJd
MdccRQMJvHdgZggvhjjMgHcHlWWqFFWmGqFbJWzzFLWlLmPm
TDpSsTrtblSzQlGQ
tfVNrwTwtswTssMRjMMQQddNMRCd
GqGqGpFqqgDGFRqDwwqqmzpGTLPvVWMPVCPLJLRJJMLTlCWV
rHrSbrsbQcbtdNHHHfdPlvWBLLWlvMTVlVLCJf
rccbtthHSHsNHrrcttwqpnDFnMmpnzFnFhnF
vQQQbRvlLjNNLLBzNllNHNBqGqhMWhGGhTqmPmqhWTFhRm
tnsZwgSnCDrZSCDsfTMSGpPWmPSWmGmbFq
CrVnfnCCtrCgfrffcrstDnJNlvJdNvzdBcHdLBJHvbBv
nmQsMqTnLlmmpQZmTZcdHwCFSpHJSSWHSJVSWSHH
vRgRRtfPvDjzDgDbsjzRvjfNNWWCSJFwrHCFbrCJWJHCSC
GhsRBztDBgzRPstgzBLZcqmlcLMMlmdLQBZT
CWfvvhfWrlllSSRrdQrQDQGQdTRr
jsNctMZLmMZLMmmmbbNZswZNqBTHPHzBMHHTMGqBRMRPDQqP
jcwjntLngngplgFhgRvJVp
vchzqzwlhzRqzVZQwqtVPZLnLLbDnDFnbGLnDbPLDGWD
pBTHpdpHsrNBBsgdrdCpCpCgRFCMFDLFWWnFWLRRGWbDFGSF
prsBHfggjpjjcRQlqvtw
VDwzLQrDDWrrwWbJrVJwVrVQfMfSCNPMfSlMlPcMmThChf
tsjFdsRsgtRmGZHpHRgBClSlGSClcPhGCfPlllll
qBBFBZZpmgdFHdstjFJbzVwJVqJWWbrvWJDL
mgjZmrqmdsmGtDplglJgRVVc
nPhnLvnHLtLnWzzcNwwcchVJRflhpc
SnnLntLWZsMqZrSZ
jcrNfnrNLNNqFgbDfCSgSQbS
zPPHtMrGGptvTWPVvzvHRgQsbDsSRRCCQbtJsJDS
wHzrWVzPwThGGwMHzTGGPGwhdlZnBndZLljNjBcLdZdNBN
qNPhNqddBNhqvPhFvllNgNBHCrrCQnjpCfPVJnnJQJCjJj
ZZbZTZcmGWWMDWRSDnBVQCjVDffJjnnVCJ
SGBRTTZGGcLSSWTScsmcMbGlhgwFqslhzqggghwhNvwwvw
GCCPwpsBqNSsBPpSCrSshzQzLhTvQhqTnhtTVQcT
JDjFJfMJgWbWWlDJcnvvhvtdLnjnzhjz
FlDflbZfZgJgMgbmgZJfSpGCvvrGrRCpCBrZRprw
HwqhgFGSMgPPCGQQQnvvcpjn
BllbdfRBsBmsmZlBTmQCjTnNWNCmNmvc
lJDlBflDdbbRlLbfsbZBJtbRqrVFPnwwwhVMHwVrgJwwrSwH
LTvLtTFLCddFTTthsbVVmHHcqVHmWRcmHL
lBgwwNggwMwNVbjBCQcCqCRB
nCMCwZGGNGJnGhtrzsdDDndtsF
ZlZdJJplLZBDpJjNJlGjQCLmCQmTwVVCbQQbqWCT
SfgFzftrnRzMnVbPPPQmPq
FfmrRvgShchvFfghzRvgtvFBpJDpcGNGdBHJlpDDDJlDJZ
LdNrLzjdWQnrDHsD
tBZmBZtVZpldVMPRnsRQsnnsHVbRHs
MlfldwMBBFMZTSFTSqLqcvSJ
nJqBlvvBjHhBcqqRrGPrTrGpBCGzTG
MfVCVMLZVZtQCdtLMtQtQSSSTSzFRSRPFpFRGpdTFd
CCQQtQVgfbbQNggsNfQZZbHbcWmnhlhnvlnlHjJWvnhv
SGmmGwVwnmhbhnhwhhwbdMgNNgjmvMDrJTCgmBTBBj
ztFWcWQQfcRzzRFllvjDjggjDDfBgJMBgC
QtzcJtFtqcFQRRWRRQWFzFGpVnVSGLLGZVGVqddbLqGL
tBmdmQtjMMqDLqBtttQMjDdwwgwccMMbffllgzncwfFflF
TPVHTVsRsJVHVrVvHvrRhVJbfCgFbzwbCGgFlwgcCwbn
hssVWnRrTVZSSZZqjLddWtLBddqtQL
WhhtGZtZGQZmvCfCwtvhqgbfdDJdfjlSDlSlBBJDSg
rHnpFHnDrdBggJngnL
HVcTzFPNzTpPPVrzmtwtvvvmNQwDQvWw
dStBwStGGBrNnBdrSSMzvjhgFcvvDcnnvPDn
RLZbCWWJbHRsTHspZWLcDWcPPhzczfjgPjjvjz
ZmLHJqJsLJJHLRsmmmGSztQdQzmNBrBN
JrmRVdvcmvvmvvRTdBVVfjFQLwjqLFLWFMqwcFjz
DDhhttDHHHbHSnsDbHqMqzwQLLFwLsjjLLQf
bSbPthtgGQPNPHnSDChCRJZZJRCZdCrCBZZZZvJd
rqvVqNJpVVNwnqqTwthMMq
jsFRFDQRLQDQmsPRmQsmcQFMzGhwBGBhTzTTzHnRhnhBhRwz
dCccQcQsFCmCQfbJbvZMNZfJrJll
TGjrrTRLHvrQrFDCrmzzVm
NwWqqhndWtzDQhCzVCsh
CSSwNNwqgBBBBbGGvLTTvb
fRBRBHCVRRzcCdZHvRvZVCZLNjtwtNwNTtLjNtTpTNttfS
DZshMssZmTMjwjSLtw
QPrJDDJsPDFmFrFDscHHRzrcvccCZRVzrR
zgqzLLvlvdgpgrWpWW
RnJmNRncnScFmZSScrJQQdbpGdHbWHtPHpBHsdFdsW
JDfRcrSnmDSJcNfrNZNjvlwjhllhMzlDqMqMvh
fDLzSMLhhtDWMvtjCRRZjCHHJjChHN
pmTNpVwPNbPwPBFRqRJqjCnFjZFV
dTwpddsTbgbQBssprsgtvgcNLzWMctfSgcfWLt
fbBsBTsNDhGBGZcLLLJJQffQLQ
MpsCCMHClsHQqZcQWLqR
FtjdCFzVljFlslVCpFrFjPhggBGDgNSTTgbGNmbGTr
HqTfmsCFmPlGHddNVGpLhz
JjjcQQJgjZvZZzzwgpNVGwLGgV
nQnSbDDRbSQJQQpRZtZcZZsPPrFfWCPFWlrFsFPqmqFt
TgTDDrCmqJDGLrhqLmLGqDQRFtttjMbQZJjtdtjFdsdF
WHffcHWnlvvcSSWzPVvHpWWVRbFdQQtQnjwZFMwZtwddsZbd
cBpPplVVPfvVGBDLGCBqmmLM
dlMMmnmjvCCjJrrvMdgHcbcFbqFbzQrFbGzb
tPhRBRZPtZRshTzRsNShRZNGDfGgFFbFQqbGHDHbqfGD
TSPhBVsTwRBTpVtRZpVhZLJjWzLjJlJlJvmwWWzwWn
WcvLLgLcczLTDtccbLcgzMMfPsGwRPjwfMwHMfMvMp
QVmlPQCdJlJJJlFJJJnPQQhlwwMMMnMwNMpwMGwwfswwGMsR
lrSCZZVFhPSZgzgWttWBcc
bwbbZLlbwlJhBzFCgtTGRGQldQRmQW
SSnpHnPHqpmggCWgdT
PPscHHTfcsPSDVfVssjvwFJLBJFjFJJZFJLNLwrL
nLgDSHgwRgGnHjjNfTRhjPVpWV
BstQsvhQZQQbMvCvMPVNWpPcTjfmPmmW
brtCrtvtzrhdSDJDwh
dTQTwgmZQbDzzMQCCl
WLLtntFnfnRHbttnSRRzSMVGDDMGzVlV
JsPhFtfbLWnsLPLqgdJcjmcwTwjcdw
wMwMbMRRBBMLPBlhLRQlhPcWzgJNvJtzWNtJptpgjJgpBj
TnmGGmVnFFNSZsnZqFsWzWjrTJzvzWvWgWtTWz
qnHGnVSsqZCddnGCGCSNdDbLQPcLLQlDhPRMhb
NGsBTBlqsvfQBQqsTLTFltRMmRwmmHmFtPSRhM
gjZWJWCZdDpjggDdgnpWdZZJtFwFRFFRMwbbmRPtShnwRbtt
zZpSDDgpzcDddjVWggJsQGrfQvrQcTGTGrTrqr
hpJchhFWMpRDWHWcDGnCGrnGnwPTwpQnCt
bmgddgmlmjjbfddgmmmNvGQLrtfTwrTtLtGTLQVQQP
qqbmdZgzZbvgPDccHcZPhWWH
VVrdQZZrZSZFgQTTTzggrVZVMlfBBfvcMBCBslMhBvsMBSff
bQwnHwbNpwcsCwjMBw
pHqqPnJHqpPNJFzqTzQWWDQQZq
HgwTDfgBwBgcRHqRRjHqHTzQQClSzvlzPVSQLvbbPC
MnhtNZNnJpWpGhMQbCCPVSPLNmSPQQ
rrhJMFJJZFJpHcjRLFRfHjgj
vGvGMBlttBltvjdgbPsrsDWdjPPP
HnJQHVqNmQHmZsDZPPrDWpgFps
JSqJQVVDqqVfJNfRffGSGMBwGTCCCTlBMSBl
PsFZPfGbDNbtQmCCmCBBbmmL
dcRdhSrCqjThTRcTpLzHQzTmpmlgBz
hhhcqCvwhhVhfPNvsMstZtsZ
VvGwBBwvZtGgfZCqShnFFjSstCMC
NlTRdvpDdTRNzdTHHnMssCnCnCqjSz
LvWvPcWLpGwBwVVgVc
bVVmSrLmLSJzTZMSFTBdMj
QnvqRGGDvWpQWGDpvsRZLBzTRjBTtjRTPtBF
QWGvDpqcvpGWQpGngqGQGwpLhJVNJcrbfrVbfbhHrmlVJHVV
NGRGPZWZpblGcJtfssSSsbffCs
gwRhjvrgjmwgnzvJJJtVCtHJqs
rrmLrhwFFmmTMgFRjNZWNpZlZLppQNcDWP
qsHZsHZrTBtZrHBNFCJGWrMcpcddWGJWLG
mRDDzbPVDVlVDgbgRRvmwCcWdGvJwGddpvLm
PnfDbPbVzDbVfjnnlbzhVFsspBSfFsssHQNTBpFqNQ
gCmtbDqPVVVqggCGqTJjHMpMQfgMpMHQQpcM
zNZnsSLzZzrlRhTTJMHppjfHSpvp
nhdrBsLlRRrdTlsTVmCmGqDVFdtDPGwV
FnqNfdGfgzmPLGmj
blvVvbsRwgnzjCPcbT
RWWvtvphnZQZwMBNdHfNDBZZdq
DMRhDhdvnjhnPnvPMfdZSGTccGJFjGFFpFpFTbTpTW
NVgVmtzVlLBmgztsBNmtgCmqFpJJFGGpGbrcGGsrcpbWPr
zwBztLBzllQPDZvfQZfRfHSR
mFCgPzmqgtPPqMmFWzbMttcRGvRclvHhWGGcZvclRfHh
psSNnhnLGnwZHZGv
hBpNLTNLBhsPmbCgBtPDbM
JsbLLWLJRfQFnccmQhtvvPCP
dwgrVwGpgVhCrrhPDHtC
gpGSjpVdVpVppjjVZBwdCbFRWLzLMSRMbNzfzbWR
DmMQMJmnmGwzGwwG
ZcLcgLgcRsZSctHFWLGfjjBwvbvBsvjpfhGb
GgFPqFtLRHLFSHLRRFRHHtMnJVNCQCrJCJCnMJDdnqDV
tqdqFqdsRdVdtHMNdRZHTZLrHJgrlZQPJLgr
GGwVcpGznmhbWhwcVVgzTrDrDDLZlTLLZQrJ
nhbnbfjcnfMfFNVtBq
QHmPNZvfCLsSwJSm
pDhjpVDFcRBpFFjjMnRcVhpFCzbzsZbSSCtwtLMSLZLLtLbs
FRjrnRchnfHPrrZlHl
bjjMbdChgRDZthpQpRQnwRTprRwS
mGzJsGsHzHGPvvvqvzGzSnglSJrrwQgnlQQSrlQl
qvzHqHLHmHgPsNBdCdZtVBtVVMBFbh
CctrCwrdpTwcpVrdpTpcrcnSJQttvQPHJQNQnQNjvvHQ
zsqRlslRLqfgRmWsRgRzqzQnHjSBSQWJHPhHnSvHnJJJ
GRgllbgfRgbzfRmwwcGdFMcTVPrFCF
"""
}
