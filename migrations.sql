CREATE TABLE admins(
	id INT GENERATED ALWAYS AS IDENTITY,
	cpf TEXT NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,

	PRIMARY KEY(id),
);

CREATE TABLE companies(
	id INT GENERATED ALWAYS AS IDENTITY,
	cnpj TEXT NOT NULL UNIQUE,
	name TEXT NOT NULL,
	address TEXT NOT NULL,

	PRIMARY KEY(id),
	admin_id INT NOT NULL,
	CONSTRAINT FK_Admin
		FOREIGN KEY(admin_id)
		REFERENCES amdins(id)
);

CREATE TABLE recruiters(
	id INT GENERATED ALWAYS AS IDENTITY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	about TEXT NOT NULL,

	PRIMARY KEY(id),
	CONSTRAINT FK_Company
		FOREIGN KEY(company_id)
		REFERENCES companies(id)
);

CREATE TABLE positions(
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

CREATE TABLE candidates(
	id INT GENERATED ALWAYS AS IDENTITY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	about TEXT NOT NULL,

	PRIMARY KEY(id)
);

CREATE TABLE candidates_positions(
	id INT GENERATED ALWAYS AS IDENTITY,
	candidate_id INT NOT NULL,
	position_id INT NOT NULL,

	CONSTRAINT FK_Candidate
		FOREIGN KEY(candidate_id)
		REFERENCES candidates(id),
	
	CONSTRAINT FK_Position
		FOREIGN KEY(position_id)
		REFERENCES positions(id)
);

CREATE TABLE interviews(
	id INT GENERATED ALWAYS AS IDENTITY,
	date TIMESTAMP NOT NULL,
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

