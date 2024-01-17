---
layout: page
title: Achitecture overiew
permalink: /arichtecture/
---

@startuml
left to right direction
actor User as u
actor Admin as a
actor "System" as o
package VectorSearchEngine {
    usecase "Search in Collection" as s
    usecase "Create Collection" as c1
    usecase "Edit Collection" as c2
    usecase "Delete Collection" as c3
    usecase "Ingest Vectors" as d1
    usecase "Delete Vectors" as d2
}
u --> s
a --> c1
a --> c2
a --> c3
o --> d1
o --> d2

@enduml

