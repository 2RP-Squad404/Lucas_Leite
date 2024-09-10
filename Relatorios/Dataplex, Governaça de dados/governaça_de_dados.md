# Relatório de Estudos

**Nome:** Lucas Lima Leite  
**Data:** 1ª Semana de Setembro 2024

## Assuntos Vistos

- [Governança de Dados](#governança-de-dados)
- [GIT](#git)

## Governança de Dados

A governança de dados é **tudo** o que você faz para garantir que os **dados sejam seguros, privados, precisos, disponíveis e utilizáveis**. Isso inclui as ações que as pessoas devem realizar, os processos que devem seguir e a tecnologia que oferece suporte durante todo o ciclo de vida dos dados.

Governança de dados significa definir padrões internos (**políticas de dados**) que se aplicam a forma como os dados são coletados, armazenados, processados e descartados. Ela **controla quem pode acessar quais tipos de dados e quais tipos de dados estão sob governança**. A governança de dados também envolve a conformidade com padrões externos definidos por associações do setor, agências governamentais e outras partes interessadas.

### Benefícios
* **Melhora na tomada de decisões:** Os usuários conseguem os dados que precisam para **alcançar e atender clientes, projetar e melhorar produtos e serviços e aproveitar oportunidades de novas receitas**.

* **Melhorar o controle de custos:** **Os dados ajudam a gerenciar os recursos de maneira mais eficaz**. Possibilitando **eliminar a duplicação de dados causada por silos de informações** (unidades de armazenamento de dados que não se comunicam entre si), tirando a necessidade de comprar hardware excedente e nem manter hardware caro.

* **Melhora na conformidade regulatória:** Um cenário regulatório cada vez mais complexo exigiu que as organizações estabelecessem práticas robustas de governança de dados. **Possibilidade de evitar riscos associados à não conformidade enquanto antecipa proativamente novas regulamentações**.

* **Gerenciamento de riscos:** Com uma governança forte, você elimina as preocupações sobre a exposição de dados sensíveis a indivíduos ou sistemas que não têm a autorização adequada, a violações de segurança de usuários externos mal-intencionados ou mesmo a usuários internos que acessam dados que não têm o direito de ver. 

* **Maior permissão de acesso da equipe:** Uma governança de dados eficiente permite que mais funcionários acessem mais dados, com a confiança de que esses funcionários têm acesso aos dados corretos e que essa democratização de dados não terá um impacto negativo na organização.

### Função da governança de dados
A governança de dados é necessária para garantir que os dados estejam seguros, protegidos, privados, utilizáveis e em conformidade com as políticas de dados internos e externos. A governança de dados permite definir e aplicar controles que permitem maior acesso aos dados, conquistando a segurança e a privacidade dos controles de dados. Casos de uso comuns :

* **Administração de dados -** Governança de dados muitas vezes significa conceder aos "administradores de dados" a responsabilidade pelos próprios dados e pelos processos que garantem o uso adequado dos dados.

* **Qualidade dos dados -** A governança de dados também é usada para garantir a qualidade dos dados, que se refere a quaisquer atividades ou técnicas projetadas para garantir que os dados sejam adequados para serem usados. A qualidade dos dados é geralmente avaliada em seis dimensões: acurácia, integridade, consistência, oportunidade, validade e exclusividade.

* **Gerenciamento de dados -** Este é um conceito amplo que abrange todos os aspectos do gerenciamento de dados como um ativo empresarial, desde a coleta e o armazenamento até o uso e a supervisão, garantindo que os dados sejam utilizados de forma segura, eficiente e econômica antes de serem descartados.

## Dataplex
O Dataplex do Google Cloud Platform (GCP) é um serviço para **gerenciamento de dados em larga escala**, oferecendo uma plataforma **centralizada** para organizar, monitorar e governar dados de forma distribuída. Ele permite que as empresas **unifiquem seus dados de diferentes fontes** (como data lakes e data warehouses), **automatizem a catalogação e a governança**, além de aplicar políticas de segurança e compliance. O Dataplex facilita a análise de dados com ferramentas nativas do GCP, como BigQuery, e fornece uma camada de abstração para simplificar o acesso aos dados.

### Governança de dados no BigQuery
Para dar suporte ao ciclo de vida completo dos dados e facilitar o gerenciamento, a descoberta e a governança dos dados para os clientes, é possível utilizar recursos do Dataplex diretamente no BigQuery, incluindo qualidade e linhagem de dados, e criação de perfil.

### Descoberta automatizada de dados com o Data Catalog
Com o data catalog é possivel automatizar a descoberta de dados, a classificação e o enriquecimento de metadados de dados estruturados, semiestruturados e não estruturados, armazenados no Google Cloud e em outros locais, com inteligência de dados integrada.


## Get Started with Dataplex (Course)
### [Dataplex: Qwik Start - Console/Command Line:](https://www.cloudskillsboost.google/course_templates/726?catalog_rank=%7B%22rank%22%3A1%2C%22num_filters%22%3A1%2C%22has_search%22%3Atrue%7D&search_id=36198280)

* **Ativar a API do Dataplex**,
* **Criar um lake** um lake no dataplex é o domínio organizacional mais elevado que representa uma área de dados específica, uma unidade de negócios ou um departamento. O que permite organizar e fornecer dados para um grupo de usuários específico.
* **Particionar o data lake com Zonas -** As *"zones"* são subdomínios dentro do lake que permite categorizar os dados de forma mais detalhada. Podendo categorizar os dados por estágio, uso ou restrições.  

    * **Tipos de Zonas:**

        * **Raw zones -** Contêm dados em formato bruto (como arquivos em buckets do Cloud Storage) e não estão sujeitos a validações rigorosas de tipo.
        * **Curated Zones -** Contêm dados transformados, que foram limpos, formatados e estão prontos para análise, como datasets do BigQuery.

* **Adicionar conteudo(*assets*) as Zonas -** Os dados armazenados em buckets do Cloud Storage ou datasets do BigQuery podem ser vinculados como *assets* (ativos) a *zones* dentro de um *lake* no Dataplex.

### [Tagging Dataplex Assets:](https://www.cloudskillsboost.google/course_templates/726/labs/461570)

* **Ativar a API do Dataplex**
* **Criar um lake**
* **Criar uma Zona (Curated Zone)**
* **Adicionar um asset a Zona criada**

* **Criar uma Tag Template -** Para realizar a tag dos dados, é necessário *criar um Template de Tag*, que pode ser **publica (recomendado)** ou privada. Usuários que **possuem as permissões necessárias** para vizualizar um ativo de dados podem ver **todas as tags publicas associadas a ele**. Isso facilita a **busca e descoberta dos dados**, ao mesmo tempo em que **respeita os controles de acesso** aos dados já implementados nos dados subjacentes.

* **Associar uma *Tag Template* a um *Asset* -** Após criar uma tag template, é possível usa-lo para anexar *Tags* a qualquer ativo de dados desejados, desde que tenha acesso a esses ativos.

* **Buscar *Assets* utilizando *Tags* -** Depois associar *tags* aos *assets* desejados, é possível buscar todos os assets associados a uma ou mais tags.



### Recursos Utilizados:


### Principais comandos (se aplicável):



### Desafios Encontrados:
Com realação aos estudos não tive dificuldades, porém a com realação a utilização do git, acredito que se faz necessário maior utilização da ferramenta e do git flow para se tornar algo mais usual, e obter maior fluidez de trabalho.

### Feedback e Ajustes:
Com realação as diversas tecnologias apresentadas, acredito ajudaria se tivéssemos um direcionamento de quais tecnologias focarmos inicialmente, algo que provavelmente utilizaremos num futuro próximo.

### Próximos Passos:  
Acredito que focar em linguagens frequentemente utilizadas na área como Python, PostgreSQL, ferramentas como GIT e git flow, e buscar conhecer mais bancos de dados em nuvem como os da Google, AWS, etc.