## Disponibilização de datasets via Analytics Hub entre diferentes Organizações

É possível disponibilizar datasets entre organizações utilizando emails cadastrados no GCP disponibilizando para pessoas específicas colocando-as como subscriber ou viewer, como por exemplo:

* lucas.lima@2rpnet.com - Analytics Hub Subscriber ou Analytics Hub Viewer.

Ou utilizando o domínio de uma organização, dessa forma, todos aqueles presentes na org podem adicionar o dataset compartilhado ao BigQuery, exemplo de uso do domínio para compartilhamento:

* [2rpnet.com]() - Analytics Hub Subscriber ou Analytics Hub Viewer.


<br>

## Passo a passo do teste realizado


### **1. Definindo os usuários que terão acesso aos dados compartilhados**

Na **organização 1**, acessar o **Analytics Hub** e criar uma **exchange** e **listing** de dados com os dataset para compartilhamento.  
Definir quem poderá **visualizar** (*Analytics Hub Viewer*) e quem poderá **assinar** (*Analytics Hub Subscriber*) a exchange e os datasets compartilhados.

![imagem](./Imagens/Definindo%20dominio%20da%20organização%20para%20compartilhar%20dados.png)

Utilizado o domínio da organização **Cloudstrike** (ambiente de teste) como assinante dos dados compartilhados.

<br>


### **2. Visualizando o dataset compartilhado (visão org 2)**
No BigQuery da **organização 2** ao clicar em `ADICIONAR`, e selecionar o **Analytics Hub** como fonte dos dados.

O usuário deve pesquisar pelo nome da listagem criada no passo anterior, tendo a seguinte visualização.

![imagem](./Imagens/Visualizando%20dataset%20compartilhado%20com%20a%20org.png)

Utilizado dataset **pfs_risco_tivea** do ambiente finops e compartilhado para a org
anização **Cloudstrike** através do domínio [cloudstrike.rf.gd]().

<br>


### **3. Definindo projeto para atribuição de custos (visão org 2)**
Ao clicar em `Assinar` o dataset compartilhado, o usuário pode escolher qual projeto dentro da sua **organização 2** será atribuído os custos do processamento realizado.

![imagem](./Imagens/Definindo%20projeto%20para%20atribuição%20de%20custos.png)

Utilizado projeto `even-hull-434419-c7` para atruibuição de custos.

<br>


### **4. Visualizando dataset linkado recebido pela org 1 (visão org 2)**

Após assinar o dataset compartilhado na **organização 2**, ao visualizar a lista de datasets do projeto atribuído, é possível visualizar o dataset recebido por usa identificação específica 🔗.

![imagem](./Imagens/Dataset%20linkado%20via%20analytics%20hub.png)
