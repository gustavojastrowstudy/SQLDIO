# Sistema de Gerenciamento de Oficina

Este projeto contém o esquema lógico e o script SQL para a criação de um banco de dados que gerencia uma oficina mecânica. O banco de dados gerencia informações sobre clientes, veículos, serviços e ordens de serviço.

## Estrutura do Banco de Dados
- **Clientes**: Armazena informações dos clientes.
- **Veículos**: Registra os veículos associados aos clientes.
- **Serviços**: Detalha os serviços oferecidos pela oficina.
- **Ordens de Serviço**: Cada ordem de serviço representa uma solicitação de serviços para um veículo.
- **Serviços Realizados**: Relaciona os serviços realizados em uma ordem de serviço específica.

## Queries de Exemplos
- Recuperação simples de clientes.
- Filtragem de veículos por marca.
- Cálculo de total de serviços realizados em uma ordem.
- Ordenação de ordens de serviço por data.
- Filtro de ordens de serviço com total acima de um valor específico.
- Junções entre tabelas para exibir informações de clientes, veículos e ordens de serviço.

## Como Usar
1. Clone o repositório.
2. Execute o script SQL em seu banco de dados MySQL ou PostgreSQL.
3. Utilize as queries de exemplo para testar a base de dados.

