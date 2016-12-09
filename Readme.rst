Nested Package Example
======================

To test DataONE nested package indexing, I've created the following directory structure:
..code::

  A.0/
  ├── B.1
  │   └── C.1
  └── B.2
      └── C.2
      
Each directory represents a package, with A.0 being the root, and B* and C* being children and grandchildren.  Each has a TXT data file, EML metadata file, and an RDF resource map, along with their requisite system metadata documents:

..code::

  A.0/
  ├── A.0.1.rdf
  ├── A.0.1.rdf.sysmeta.xml
  ├── A.0.data.sysmeta.xml
  ├── A.0.data.txt
  ├── A.0.eml.sysmeta.xml
  ├── A.0.eml.xml
  ├── B.1
  │   ├── B.1.1.rdf
  │   ├── B.1.1.rdf.sysmeta.xml
  │   ├── B.1.data.sysmeta.xml
  │   ├── B.1.data.txt
  │   ├── B.1.eml.sysmeta.xml
  │   ├── B.1.eml.xml
  │   └── C.1
  │       ├── C.1.1.rdf
  │       ├── C.1.1.rdf.sysmeta.xml
  │       ├── C.1.data.sysmeta.xml
  │       ├── C.1.data.txt
  │       ├── C.1.eml.sysmeta.xml
  │       └── C.1.eml.xml
  └── B.2
      ├── B.2.1.rdf
      ├── B.2.1.rdf.sysmeta.xml
      ├── B.2.data.sysmeta.xml
      ├── B.2.data.txt
      ├── B.2.eml.sysmeta.xml
      ├── B.2.eml.xml
      └── C.2
          ├── C.2.1.rdf
          ├── C.2.1.rdf.sysmeta.xml
          ├── C.2.data.sysmeta.xml
          ├── C.2.data.txt
          ├── C.2.eml.sysmeta.xml
          └── C.2.eml.xml
    
The issue: why are B.1 and B.2 resource maps not indexed with an A.0 `resourceMap` Solr field? Same for C.1 and C.2 (no B.1 and B.2 resourceMap fileds).



