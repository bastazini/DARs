##Pacotes
require(SYNCSA)
require(vegan)

##Importando os dados
comm=read.table(pipe("pbpaste"), sep="\t", header=T, row.names=1);comm
comm=t(comm)
traits=read.table(pipe("pbpaste"), sep="\t", header=T, row.names=1);traits
traits=decostand(traits, "standardize")

ncomm <- nrow(comm)
ncomm

## Separar cada linha (comunidade) em um objeto da lista
comm.list <- sapply(as.list(seq_len(ncomm)), function(x) comm[x, , drop = FALSE], simplify = FALSE)
comm.list

# Montar uma matriz de atributos para cada comunidade
traits.list <- sapply(as.list(seq_len(ncomm)), function(x) organize.syncsa(comm.list[[x]], 
                                                                           traits = traits, 
                                                                           
                                                                           check.comm = TRUE)$traits, simplify = FALSE)
##transformar uma das comunidades da lista em um matriz de trits
traits1=as.matrix(traits.list[[47]]);traits1
teste=quality_funct_space (traits1, nbdim=8, metric="Euclidean", plot="quality_funct_space")
#teste
teste$meanSD


t_UPGMA=c(1.692032,0.164992,0.236374,2.522750,2.177807,1.217202,0.518307,1.230683,0.285261,
          1.787787,1.030731,1.484955,1.101736,1.118106,0.367537,0.177950,0.986302,2.023617,
          1.261904,1.525246,0.702121,0.313833,1.663360,1.570120,2.821682,1.434175,0.704048,
          1.879309,1.327645,0.115830,0.772852,0.900989,2.388211,0.631931,1.397906,3.490375,
          2.117523,0.999126,1.245736,1.17918,1.254729,1.814528,0.827279,0.841603,0.608120,
          0.503343)
hist(t_UPGMA)

     