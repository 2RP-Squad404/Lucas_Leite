## Relatório

* Criado scripts SQL separados testando a funcionalidade de cada um deles;

* Realizada junção dos scripts com a maior quantidade possível em cada tabela temporária;

* Criadas tabelas temporárias com `WITH nome_da_tabela AS ()` e finalizando com `SELECT tp.coluna1_tabela_temp, tt.coluna2_tabela_temp  FROM tabela_temp1 tp JOIN tabela_temp_2 tt ON tp.coluna1 = tt.coluna1` utilizando as tabelas temporárias e linkando os dados delas através de uma coluna com dados em comum.

* Após diversas correções, finalizado colocando no inicio do código  a criação da tabela que receberá os dados integrados das duas outras tabelas `CREATE TABLE nome_da_tabela_integracao AS`.