---
title: "Análisis genómico del SARS-CoV-2 a través de la frontera entre Estados Unidos y México"
authors: "SEARCH-Alliance"
authorLinks: "https://searchcovid.info/"
affilitations: "Scripps Research, Rady Children's Hospital, UC San Diego"
updated: "July 2020"
dataset: "https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder"
abstract: "Para obtener información sobre la emergencia, propagación y transmisión de COVID-19 en nuestra comunidad, SEARCH Alliance está trabajando con un gran número de colaboradores para secuenciar muestras de SARS-CoV-2 de pacientes infectados."
---

# [Resumen](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=region&d=tree&legend=open&onlyPanels&p=full&sidebar=closed)
Analizamos 4295 genomas disponibles al público de SARS-CoV-2 de todo el mundo, con un enfoque en los genomas de México y los estados fronterizos del sur de los Estados Unidos, para comprender la dinámica de la transmisión transfronteriza del virus. 621 de las secuencias fueron secuenciadas por SEARCH Alliance. Las muestras fueron recolectadas de individuos en el condado de San Diego (508), el condado de Imperial (74) y la ciudad de Tijuana, Baja California (39). En este informe, destacamos los resultados de las secuencias y algunas conclusiones elaboradas a partir de un análisis filodinámico basado en un método de máxima verosimilitud.
<br><br>
Obtenga la información más actualizada a través de nuestra [página de proyecto en el sitio web del Laboratorio Andersen](https://andersen-lab.com/secrets/data/hcov-19-genomics/).
<br><br>
**Tabla de contenido**:  
1. [Generación de datos](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31/es?n=2).
2. [Análisis de datos](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31/es?n=3).
3. [Brote de SARS-CoV-2 de Tijuana relacionado a linajes europeos y norteamericanos](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31/es?n=4).
4. [Evidencia de múltiples introducciones en Tijuana](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31/es?n=5).
5. [Las secuencias de Tijuana son más similares a las secuencias del Sur de California](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31/es?n=6).
6. [Crédito científico](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain/mexicoborder/2020-07-31/es?n=7).


# [Generación de datos](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=map&f_search=Baja%20California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas,Arizona&m=div&p=full&r=division&transmissions=hide&legend=open&onlyPanels&p=full&sidebar=closed)
Las secuencias preparadas por SEARCH Alliance fueron generadas usando un esquema de secuenciación basado en amplicones usando  [PrimalSeq](https://www.nature.com/articles/nprot.2017.066) y el esquema [ARTIC nCoV-2019](https://github.com/artic-network/artic-ncov2019/tree/master/primer_schemes/nCoV-2019).  
<br><br>
Los datos generados con Nanopore fueron procesados usando el pipeline [ARTIC-nCoV2019 pipeline](https://github.com/artic-network/artic-ncov2019) con [minimap2](https://github.com/lh3/minimap2) y [medaka](https://github.com/nanoporetech/medaka).  
<br><br>
Los datos generados con Illumina fueron procesados usando [iVar](https://github.com/andersen-lab/ivar) ([Grubaugh et al. Genome Biology 2019](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-018-1618-7)) con [bwa](https://github.com/lh3/bwa).  
<br><br>
Todas la secuencias de consenso han sido depositadas en la base de datos GISAID y en NCBI bajo el BioProject ID [PRJNA612578](https://www.ncbi.nlm.nih.gov/bioproject/612578). Los archivos de datos sin procesar generados con Illumina y Oxford Nanopore están disponibles en:  
* [Google Cloud](https://console.cloud.google.com/storage/browser/andersen-lab_hcov-19-genomics).  
* SRA bajo el BioProject ID: [PRJNA612578](https://www.ncbi.nlm.nih.gov/bioproject/612578).  


# [Análisis de datos](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=map&f_search=Baja%20California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas,Arizona&m=div&p=full&r=division&transmissions=hide&legend=open&onlyPanels&p=full&sidebar=closed)
El pipeline usado para generar esta estructura está basado en el [pipeline ncov](https://github.com/nextstrain/ncov) desarrollado por el laboratorio de Trevor Bedford.  
<br><br>
En resumen, se colectaron  secuencias y metadatos de nuestro repositorio y la base de datos de [GISAID](https://gisaid.org/). Los genomas que eran cortos, incompletos, demasiado divergentes, y/o que tenían metadatos incompletos fueron excluidos del conjunto de datos. Alineamos los genomas restantes con el genoma de referencia MN908947 y los sitios problemáticos del alineamiento no fueron considerados en el análisis según este [post](https://virological.org/t/issues-with-sars-cov-2-sequencing-data/473). El alineamiento fue submuestreado para dar contexto a las secuencias recogidas en Mexico y en los estados fronterizos (Arizona, California, Nuevo Mexico, y Texas) y para reducir la carga computacional del análisis. Luego, generamos una filogénia a partir del alineamiento con [IQ-TREE](http://www.iqtree.org/) y una filogénia resuelta en el tiempo usando [TreeTime](https://github.com/neherlab/treetime). Luego, algunos rasgos filogeográficos y sustituciones de nucleótidos fueron reconstruidos con [Augur](https://github.com/nextstrain/augur).


# [Brote de SARS-CoV-2 de Tijuana relacionado a linajes europeos y norteamericanos.](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?branchLabel=clade&d=tree&f_search=Baja%20California,Mexico&p=full&legend=closed&onlyPanels&sidebar=closed&c=search)
Las 39 secuencias generadas de Tijuana, indicadas en amarillo en el arbol filogenético a la derecha, son las primeras secuencias obtenidas de Baja California, y representan mas del doble de las secuencias disponibles de México actualmente (representadas en color naranja). Todas las muestras fueron colectadas de pacientes de Tijuana entre Marzo 25 y Abril 29, 2020. 
<br><br>
Todas estas secuencias recién generadas se agrupan dentro del clado 20A (usando el [esquema de nomenclatura de Nextstrain](https://virological.org/t/year-letter-genetic-clade-naming-for-sars-cov-2-on-nextstrain-org/498)), el cual es caracterizado por la sustitución Spike-D614G. Este clado se originó en Europa, pero se ha vuelto endémico en los Estados Unidos y Canadá.

*Nota: Las etiquetas de los clados Z1 y Z2 no son relevantes biológicamente y están incluidos sólo con propósitos de visualización.*


# [Evidencia de múltiples introducciones en Tijuana](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?branchLabel=clade&c=search&d=tree&f_search=Baja%20California&label=clade:Z2&m=div&onlyPanels&p=full&sidebar=closed)
Enfocándonos en el subclado dentro de 20A, el cual contiene la mayoría de las secuencias de Tijuana, podemos observar que las muestras de Tijuana están relativamente dispersas y no forman un grupo definido. Parecido a lo que hemos observado en [San Diego](https://nextstrain.org/community/narratives/andersen-lab/HCoV-19-Genomics-Nextstrain?n=4), el brote de Tijuana parece ser originado por múltiple introducciones separadas. La mayoría de estas introducciones provienen de politomias, en donde un nodo ancestral da origen a múltiples ramas y por lo tanto es difícil de identificar su origen preciso. 
<br><br>
Aunque sabemos que actualmente hay un brote de Covid19 activo en Baja California, de acuerdo a este análisis, es difícil determinar si este brote está siendo producido por reintroducciones provenientes de fuera del estado o por transmisión sostenida dentro del estado.  El número limitado de secuencias disponibles y el limitado intervalo de tiempo de colección de las mismas, no nos permite identificar con certeza el factor principal que causa el brote de Tijuana. Esperamos secuenciar más muestras de Baja California y de México en general para explorar estas observaciones más detenidamente.


# [Las secuencias de Tijuana son más similares a las secuencias del Sur de California](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=search&d=tree&f_search=Arizona,Baja%20California,California,Imperial,Mexico,New%20Mexico,San%20Diego,Texas&legend=open&label=clade:20A&p=full&onlyPanels&sidebar=closed)
En el arbol filogenético, ninguna de las secuencias de Tijuana (en color amarillo) se agrupan con las 28 secuencias disponibles de Mexico, las cuales provienen principalmente del centro del pais (en color naranja), sugieriendo que el brote en Tijuana es distinto al del resto de Mexico. De hecho, las secuencias de Tijuana se agrupan con las secuencias de los estados fronterizos de los Estados Unidos, específicamente con las secuencias del Sur de California (secuencias del condado de San Diego en azul, y las secuencias del condado Imperial en morado).  Basado en este análisis, y con los datos disponibles actualmente, es difícil determinar la magnitud de las transmisiones transfronterizas, así como la direccionalidad de las mismas. Sin embargo, es evidente el movimiento de SARS-CoV2 a través de la frontera México-Estados Unidos, dado que las secuencias de Tijuana y las del sur de California se agrupan en el mismo clado en el arból filogenético.


# [Credito científico](https://nextstrain.org/community/andersen-lab/HCoV-19-Genomics-Nextstrain/hCoV-19/mexicoborder?c=region&d=map&label=clade:Z1&legend=closed&onlyPanels&p=full&sidebar=closed)

Nuestro reconocimiento al trabajo eficiente y oportuno de todos nuestros colaboradores:
<br><br>
**Colaboradores en San Diego:**
<br><br>
**Laboratorio de Salud Pública del Condado de San Diego**<br>
Tracy Basler, Jovan Shephard, Brett Austin, Raymond Chinn, Nikos Gurfield, Eric McDonald
<br><br>
**Departamento de Salud Pública del condado de Imperial**<br>
Holly Maag, Stephen Munday, Paula Kriner
<br><br>
**Departamento de Salud Pública de California**<br>
Debra Wadford, Phacharee Arunleung, Kathleen Jacobson, Cindy Wong, Dominick Morales, John Bell, Sharon Messenger, Alice Chen
<br><br>
**UCSD – Centro de Medicina de laboratorio avanzada**<br>
Jenny Shin, David Pride
<br><br>
**UCSD – División de enfermedades infecciosas y de Salud Pública mundial**<br>
Sara Browne
<br><br>
**Rady Children Hospital, San Diego**<br>
Christina Clarke, Michelle Vanderpool, Teresa Mueller, Denise Malicki
<br><br>
**Scripps Health, San Diego**<br>
Michael Quigley, Ellen Stefanski, Ian McHardy
<br><br>
**Nueva Orleans**<br>
Allison Smither, Gilberto Sabino-Santos, Patricia Snarski, Lilia Melnik, Antoinette Bell, Kaylynn Genemaras, Arnaud Drouin, Dahlene Fusco, Robert Garry
<br><br>
**Louisiana**<br>
Jeremy Kamil, Vaughn Cooper
<br><br>
**Infectolab, Tijuana**<br>
Samuel Navarro Alvarez, Carlos A. Cota Haros, Octavio Renteria Pacheco
<br><br>
**Biolab, Jordania**<br>
Issa Abu-Dayyeh, Ahmad Tibi, Lama Hussein, Lina Mohammad, Zein Naber, Amid Abdelnour
<br><br>
**Colaboradores de análisis**
Marc Suchard, UCLA
<br>
Lauren Gardner, Johns Hopkins
<br>
Philippe Lemey, KU Leuven
<br>
Alexander Watts & Kamran Khan, BlueDot
<br>
Emma Hodcroft, Nextstrain
<br><br>
**Clausula de responsabilidad.** Tenga en cuenta que estos datos todavía se basan en un trabajo en progreso y deben considerarse preliminares. Si quiere incluir cualquiera de estos datos en publicaciones, por favor infórmenos; de lo contrario, puede descargarlos y usarlos sin restricciones. Hemos compartido estos datos con la esperanza de que la gente los descargue y los utilice, así como los examine para que podamos mejorar nuestros métodos y análisis. Por favor contáctenos si tiene alguna pregunta o comentario: ¡Compraremos cervezas para los #ResearchParasites que detecten errores y fallas en los datos y presentaremos mejoras!


---
**Andersen Lab**  
The Scripps Research Institute  
La Jolla, CA, USA  
[data@andersen-lab.com](mailto:data@andersen-lab.com).
