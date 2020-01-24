##Pacotes
require(SYNCSA)

##Importando os dados
comm=read.table(pipe("pbpaste"), sep="\t", header=T, row.names=1);comm
##Transpoe a matriz, linhas tem que ser os sitios e as colunas as espécies
comm=t(comm)
traits=read.table(pipe("pbpaste"), sep="\t", header=T, row.names=1);traits

ncomm <- nrow(comm)
ncomm

## Separar cada linha da matriz (i.e., comunidade) em um objeto da lista
comm.list <- sapply(as.list(seq_len(ncomm)), function(x) comm[x, , drop = FALSE], simplify = FALSE)
comm.list

# Montar uma matriz de atributos para cada comunidade
traits.list <- sapply(as.list(seq_len(ncomm)), function(x) organize.syncsa(comm.list[[x]], 
																		   traits = traits, 

																		   																		   check.comm = TRUE)$traits, simplify = FALSE)
##transformar uma das comunidades da lista em um matriz de traits
traits1=as.matrix(traits.list[[1]]);traits1
##ver as dimensões das matrizes dentro da lista
as.data.frame(lapply(traits.list, dim))
##Indexa dentro [] qual mancha será anlisada
traits1=as.matrix(traits.list[[1]]);traits1
quality_funct_space (traits1, nbdim=7, metric="Euclidean", plot="quality_funct_space")

