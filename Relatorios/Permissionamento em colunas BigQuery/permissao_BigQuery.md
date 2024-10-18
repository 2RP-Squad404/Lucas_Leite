# Permissionamento em Colunas no BigQuery
É possível criar tags de politica, as quais se aplicadas as colunas de uma tabela, as permissoes de visualização ou edição dos dados são limitadas a permissão da tag. 

Por exemplo, numa tabela que temos diversas colunas, todas com tags   
(name - tag"name", cpf - tag"sensivel", email - tag"pessoal", num_cartao - tag"Sensivel")  
Podemos exemplificar o permissionamento da seguinte forma:
* Tag **Name:** *Todos* podem visualizar,
* Tag **Sensível:** *Cientistas de dados* podem visualizar,
* Tag **Pessoal:** *Engenheiros e Cientistas* de dados podem visualizar.

No final, as pessoas comuns acessando aquela tabela podera visualizar apenas os **Names**.
Os **Cientitas de dados** poderão visualizar todos os dados **Name, CPF, email e num_cartao**.
E os Engenheiros de dados terão acesso aos dados **Name, Email**.

## Criar Taxonomia

![Pagina de criar taxonomia](../Imagens/Criar%20Taxonomia.png)

* **Taxonomy Name:** Nomear a Taxonomia
* **Policy Tags:** Tags de política para determinadas sensibilidades de dados.


## Aplicar visibilidade as Tags

![Aplicando visibilidade as tags](../Imagens/Visibilidade%20Tags.png)

* **Selecionar** as tags desejadas
* **Adicionar** as pessoas que terão acesso as tags **selecionadas** acima, e atribuir a perissao **Fine-Grained Reader** para aqueles que terão acesso
* Realizar esse processo para **todas as tags**, de forma fazer o gerenciamento de forma bem **granular**


## Resultado - Tabela Pessoa

### Visualização do grupo sem permissão sobre a tabela

*Schema*
![Visualização sem acesso Schema](../Imagens/Schema%20Sem%20Acesso.png)

*Preview*
![Visualização sem acesso Preview](../Imagens/Preview%20Sem%20Acesso.png)


### Visualização do grupo ALL - (todos aqueles que estão na organização)

*Schema*
![Visualização sem acesso Schema](../Imagens/Schema%20ALL.jpeg)

*Preview*
![Visualização sem acesso Preview](../Imagens/Preview%20ALL.jpeg)

### Visualização do grupo Engenheiros de Dados

*Schema*
![Visualização Eng Schema](../Imagens/Schema%20Eng.jpeg)

*Preview*
![Visualização Eng Preview](../Imagens/Preview%20Eng.jpeg)


### Visualização do grupo Cientistas de Dados

*Schema*
![Visualização Cientista Schema](../Imagens/Schema%20Cientista.png)

*Preview*
![Visualização Cientista Preview](../Imagens/Preview%20Cientista.png)

