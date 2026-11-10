# Diagramas UML

Os diagramas seguem a UML 2.5.1 (OMG, 2017) e são escritos como texto em PlantUML (`fontes/`). As imagens em `imagens/` são geradas a partir dessas fontes.

## Como regenerar as imagens

Requisitos: Java 17 ou superior, [PlantUML](https://github.com/plantuml/plantuml/releases) (versão usada: 1.2024.7) e [Graphviz](https://graphviz.org/download/) (versão usada: 12.2.1).

```bash
cd artefactos/uml/fontes
java -DPLANTUML_LIMIT_SIZE=16384 -jar plantuml.jar -charset UTF-8 -tpng *.puml
mv *.png ../imagens/
```

Se o Graphviz não estiver no `PATH`, indicar o executável com a variável de ambiente `GRAPHVIZ_DOT` (por exemplo, `GRAPHVIZ_DOT="C:/Program Files/Graphviz/bin/dot.exe"`).

O ficheiro `skin.iuml` define o estilo comum (tipo de letra, cores e resolução de 200 ppp) e é incluído por todos os diagramas.
