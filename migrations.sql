CREATE TABLE IF NOT EXISTS admins(
	id SERIAL PRIMARY KEY,
	cpf TEXT NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS companies(
	id SERIAL PRIMARY KEY,
	cnpj TEXT NOT NULL UNIQUE,
	name TEXT NOT NULL,
	address TEXT NOT NULL,

	admin_id INT NOT NULL,

	CONSTRAINT FK_Admin
		FOREIGN KEY(admin_id)
		REFERENCES admins(id)
);

CREATE TABLE IF NOT EXISTS recruiters(
	id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	about TEXT NOT NULL,

    company_id INT NOT NULL,
	CONSTRAINT FK_Company
		FOREIGN KEY(company_id)
		REFERENCES companies(id)
);

CREATE TABLE IF NOT EXISTS positions(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	description TEXT NOT NULL,
	max_budget INT,

	company_id INT NOT NULL,

	CONSTRAINT FK_Company
		FOREIGN KEY(company_id)
		REFERENCES companies(id)
);

CREATE TABLE IF NOT EXISTS candidates(
	id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	about TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS candidates_positions(
	id SERIAL PRIMARY KEY,

	candidate_id INT NOT NULL,
	position_id INT NOT NULL,

	CONSTRAINT FK_Candidate
		FOREIGN KEY(candidate_id)
		REFERENCES candidates(id),

	CONSTRAINT FK_Position
		FOREIGN KEY(position_id)
		REFERENCES positions(id)
);

CREATE TABLE IF NOT EXISTS interviews(
	id SERIAL PRIMARY KEY,
	status INT NOT NULL,

	recruiter_id INT NOT NULL,
	candidate_id INT NOT NULL,

	CONSTRAINT FK_Recruiter
		FOREIGN KEY(recruiter_id)
		REFERENCES recruiters(id),

	CONSTRAINT FK_Candidate
		FOREIGN KEY(candidate_id)
		REFERENCES candidates(id)
);
