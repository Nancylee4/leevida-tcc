# Permissões (RBAC) e inteligência artificial

Extraído da monografia (Capítulos III e V).

## Funcionalidades de inteligência artificial do LeeVida

| Funcionalidade | Quem usa | Onde na aplicação | Salvaguarda principal |
|---|---|---|---|
| Triagem (Escala de Manchester) | Enfermeiro | Módulo de Triagem | Prioridade mínima calculada pelos sinais vitais |
| Resumo pré-consulta | Médico | Ficha do paciente (automático) | Só dados do prontuário; aviso para confirmar |
| Assistente de prescrição | Médico | Botão flutuante; nova receita | Contexto anonimizado; decisão do médico |
| Verificação da receita | Médico | Ao assinar uma receita | Regras de alergia independentes da IA |
| Exames: valores críticos | Médico | Registo do resultado; página de Exames | Regras de valores de pânico e aviso imediato |
| Sugestão de CID-10 | Médico | Ao concluir a consulta | Validação do formato; escolha manual |

_Tabela 13 – Funcionalidades de inteligência artificial do LeeVida da monografia._

## Prioridade mínima de triagem calculada pelos sinais vitais

| Prioridade mínima | Condições (basta uma) |
|---|---|
| Vermelho | SpO₂ < 85% · PA sistólica < 70 mmHg · FC < 40 ou > 150 bpm · temperatura ≥ 41 °C ou < 32 °C |
| Laranja | SpO₂ < 90% · PA sistólica < 90 mmHg · PA ≥ 200/120 mmHg · FC < 50 ou > 130 bpm · temperatura ≥ 40 °C ou < 35 °C |
| Amarelo | SpO₂ < 94% · PA ≥ 160/100 mmHg · FC > 110 bpm · temperatura ≥ 38,5 °C |
| Verde | Sinais vitais dentro destes limites — a classificação depende dos sintomas |

_Tabela 14 – Prioridade mínima de triagem calculada pelos sinais vitais da monografia._

## Valores laboratoriais de pânico detectados por regras

| Parâmetro | Valor de pânico (adulto) | Unidades reconhecidas |
|---|---|---|
| Hemoglobina | < 7 g/dL | g/dL e g/L |
| Plaquetas | < 20 000 ou > 1 000 000 /µL | /µL e ×10³/µL |
| Leucócitos | < 2 000 ou > 50 000 /µL | /µL e ×10³/µL |
| Potássio | < 2,8 ou > 6,2 mmol/L | mmol/L |
| Sódio | < 120 ou > 160 mmol/L | mmol/L |
| Glicemia | < 50 ou > 450 mg/dL | mg/dL e mmol/L |
| Cálcio | < 6,5 ou > 13 mg/dL | mg/dL e mmol/L |

_Tabela 15 – Valores laboratoriais de pânico detectados por regras da monografia._

## Matriz de permissões por perfil (RBAC)

| Permissão | Admin | Médico | Enfermeiro | Paciente |
|---|---|---|---|---|
| Gerir utilizadores | Sim | Não | Não | Não |
| Consultar logs de auditoria | Sim | Não | Não | Não |
| Gerir pacientes (registar/editar) | Sim | Não | Sim | Não |
| Gerir consultas | Sim | Sim | Não | Não |
| Gerir prescrições | Não | Sim | Não | Não |
| Registar sinais vitais | Sim | Não | Sim | Não |
| Ver conteúdo de resultados de exames | Sim | Sim | Não | Apenas os próprios |
| Marcar consulta / ver dados próprios | Não | Não | Não | Sim |
| Sugestão de prioridade de triagem (IA) | Sim | Não | Sim | Não |
| Restantes funcionalidades de IA | Não | Sim | Não | Não |

_Tabela 16 – Matriz de permissões por perfil (RBAC) da monografia._

## Dados enviados e não enviados ao modelo de IA

| Enviado ao modelo | Nunca enviado |
|---|---|
| Idade, sexo e grupo sanguíneo | Nome do paciente |
| Alergias registadas | Número do BI |
| Últimos sinais vitais e sintomas | Telefone e e-mail |
| Motivos, diagnósticos e códigos CID-10 das consultas recentes | Morada e contacto de emergência |
| Medicação prescrita recentemente | Dados do médico ou da clínica |
| Tipo e resultado dos exames recentes | Credenciais ou tokens de sessão |

_Tabela 17 – Dados enviados e não enviados ao modelo de IA da monografia._
