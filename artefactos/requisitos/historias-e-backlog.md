# Histórias de utilizador, backlog e releases

Extraído da monografia (Capítulo III). A versão de referência é a que consta em [`monografia/`](../../monografia/).

## Histórias de utilizador

| ID | Perfil | Descrição |
|---|---|---|
| US01 | Todos | Como utilizador do sistema, quero autenticar-me com o meu e-mail e palavra-passe, para aceder apenas às funcionalidades permitidas ao meu perfil. |
| US02 | Enfermeiro | Como enfermeiro, quero registar um novo paciente no sistema, para que apenas eu (e não o próprio paciente) crie a sua ficha e as suas credenciais de acesso. |
| US03 | Enfermeiro | Como enfermeiro, quero registar a triagem (sintomas iniciais e sinais vitais) de um paciente recebido, para preparar o atendimento médico. |
| US04 | Médico | Como médico, quero aceitar ou rejeitar uma consulta marcada por um paciente, para gerir a minha agenda de forma controlada. |
| US05 | Médico | Como médico, quero registar a consulta e atualizar o histórico clínico do paciente, para manter um registo contínuo do seu estado de saúde. |
| US06 | Médico | Como médico, quero emitir, assinar digitalmente e submeter uma prescrição médica, para que o paciente tenha acesso imediato à receita. |
| US07 | Médico | Como médico, quero solicitar exames laboratoriais associados a uma consulta, para complementar o diagnóstico do paciente. |
| US08 | Médico | Como médico, quero registar consultas de retorno associadas a um atendimento anterior, para dar continuidade ao acompanhamento clínico. |
| US09 | Médico | Como médico, quero gerir a minha agenda de disponibilidade, para que os pacientes apenas possam marcar consulta comigo nos horários que eu definir. |
| US10 | Médico | Como médico, quero registar o resultado dos exames que solicitei, garantindo que o enfermeiro apenas acompanha o estado do exame e nunca o seu conteúdo, para respeitar a confidencialidade da informação sensível do paciente. |
| US11 | Paciente | Como paciente, quero marcar uma consulta escolhendo a especialidade e um médico com disponibilidade, para agendar o meu atendimento. |
| US12 | Paciente | Como paciente, quero consultar o meu histórico clínico, as minhas prescrições e o estado das minhas consultas, para acompanhar o meu próprio cuidado de saúde. |
| US13 | Administrador | Como administrador, quero gerir utilizadores e definir os seus perfis de acesso (roles), para manter o controlo de quem pode aceder ao sistema. |
| US14 | Administrador | Como administrador, quero consultar o registo de auditoria (logs) das acções realizadas no sistema, para monitorizar o seu uso e detectar eventuais anomalias. |
| US15 | Todos os intervenientes | Como utilizador do sistema, quero receber notificações sobre os eventos relevantes do meu fluxo (consulta aceite/rejeitada, receita disponível, resultado de exame disponível), para me manter informado sem necessidade de consultar o sistema constantemente. |
| US16 | Enfermeiro | Como enfermeiro, quero receber uma sugestão de prioridade de triagem (Escala de Manchester) a partir dos sinais vitais e sintomas, para classificar o doente com maior segurança, mantendo a decisão final. |
| US17 | Médico | Como médico, quero ver um resumo do prontuário ao abrir a ficha do paciente, para me orientar rapidamente antes de iniciar a consulta. |
| US18 | Médico | Como médico, quero consultar um assistente de prescrição que tenha em conta o histórico anonimizado do paciente, para escolher medicação, doses e verificar interacções. |
| US19 | Médico | Como médico, quero que a receita seja verificada (alergias, interacções, doses) antes de a assinar, para evitar erros de prescrição. |
| US20 | Médico | Como médico, quero ser avisado imediatamente quando um resultado de exame contém valores críticos, para agir com urgência. |
| US21 | Médico | Como médico, quero receber sugestões de códigos CID-10 a partir do diagnóstico, para codificar a consulta de forma uniforme. |

_Tabela 6 – Histórias de utilizador da monografia._

## Product Backlog

| ID | Prioridade | Sprint previsto |
|---|---|---|
| US01 — Autenticação e RBAC | Alta | 1 |
| US02 — Registo de pacientes (enfermeiro) | Alta | 1 |
| US04, US05 — Consulta e histórico clínico | Alta | 2 |
| US06 — Prescrição médica | Alta | 2 |
| US03 — Triagem | Média | 2 |
| US07, US10 — Exames laboratoriais | Média | 3 |
| US09 — Agenda do médico | Média | 3 |
| US11, US12 — Portal do paciente | Alta | 3 |
| US13, US14 — Administração e logs | Média | 4 |
| US08 — Consultas de retorno | Baixa | 4 |
| US15 — Notificações | Baixa | 4 |
| US16–US21 — Funcionalidades de IA | Média | 5 |

_Tabela 7 – Product Backlog da monografia._

## Releases do produto

| Release | Conteúdo funcional |
|---|---|
| v0.1 | Autenticação, controlo de acesso por perfil (RBAC) e gestão de pacientes. |
| v0.2 | Registo de consultas, histórico clínico e prescrições médicas. |
| v0.3 | Exames laboratoriais, agenda do médico e portal do paciente. |
| v0.4 | Administração de utilizadores, registo de auditoria (logs) e sistema de notificações. |
| v0.5 | Funcionalidades de inteligência artificial de apoio à decisão clínica: triagem, resumo pré-consulta, assistente e verificação de prescrições, valores críticos de exames e sugestão de CID-10. |

_Tabela 8 – Releases do produto da monografia._
