# Requisitos do sistema

Extraído da monografia (Capítulo III). A versão de referência é a que consta em [`monografia/`](../../monografia/).

## Requisitos funcionais do sistema

| ID | Descrição |
|---|---|
| RF01 | O sistema deve permitir a autenticação de utilizadores por e-mail e palavra-passe. |
| RF02 | O sistema deve restringir o registo de novos pacientes ao perfil de enfermeiro. |
| RF03 | O sistema deve permitir ao enfermeiro registar a triagem (sintomas iniciais e sinais vitais) de um paciente. |
| RF04 | O sistema deve permitir ao médico aceitar ou rejeitar consultas marcadas pelos pacientes. |
| RF05 | O sistema deve permitir ao médico registar consultas e atualizar o histórico clínico do paciente. |
| RF06 | O sistema deve permitir ao médico emitir, assinar e submeter prescrições médicas. |
| RF07 | O sistema deve permitir ao médico solicitar exames laboratoriais. |
| RF08 | O sistema deve permitir ao médico registar o resultado dos exames, ocultando o respectivo conteúdo clínico ao perfil de enfermeiro. |
| RF09 | O sistema deve permitir ao médico gerir a sua agenda de disponibilidade. |
| RF10 | O sistema deve permitir ao paciente marcar consultas, filtrando os médicos por especialidade e disponibilidade. |
| RF11 | O sistema deve permitir ao paciente consultar o seu próprio histórico clínico, prescrições e estado das consultas. |
| RF12 | O sistema deve permitir ao administrador gerir utilizadores e atribuir perfis de acesso (roles). |
| RF13 | O sistema deve registar automaticamente um log de auditoria para toda acção crítica (autenticação, registo de consulta, prescrição, acesso ao histórico, gestão de utilizadores). |
| RF14 | O sistema deve permitir ao administrador consultar o registo de logs. |
| RF15 | O sistema deve notificar os utilizadores envolvidos nos eventos relevantes do fluxo clínico (marcação, aceitação/rejeição de consulta, disponibilização de receita ou de resultado de exame). |
| RF16 | O sistema deve sugerir ao enfermeiro uma prioridade de triagem (Escala de Manchester), nunca inferior à prioridade mínima calculada por regras a partir dos sinais vitais. |
| RF17 | O sistema deve apresentar ao médico um resumo pré-consulta do prontuário do paciente. |
| RF18 | O sistema deve disponibilizar ao médico um assistente de prescrição conversacional, com histórico de conversas privado. |
| RF19 | O sistema deve verificar a segurança da receita (alergias, interacções, doses e contra-indicações) antes da assinatura, exigindo confirmação explícita quando o resultado for Perigo. |
| RF20 | O sistema deve detectar valores críticos nos resultados de exames e notificar imediatamente o médico requisitante. |
| RF21 | O sistema deve sugerir códigos CID-10 a partir do diagnóstico, cabendo ao médico escolher os que são gravados. |
| RF22 | O sistema deve ordenar a fila de espera do médico pela prioridade de triagem e, depois, pela hora de chegada. |

_Tabela 9 – Requisitos funcionais do sistema da monografia._

## Requisitos não funcionais do sistema

| ID | Categoria | Descrição |
|---|---|---|
| RNF01 | Segurança | O acesso às funcionalidades e aos dados deve ser restringido de acordo com o perfil do utilizador autenticado (RBAC). |
| RNF02 | Segurança | Toda a comunicação entre o cliente e o servidor deve ser realizada através de HTTPS/TLS. |
| RNF03 | Confidencialidade | Dados clínicos sensíveis (ex.: resultados de exames) apenas devem ser visíveis aos perfis estritamente autorizados. |
| RNF04 | Usabilidade | A interface deve ser simples e intuitiva, adequada a utilizadores com literacia digital variável, incluindo profissionais sem formação técnica em informática. |
| RNF05 | Portabilidade | O sistema deve ser acessível a partir de um navegador web comum, sem exigir instalação de software adicional. |
| RNF06 | Desempenho | As operações de consulta de dados mais frequentes (lista de pacientes, histórico clínico) devem responder em tempo considerado aceitável pelo utilizador (poucos segundos). |
| RNF07 | Auditabilidade | Todas as acções críticas devem ficar registadas de forma imutável para efeitos de auditoria e rastreabilidade. |
| RNF08 | Disponibilidade | O sistema deve estar disponível durante o horário normal de funcionamento da clínica, minimizando períodos de indisponibilidade. |
| RNF09 | Manutenibilidade | O código deve ser organizado em módulos (servidor) e componentes e contextos (cliente) independentes, de forma a facilitar a manutenção e a evolução futura do sistema. |
| RNF10 | Conformidade legal | O tratamento de dados pessoais e de saúde deve observar os princípios estabelecidos na Lei n.º 22/11 (Lei de Protecção de Dados Pessoais de Angola). |
| RNF11 | Privacidade | Os pedidos ao serviço de IA devem conter apenas dados clínicos anonimizados — nunca nome, BI, contactos ou morada do paciente — e a chave da API deve existir apenas no servidor. |
| RNF12 | Tolerância a falhas | O sistema deve continuar operacional quando o serviço de IA estiver lento ou indisponível, recorrendo a regras locais e avisando o utilizador. |
| RNF13 | Supervisão humana | Toda a sugestão produzida por IA deve ser identificada como tal na interface e confirmada pelo profissional antes de produzir efeitos. |

_Tabela 10 – Requisitos não funcionais do sistema da monografia._
