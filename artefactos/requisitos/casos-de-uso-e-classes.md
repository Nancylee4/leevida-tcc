# Casos de uso e classes do domínio

Extraído da monografia (Capítulo III). A versão de referência é a que consta em [`monografia/`](../../monografia/). Os diagramas correspondentes estão em [`artefactos/uml/`](../uml/).

## Descrição dos casos de uso

| Caso de uso | Actor(es) | Relações |
|---|---|---|
| UC01 — Autenticar-se | Utilizador (todos) | Pré-condição de todos os restantes casos de uso |
| UC02 — Gerir perfil | Utilizador (todos) | — |
| UC03 — Consultar notificações | Utilizador (todos) | — |
| UC04 — Gerir utilizadores | Administrador | — |
| UC05 — Consultar logs de auditoria | Administrador | — |
| UC06 — Registar paciente | Enfermeiro | <<include>> UC07 |
| UC07 — Emitir credenciais do paciente | — | Incluído por UC06 |
| UC08 — Registar triagem | Enfermeiro | Estendido por UC09 |
| UC09 — Sugerir prioridade de triagem (IA) | Serviço de IA | <<extend>> UC08, quando o enfermeiro pede sugestão |
| UC10 — Gerir agenda | Médico | — |
| UC11 — Aceitar ou rejeitar consulta | Médico | — |
| UC12 — Consultar prontuário | Médico | Estendido por UC13 |
| UC13 — Gerar resumo pré-consulta (IA) | Serviço de IA | <<extend>> UC12, quando a IA está activa |
| UC14 — Realizar consulta | Médico | Estendido por UC15 |
| UC15 — Sugerir códigos CID-10 (IA) | Serviço de IA | <<extend>> UC14, a pedido do médico |
| UC16 — Registar consulta de retorno | Médico | — |
| UC17 — Emitir prescrição | Médico | — |
| UC18 — Assinar prescrição | Médico | <<include>> UC19 |
| UC19 — Verificar segurança da receita | Serviço de IA | Incluído por UC18 (as regras de alergia correm mesmo sem IA) |
| UC20 — Utilizar assistente de prescrição (IA) | Médico, Serviço de IA | — |
| UC21 — Solicitar exame | Médico | — |
| UC22 — Registar resultado de exame | Médico | Estendido por UC23 |
| UC23 — Interpretar resultado (IA) | Serviço de IA | <<extend>> UC22 |
| UC24 — Emitir justificativo médico | Médico | — |
| UC25 — Marcar consulta | Paciente | — |
| UC26 — Consultar histórico, receitas e exames próprios | Paciente | — |

_Tabela 11 – Descrição dos casos de uso da monografia._

## Classes do domínio do sistema

| Classe | Atributos principais | Relações (multiplicidade) |
|---|---|---|
| User | name, email, password (hash), role, specialty, department, mustChangePassword, deactivatedAt | 1 — 0..* Consultation (médico, 0..1 do lado da consulta); 1 — 0..* Prescription, Exam, Justification, AuditLog; 1 ◆ 0..1 DoctorSchedule; 1 ◆ 0..* AiConversation |
| Patient | name, dob, gender, phone, address, bloodType, allergies[0..*], bi, email, emergencyContact, archivedAt | 1 — 0..* Consultation, Prescription, Exam, Justification |
| Consultation | date, reason, isReturn, diagnosis, notes, status, icd10Codes[0..*], triagePriority, triagePrioritySource | 1 ◆ 0..1 VitalSigns; 0..1 — 0..* Prescription; 1 ◆ 0..* Justification |
| VitalSigns | systolicBP, diastolicBP, heartRate, temperature, weight, height, oxygenSat, symptoms | Parte de Consultation; registado por 1 User |
| Prescription | date, instructions, status | 1 ◆ 1..* Medication |
| Medication | name, dosage, frequency, duration | Parte de Prescription |
| Exam | type, status, result, resultDate, aiCritical, aiFlags, aiInterpretation | 0..* — 1 Patient; 0..* — 1 User (requisitante) |
| Justification | date, reason, restDays, notes | Parte de Consultation; 0..* — 1 Patient |
| DoctorSchedule | days (disponibilidade semanal) | Parte de User (médico) |
| Notification | title, message, read, timestamp, recipientRole | 0..* — 0..1 User (destinatário) |
| AuditLog | userName, action, resource, resourceId, timestamp, ip | 0..* — 1 User (autor) |
| AiConversation | title, patientId, messages, updatedAt | Parte de User (médico) |

_Tabela 12 – Classes do domínio do sistema da monografia._
