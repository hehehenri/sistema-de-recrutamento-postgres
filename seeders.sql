COPY admins(cpf, first_name, last_name) FROM '/home/seeders/admins.csv' DELIMITER ',' CSV HEADER;
COPY companies(cnpj, name, address, admin_id) FROM '/home/seeders/companies.csv' DELIMITER ',' CSV HEADER;
COPY recruiters(first_name, last_name, about, company_id) FROM '/home/seeders/recruiters.csv' DELIMITER ',' CSV HEADER;
COPY positions(title, description, max_budget, company_id) FROM '/home/seeders/positions.csv' DELIMITER ',' CSV HEADER;
COPY candidates(first_name, last_name, about) FROM '/home/seeders/candidates.csv' DELIMITER ',' CSV HEADER;
COPY candidates_positions(candidate_id, position_id) FROM '/home/seeders/candidates_positions.csv' DELIMITER ',' CSV HEADER;
COPY interviews(status, recruiter_id, candidate_id) FROM '/home/seeders/interviews.csv' DELIMITER ',' CSV HEADER;
