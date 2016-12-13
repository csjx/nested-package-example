#!/bin/bash

token="<token>";
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
# for file in $(find . -name "*1.rdf" -print); do
#     newPid=$(basename ${file});
#     dir=$(dirname ${file});
#     pid=${newPid%.1.rdf}.rdf;
#     sysmeta="${dir}/${newPid%.rdf}.rdf.sysmeta.xml";
#     echo "object: ${file}";
#     echo "sysmeta: ${sysmeta}";
#     echo "pid: ${pid}";
#     echo "newPid: ${newPid}";
#     
#     curl -v \
#         -X PUT \
#         -H "Authorization: Bearer ${token}" \
#         -F "pid=${pid}" \
#         -F "newPid=${newPid}" \
#         -F "sysmeta=@${sysmeta}" \
#         -F "object=@${file}" \
#         ${mn_url}/object/${pid}
#     echo "------------";
# done

# Update the resource maps 
# Revise to version .2 to add cito:documents/cito:isDocumentedBy for nested resource maps (indexing bug)
# for file in $(find . -name "*2.rdf" -print); do
#     
#     newPid=$(basename ${file});
#     dir=$(dirname ${file});
#     pid=${newPid%.2.rdf}.1.rdf;
#     sysmeta="${dir}/${newPid%.rdf}.rdf.sysmeta.xml";
#     skip=(A.0.rdf B.1.rdf B.2.rdf C.1.rdf C.2.rdf);
#     case "${skip[@]}" in *"${pid}"*) 
#         echo "Skipping ${pid}";
#         echo "-----------";
#         continue ;;
#     esac
#     echo "object: ${file}";
#     echo "sysmeta: ${sysmeta}";
#     echo "pid: ${pid}";
#     echo "newPid: ${newPid}";
#     
#     curl -k -v \
#         -X PUT \
#         -H "Authorization: Bearer ${token}" \
#         -F "pid=${pid}" \
#         -F "newPid=${newPid}" \
#         -F "sysmeta=@${sysmeta}" \
#         -F "object=@${file}" \
#         ${mn_url}/object/${pid}
#     echo "------------";
# done

# That didn't work.  Update the resource maps to state the EML cito:documents the nested reource maps
# for file in $(find . -name "*.rdf" -print); do
#     
#     basePid=$(basename ${file});
#     newPid=${basePid%.rdf}.3.rdf;
#     dir=$(dirname ${file});
#     pid=${basePid%.rdf}.2.rdf;
#     sysmeta="${dir}/${basePid%.rdf}.rdf.sysmeta.xml";
#     # skip=(A.0.rdf B.1.rdf B.2.rdf C.1.rdf C.2.rdf);
#     # case "${skip[@]}" in *"${pid}"*) 
#     #     echo "Skipping ${pid}";
#     #     echo "-----------";
#     #     continue ;;
#     # esac
#     echo "object: ${file}";
#     echo "sysmeta: ${sysmeta}";
#     echo "pid: ${pid}";
#     echo "newPid: ${newPid}";
#     
#     curl -k -v \
#         -X PUT \
#         -H "Authorization: Bearer ${token}" \
#         -F "pid=${pid}" \
#         -F "newPid=${newPid}" \
#         -F "sysmeta=@${sysmeta}" \
#         -F "object=@${file}" \
#         ${mn_url}/object/${pid}
#     echo "------------";
# done

# Fix more errors in the resource maps
# cjones@ridgway:nested-package-test$ find A.0/ -name "*rdf" -exec wc -c {} \;
# 4340 A.0/A.0.rdf
# 3633 A.0/B.1/B.1.rdf
# 2891 A.0/B.1/C.1/C.1.rdf
# 3633 A.0/B.2/B.2.rdf
# 2891 A.0/B.2/C.2/C.2.rdf
# cjones@ridgway:nested-package-test$ find A.0 -name "*rdf" -exec shasum -a 256 {} \;
# 119d694ebe30ca230ca99893b4fe371a914276d589b4f53b998104220bfe18c9  A.0/A.0.rdf
# ee997c41b81a876ea1f4298dca7d9ab78fbcc1a47cdbf2323043a6959043cb8c  A.0/B.1/B.1.rdf
# 4e7e441a8ee51e6048aed04875d17dbf663b0140346aeb06411daf1d5453c4da  A.0/B.1/C.1/C.1.rdf
# 28ad6ca3d5003e8ca4fe1c60ef35c4d45cf55756c12cb0dead98619365a75013  A.0/B.2/B.2.rdf
# fa6038c721cff6ed284c0a13e5b3df1e06a35c7288c576e580b063791b0cfa20  A.0/B.2/C.2/C.2.rdf
for file in $(find . -name "*.rdf" -print); do
    
    basePid=$(basename ${file});
    newPid=${basePid%.rdf}.4.rdf;
    dir=$(dirname ${file});
    pid=${basePid%.rdf}.3.rdf;
    sysmeta="${dir}/${basePid%.rdf}.rdf.sysmeta.xml";
    # skip=(A.0.rdf B.1.rdf B.2.rdf C.1.rdf C.2.rdf);
    # case "${skip[@]}" in *"${pid}"*) 
    #     echo "Skipping ${pid}";
    #     echo "-----------";
    #     continue ;;
    # esac
    echo "object: ${file}";
    echo "sysmeta: ${sysmeta}";
    echo "pid: ${pid}";
    echo "newPid: ${newPid}";
    
    curl -k -v \
        -X PUT \
        -H "Authorization: Bearer ${token}" \
        -F "pid=${pid}" \
        -F "newPid=${newPid}" \
        -F "sysmeta=@${sysmeta}" \
        -F "object=@${file}" \
        ${mn_url}/object/${pid}
    echo "------------";
done

