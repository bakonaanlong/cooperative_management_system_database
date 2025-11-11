# Cooperative Management System Database Schema  
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)

A **comprehensive relational database schema** for managing cooperative societies (savings & credit unions). Supports member management, contributions, shares, loans, dividends, meetings, accounting, and audit trails.

---

## 📋 Table of Contents
- [Overview](#overview)
- [Database Diagram](#database-diagram)
- [Tables](#tables)
- [Key Features](#key-features)
- [Setup & Migration](#setup--migration)


---

## Overview

This schema models a **multi-cooperative platform** where:
- Each cooperative operates independently.
- Members contribute, buy shares, apply for loans, attend meetings, and receive dividends.
- Full double-entry accounting via `journal_entries` and `accounts`.
- Role-based access control (`users`) and audit logging (`audit_log`).

> Designed for scalability, audit compliance, and integration with web/mobile apps.

---

## Database Diagram

```mermaid
erDiagram
    cooperative ||--o{ members : has
    cooperative ||--o{ contribution_types : defines
    cooperative ||--o{ share_types : offers
    cooperative ||--o{ loan_products : provides
    cooperative ||--o{ accounts : maintains
    cooperative ||--o{ meetings : organizes
    cooperative ||--o{ fees : charges
    cooperative ||--o{ dividends : declares
    cooperative ||--o{ transactions : records
    cooperative ||--o{ users : manages

    members ||--o{ member_next_of_kin : has
    members ||--o{ contributions : makes
    members ||--o{ member_shares : owns
    members ||--o{ loans : applies
    members ||--o{ guarantors : guarantees
    members ||--o{ meeting_attendance : attends
    members ||--o{ fee_payments : pays
    members ||--o{ dividend_distributions : receives

    contribution_types ||--o{ contributions : used_in
    share_types ||--o{ member_shares : used_in
    loan_products ||--o{ loans : used_in
    loans ||--o{ loan_repayments : has
    loans ||--o{ guarantors : requires
    meetings ||--o{ meeting_attendance : records
    fees ||--o{ fee_payments : paid_via
    dividends ||--o{ dividend_distributions : distributed_via
    transactions ||--o| journal_entries : triggers

    users }|--o{ audit_log : performs
```

> Save as `docs/er-diagram.mmd` and render with [Mermaid Live Editor](https://mermaid.live)

---

## Tables

| Table | Description |
|------|-------------|
| `cooperative` | Core entity: name, registration, status |
| `members` | Member profiles with KYC (NIN/BVN) |
| `member_next_of_kin` | Emergency contact per member |
| `contribution_types` | Recurring or one-off contribution plans |
| `contributions` | Actual payments by members |
| `share_types` | Share classes with pricing |
| `member_shares` | Units purchased by members |
| `loan_products` | Loan packages (tenor, interest, collateral) |
| `loans` | Loan applications & lifecycle |
| `loan_repayments` | Scheduled vs actual repayments |
| `guarantors` | Members guaranteeing loans |
| `transactions` | Unified financial event log |
| `accounts` | Chart of Accounts (COA) |
| `journal_entries` | Double-entry bookkeeping |
| `meetings` | AGM, committee meetings |
| `meeting_attendance` | Sign-in records |
| `fees` | Registration, late, processing fees |
| `fee_payments` | Fee settlement records |
| `dividends` | Annual profit distribution |
| `dividend_distributions` | Per-member payout |
| `users` | System users (admins, tellers, etc.) |
| `audit_log` | Full audit trail with JSON diff |

---

## Key Features

| Feature | Implementation |
|-------|----------------|
| **Multi-Tenancy** | `coop_id` foreign key in all major tables |
| **KYC Compliance** | `id_type`, `id_num`, `photo_url` |
| **Flexible Contributions** | Multiple types & frequencies |
| **Share Capital** | Unit-based, min/max limits |
| **Loan Lifecycle** | Pending → Approved → Active → Closed/Default |
| **Guarantor System** | Self-referencing via `guarantors` |
| **Double-Entry Accounting** | `journal_entries` + `accounts` |
| **Dividend Engine** | Rate-based, tax-deductible |
| **Meeting Management** | Agenda, minutes, digital attendance |
| **Role-Based Access** | `users.role` with scoped `coop_id` |
| **Audit Trail** | `audit_log` with `old_values`/`new_values` in JSON |

---

## Setup & Migration

### Create Database
```sql
CREATE DATABASE Cooperative_System;
USE Cooperative_System;
```


### Recommended Indexes (Add to `indexes.sql`)
```sql
-- Performance boosts
CREATE INDEX idx_members_coop ON members(coop_id);
CREATE INDEX idx_loans_status ON loans(status);
CREATE INDEX idx_contributions_date ON contributions(payment_date);
CREATE INDEX idx_transactions_type ON transactions(type);
CREATE INDEX idx_audit_timestamp ON audit_log(timestamp DESC);
```

---

## Support

- **Issues**: [github.com/yourusername/cooperative-system-db/issues](https://github.com)

---

## Folder Structure

```
cooperative-system-db/
├── README.md
├── cooperative_system_database.sql
├── cooperative_system_indexes.sql
├── entity_relation_diagram.jpg
```

---
