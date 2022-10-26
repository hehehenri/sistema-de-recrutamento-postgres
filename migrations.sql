CREATE TABLE IF NOT EXISTS admins(
	id INT GENERATED ALWAYS AS IDENTITY,
	cpf TEXT NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS companies(
	id INT GENERATED ALWAYS AS IDENTITY,
	cnpj TEXT NOT NULL UNIQUE,
	name TEXT NOT NULL,
	address TEXT NOT NULL,

	PRIMARY KEY(id),
	admin_id INT NOT NULL,
	CONSTRAINT FK_Admin
		FOREIGN KEY(admin_id)
		REFERENCES admins(id)
);

CREATE TABLE IF NOT EXISTS recruiters(
	id INT GENERATED ALWAYS AS IDENTITY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	about TEXT NOT NULL,

	PRIMARY KEY(id),
    company_id INT NOT NULL,
	CONSTRAINT FK_Company
		FOREIGN KEY(company_id)
		REFERENCES companies(id)
);

CREATE TABLE IF NOT EXISTS positions(
	id INT GENERATED ALWAYS AS IDENTITY,
	title TEXT NOT NULL,
	description TEXT NOT NULL,
	max_budget INT,

	company_id INT NOT NULL,

	PRIMARY KEY(id),
	CONSTRAINT FK_Company
		FOREIGN KEY(company_id)
		REFERENCES companies(id)
);

CREATE TABLE IF NOT EXISTS candidates(
	id INT GENERATED ALWAYS AS IDENTITY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	about TEXT NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS candidates_positions(
	id INT GENERATED ALWAYS AS IDENTITY,

    PRIMARY KEY (id),

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
	id INT GENERATED ALWAYS AS IDENTITY,
	date TIMESTAMP NOT NULL,
	status INT NOT NULL,

    PRIMARY KEY (id),

	recruiter_id INT NOT NULL,
	candidate_id INT NOT NULL,

	CONSTRAINT FK_Recruiter
		FOREIGN KEY(recruiter_id)
		REFERENCES recruiters(id),

	CONSTRAINT FK_Candidate
		FOREIGN KEY(candidate_id)
		REFERENCES candidates(id)
);
