# Governança de dados no GCP


## Dataplex
Principais ferramentas dataplex CATALOG, PROFILE e DATAQUALITY.


### 📚 Catalog

* **Contacts (novo Catalog)** - Responsáveis pelo processo de curadoria de uma informação específica, além de times envolvidos (grupos ou indivíduos).

* **Steward (antigo Catalog)** - lista dos responsáveis pela catalogação, grupos ou indivíduos (para caso necessidade de comunicar com essas pessoas)

* **Lineage** - Rastreamento dos dados (onde estão sendo utilizados, e os Jobs que o utilizam).

* **Overview** - Possibilidade de detalhar melhor as informações do asset (tabela, bucket).

* **Tags Dataplex** -  Informações sobre os dados que foram catalogados. 
    * Adicionadas as tabelas do dataplex de forma a documentar melhor o catalogo.
    * Baseada nos templates criados no **Tag Templates**, utilizando chave/valor.
    * Os valores da tag são gerados na atribuição da tag a tabela/colunas.

* **Tags BigQuery** - Gerenciamento de permissões dentro do BigQuery, como gerenciar quem pode ou não realizar querys com colunas específicas.




### 📰 Profile 

Monitoramento, realiza um scan que possui as principais características das estruturas das tabelas existentes *interessante para Engenheiros de dados*

* **Criar um Scan** 

* **Table to Scan** - Determinar o asset a ser escaneado (tabela).

* **Scope** 
    * Determinar se será escaneado todos os dados, ou apenas o incremento daquela tabela, ou seja, os dados adicionados naquela tabelas desde o ultimo scan. 
    * Determinar nos filtros o quanto daquela tabela vai ser escaneado

* **Determinar a frequência do escaneamento

> Possibilidade de publicar no BigQuery

> Resultado 
    - Principais estatísticas do objeto, 
    - Domínio das colunas*, 
    - Tipo de conteúdo em cada coluna, 
    - Estatísticas de cada coluna,
    - Pode ser usado como base para data quality.




### 📊 Data Quality 

	> Criar um Scan - Vincular o que vai ser scaneado

	> Quality rules - Define o que vai ser verificado para manter a qualidade dos dados, como:
		- Null check de email, cpf, etc,
		- Se o domínio do dado procede,
		- Se o dado encontrado com uma regex segue um padrão estabelecido,
		- Checagem de linhas.
		
	> Additional Settings - Exportar resultados para o bigquery, é possível criar um dashboard com o resultado da qualidade de dados gerada.




### 🔒 Secure

Determinar permissões via Dataplex.


## IAM/PAM

### 🔑 IAM Quotas e System Limits 

* Filtrar querys por usuarios, 

* Geralmente configuradas para valores ilimitados,

* Gerar um teto a nível de projeto para o quanto querys podem utilizar de **recursos por DIA**, e **por DIA por USUARIO** (quotas distribuídas igualmente por usuários).

* Ao atingir o limite, gera uma mensagem de LIMITE.

### ⏳ PAM 

Gerenciamento de permissões temporárias (requisição, e aprovação),

* Usuários podem requisitar uma permissão com limite máximo de 24 horas para utilizar.




## Bigquery

### ⚖️ Capacity Management *** 
Designar uma capacidade para determinado grupo de times 

	> Slot estimator - tipo uma calculadora de capacidade de uso

	> Create reservation - provavelmente utilizar o STANDARD, se for utilizar machine learning, policy tags (bq), usar o ENTERPRISE.

	> Baseline Slots - Mínimo para manter 100%, pros Jobs operacionalizarem. Dimensionar com o valor médio de slots que consome.
	
	> Idle Slots - Permite que a reserva caso ultrapasse o máximo de slots, utilize os slots que estão parados e sem utilização de outra reserva. Ou seja, utiliza os recursos ociosos.




### 📈 BI Engine*** 
É um serviço de analise em cache que permite usuários explorarem datasets complexos de forma mais ágil. Nativamente integra ferramentas de BI que possam conectar ao BigQuery.




### 🪙 Analytics Hub 
Facilita a dinâmica de billing de forma a quando alguém fizer uma consulta um dataset o custo disso fica pra ele, não pro billing do dataset.

* **Criar uma Exchange** - Area de troca, quem são os usuários que podem receber essa informação.

* **Criar um Listing** - Determinar o dataset, documentar em details.

* Ao adicionar uma nova fonte de dados no **BigQuery**, e adicionar um dataset existente a ele via **Analytics hub**, é possível você acessar um **dataset X** e o custo do seu uso dentro dele vai para o billing do **projeto de destino** .


## Folders

Utilizar folder para determinar as áreas de atuação que realmente utilizam e analisam os dados na organização (que possuem Centro de Custo),

* Determinar folders para áreas que necessitam de um centro de custo EXCLUSIVO (utilizam diversos recursos GCP),

* **Dinâmicas dia a dia:**  alguém pediu um projeto, criou o projeto, na segunda vez que alguém da mesma área requisitar um projeto, CRIAR A FOLDER.


## Anotações sem tópicos

* Caso esteja utilizando apenas o bigquery, vale a pena gerenciar o permissionamento apenas via bigquery (mais granular).

* O controle do dataplex para permissionamento, não permite permissões muito granulares, permissionamento feito via dataset.

* Realizar algo como definir no IAM a permissão de BIGQUERY JOB USER, e dentro do dataplex secure, definir se o usuário tem permissão de acessar os dados BIQUERY DATA VIEWER.

