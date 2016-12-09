#!/bin/bash

token="eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJodHRwOlwvXC9vcmNpZC5vcmdcLzAwMDAtMDAwMi04MTIxLTIzNDEiLCJmdWxsTmFtZSI6IkNocmlzdG9waGVyIEpvbmVzIiwiaXNzdWVkQXQiOiIyMDE2LTEyLTA4VDE1OjIxOjA2LjE5NyswMDowMCIsImNvbnN1bWVyS2V5IjoidGhlY29uc3VtZXJrZXkiLCJleHAiOjE0ODEyNzUyNjYsInVzZXJJZCI6Imh0dHA6XC9cL29yY2lkLm9yZ1wvMDAwMC0wMDAyLTgxMjEtMjM0MSIsInR0bCI6NjQ4MDAsImlhdCI6MTQ4MTIxMDQ2Nn0.W4YOhmdcgl7JxxlUaSDh0MpV55vEH2Btp6lYu3B4HcPFQF-WRnG4Gi8vny5Hveu07XvNwP4_Wdoc7827vMBXRvez2A-2IHn3feMA14wH0eNcpS1dm3uE6cCdwt8D64G8_t7kK0skngsdyf9y6twjk7cIjIL2xZd08obajVd212zzmSDoxI0mS7jJykrcD-vOqJJgUIUG8TKLjAvkMTyRFNYBawXGre3vPhz9wepaanLXu31NMIzd3WTBVm6mof8PTpj6HpdXORRsd-rswAQVnr8k9oxb-6Bb9pSMVlnLCQvASMPw6nHyDTvUvCLT48XSrGnL7IJaPxtt85qazuPGKJTSVMxqtCzB4QIuwN1IfldAvMj-tj53kFNuINJ9dYBVH7ktgv5smaop835qeRy2TAqf4xMhVNip-s_G79qduh4xu_Td4gzF8FqbcKHjzYsO01fWxBzwlncS9dTxRt1uSMD8rj_emK2zOuxt0Ihe100aqsT_gqeo9NHaKEpCmabaVISX_QIlQ-SYh8zjbI1P5gl6v4XCkq18UowwHrhkX9sTpaLr27SHpIWqXVaFSH_B9Dvd6-Uyk7f51q6Ss33EF1k7bjlpfEfkTUUbFbr7WoeAJ3VRdxH4maz0bP4II6C_PLkm0EA0f2x7LfWFJbR2t3XIH4PPcWFaT19D4sVQwcI";

mn_url="https://dev.christopherjones.co/metacat/d1/mn/v2";
data_dir="/Users/cjones/d1-test/arctic/nested-package-test";

cd ${data_dir};

# Upload the data
# for file in $(find . -name "*data.txt" -print); do
#     echo ${file};
#     pid=$(basename ${file});
#     dir=$(dirname ${file});
#     sysmeta="${dir}/${pid%.txt}.sysmeta.xml" \
# 
#     curl -v \
#         -X POST \
#         -H "Authorization: Bearer ${token}" \
#         -F "pid=${pid}" \
#         -F "sysmeta=@${sysmeta}" \
#         -F "object=@${file}" \
#         ${mn_url}/object
# done

# Upload the metadata
# for file in $(find . -name "*eml.xml" -print); do
#     pid=$(basename ${file});
#     dir=$(dirname ${file});
#     sysmeta="${dir}/${pid%.eml.xml}.eml.sysmeta.xml";
#     echo "object: ${file}";
#     echo "sysmeta: ${sysmeta}";
#     echo "pid: ${pid}";
#     
#     curl -s \
#         -X POST \
#         -H "Authorization: Bearer ${token}" \
#         -F "pid=${pid}" \
#         -F "sysmeta=@${sysmeta}" \
#         -F "object=@${file}" \
#         ${mn_url}/object
#     echo "------------";
# done

# Upload the resource maps
# 3906 ./A.0/A.0.rdf
# 3409 ./A.0/B.1/B.1.rdf
# 2878 ./A.0/B.1/C.1/C.1.rdf
# 3409 ./A.0/B.2/B.2.rdf
# 2878 ./A.0/B.2/C.2/C.2.rdf

# 2f7231d6ed048e289bf70c60a67ec64ef35d54d347282af9fe00e7dd2b166dca  ./A.0/A.0.rdf
# 65a430f33ae4d00851a24462d8536ef6d32d1e0620de48e6a49a50e88401f130  ./A.0/B.1/B.1.rdf
# 9ac48550db5c0e236a56567511ba015a7dba572fa082d0bd2c5e90c7addf732a  ./A.0/B.1/C.1/C.1.rdf
# 2217840336169bf0885563e2c7f0b1accc4523e0a775ce3bbd6189941711afcf  ./A.0/B.2/B.2.rdf
# 715bbe69fde8446a95164597bf44c5f2875e75f021cca2a1e42a2cfbdf93f8d5  ./A.0/B.2/C.2/C.2.rdf

# for file in $(find . -name "*rdf" -print); do
#     pid=$(basename ${file});
#     dir=$(dirname ${file});
#     sysmeta="${dir}/${pid%.rdf}.rdf.sysmeta.xml";
#     echo "object: ${file}";
#     echo "sysmeta: ${sysmeta}";
#     echo "pid: ${pid}";
#     
#     curl -s \
#         -X POST \
#         -H "Authorization: Bearer ${token}" \
#         -F "pid=${pid}" \
#         -F "sysmeta=@${sysmeta}" \
#         -F "object=@${file}" \
#         ${mn_url}/object
#     echo "------------";
# done

# Update the resource maps (typo in comment on line 11)
# 3935 ./A.0/A.0.1.rdf
# 3430 ./A.0/B.1/B.1.1.rdf
# 2891 ./A.0/B.1/C.1/C.1.1.rdf
# 3430 ./A.0/B.2/B.2.1.rdf
# 2891 ./A.0/B.2/C.2/C.2.1.rdf

# 3f9f234a3aa0289622a4a0106c599cfaf4983284c519716e59c651aaa9725e35  ./A.0/A.0.1.rdf
# 607fcc43cd6ea48c3cb4a9212c9a8e23f68d9e40fab3bf70ff5d68073c35cfa5  ./A.0/B.1/B.1.1.rdf
# ffe2b5663a35228af19eea1f9c0f7d2e65fede6c17cdf675a6ed8125250495ec  ./A.0/B.1/C.1/C.1.1.rdf
# 45f3a355cf6053eeabb3a3dce99944a64323452ed44b7e0f2ffb4e8c18921537  ./A.0/B.2/B.2.1.rdf
# 8a1cac2d1596d5a19ec773e4b6d9e30d0f1033b6beca2022e0cb08174ea9af60  ./A.0/B.2/C.2/C.2.1.rdf
for file in $(find . -name "*1.rdf" -print); do
    newPid=$(basename ${file});
    dir=$(dirname ${file});
    pid=${newPid%.1.rdf}.rdf;
    sysmeta="${dir}/${newPid%.rdf}.rdf.sysmeta.xml";
    echo "object: ${file}";
    echo "sysmeta: ${sysmeta}";
    echo "pid: ${pid}";
    echo "newPid: ${newPid}";
    
    curl -v \
        -X PUT \
        -H "Authorization: Bearer ${token}" \
        -F "pid=${pid}" \
        -F "newPid=${newPid}" \
        -F "sysmeta=@${sysmeta}" \
        -F "object=@${file}" \
        ${mn_url}/object/${pid}
    echo "------------";
done
