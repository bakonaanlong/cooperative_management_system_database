USE Cooperative_System;

CREATE INDEX idx_cooperative_status_established ON cooperative(status, established_date);
CREATE INDEX idx_cooperative_name ON cooperative(name);

CREATE INDEX idx_members_coop_id ON members(coop_id);
CREATE INDEX idx_members_status ON members(status);
CREATE INDEX idx_members_join_date ON members(join_date);
CREATE INDEX idx_members_full_name ON members(last_name, first_name);
CREATE INDEX idx_members_email ON members(email);
CREATE INDEX idx_members_phone ON members(phone);
CREATE INDEX idx_members_coop_status_name ON members(coop_id, status, last_name, first_name);

CREATE INDEX idx_next_of_kin_member_id ON member_next_of_kin(member_id);

CREATE INDEX idx_contrib_types_coop_id ON contribution_types(coop_id);
CREATE INDEX idx_contrib_types_name ON contribution_types(name);

CREATE INDEX idx_contributions_member_id ON contributions(member_id);
CREATE INDEX idx_contributions_type_id ON contributions(contrib_type_id);
CREATE INDEX idx_contributions_payment_date ON contributions(payment_date);
CREATE INDEX idx_contributions_channel ON contributions(payment_channel);
CREATE INDEX idx_contributions_member_date ON contributions(member_id, payment_date);
CREATE INDEX idx_contributions_type_date ON contributions(contrib_type_id, payment_date);

CREATE INDEX idx_share_types_coop_id ON share_types(coop_id);

CREATE INDEX idx_member_shares_member_id ON member_shares(member_id);
CREATE INDEX idx_member_shares_share_type_id ON member_shares(share_type_id);
CREATE INDEX idx_member_shares_purchase_date ON member_shares(purchase_date);
CREATE INDEX idx_member_shares_member_type ON member_shares(member_id, share_type_id);

CREATE INDEX idx_loan_products_coop_id ON loan_products(coop_id);

CREATE INDEX idx_loans_member_id ON loans(member_id);
CREATE INDEX idx_loans_product_id ON loans(product_id);
CREATE INDEX idx_loans_status ON loans(status);
CREATE INDEX idx_loans_disburse_date ON loans(disburse_date);
CREATE INDEX idx_loans_member_status ON loans(member_id, status);
CREATE INDEX idx_loans_status_date ON loans(status, disburse_date);

CREATE INDEX idx_loan_repayments_loan_id ON loan_repayments(loan_id);
CREATE INDEX idx_loan_repayments_due_date ON loan_repayments(due_date);
CREATE INDEX idx_loan_repayments_paid_date ON loan_repayments(paid_date);
CREATE INDEX idx_loan_repayments_due_paid ON loan_repayments(loan_id, due_date, paid_amount);

CREATE INDEX idx_guarantors_loan_id ON guarantors(loan_id);
CREATE INDEX idx_guarantors_member_id ON guarantors(member_id);
CREATE INDEX idx_guarantors_member_loan ON guarantors(member_id, loan_id);

CREATE INDEX idx_transactions_coop_id ON transactions(coop_id);
CREATE INDEX idx_transactions_member_id ON transactions(member_id);
CREATE INDEX idx_transactions_type ON transactions(type);
CREATE INDEX idx_transactions_date ON transactions(trans_date);
CREATE INDEX idx_transactions_coop_type_date ON transactions(coop_id, type, trans_date);
CREATE INDEX idx_transactions_member_date ON transactions(member_id, trans_date);

CREATE INDEX idx_accounts_coop_id ON accounts(coop_id);
CREATE INDEX idx_accounts_code ON accounts(code);
CREATE INDEX idx_accounts_type ON accounts(type);
CREATE INDEX idx_accounts_coop_code ON accounts(coop_id, code);

CREATE INDEX idx_journal_coop_id ON journal_entries(coop_id);
CREATE INDEX idx_journal_transaction_id ON journal_entries(transaction_id);
CREATE INDEX idx_journal_entry_date ON journal_entries(entry_date);
CREATE INDEX idx_journal_coop_date ON journal_entries(coop_id, entry_date);

CREATE INDEX idx_meetings_coop_id ON meetings(coop_id);
CREATE INDEX idx_meetings_date ON meetings(meeting_date);
CREATE INDEX idx_meetings_status ON meetings(status);
CREATE INDEX idx_meetings_coop_date_status ON meetings(coop_id, meeting_date, status);

CREATE INDEX idx_attendance_meeting_id ON meeting_attendance(meeting_id);
CREATE INDEX idx_attendance_member_id ON meeting_attendance(member_id);
CREATE INDEX idx_attendance_member_meeting ON meeting_attendance(member_id, meeting_id);

CREATE INDEX idx_fees_coop_id ON fees(coop_id);
CREATE INDEX idx_fees_applicable_to ON fees(applicable_to);

CREATE INDEX idx_fee_payments_member_id ON fee_payments(member_id);
CREATE INDEX idx_fee_payments_fee_id ON fee_payments(fee_id);
CREATE INDEX idx_fee_payments_payment_date ON fee_payments(payment_date);
CREATE INDEX idx_fee_payments_member_date ON fee_payments(member_id, payment_date);

CREATE INDEX idx_dividends_coop_id ON dividends(coop_id);
CREATE INDEX idx_dividends_fiscal_year ON dividends(fiscal_year);
CREATE INDEX idx_dividends_status ON dividends(status);

CREATE INDEX idx_div_dist_dividend_id ON dividend_distributions(dividend_id);
CREATE INDEX idx_div_dist_member_id ON dividend_distributions(member_id);
CREATE INDEX idx_div_dist_status ON dividend_distributions(status);
CREATE INDEX idx_div_dist_member_status ON dividend_distributions(member_id, status);

CREATE INDEX idx_users_coop_id ON users(coop_id);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_member_id ON users(member_id);
CREATE INDEX idx_users_email ON users(email);

CREATE INDEX idx_audit_user_id ON audit_log(user_id);
CREATE INDEX idx_audit_table_record ON audit_log(table_name, record_id);
CREATE INDEX idx_audit_action ON audit_log(action);
CREATE INDEX idx_audit_timestamp ON audit_log(timestamp);
CREATE INDEX idx_audit_user_time ON audit_log(user_id, timestamp);