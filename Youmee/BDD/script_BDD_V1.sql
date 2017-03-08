------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: user
------------------------------------------------------------
CREATE TABLE public.user(
	id_user         SERIAL NOT NULL ,
	registerDate    DATE   ,
	pseudo          VARCHAR (25)  ,
	name            VARCHAR (25)  ,
	surname         VARCHAR (25)  ,
	birthday        DATE   ,
	num_tel         VARCHAR (25) NOT NULL UNIQUE,
	num_tel_private INT   ,
	description     VARCHAR (200)  ,
	id_position     INT   ,
	id_network      INT  NOT NULL ,
	CONSTRAINT prk_constraint_user PRIMARY KEY (id_user)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: hobby
------------------------------------------------------------
CREATE TABLE public.hobby(
	id_hobbies    SERIAL NOT NULL ,
	hobbies_title VARCHAR (30)  ,
	CONSTRAINT prk_constraint_hobby PRIMARY KEY (id_hobbies)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: position
------------------------------------------------------------
CREATE TABLE public.position(
	id_position SERIAL NOT NULL ,
	longitude   DOUBLE PRECISION   ,
	altitude    DOUBLE PRECISION   ,
	CONSTRAINT prk_constraint_position PRIMARY KEY (id_position)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: network
------------------------------------------------------------
CREATE TABLE public.network(
	id_network   SERIAL NOT NULL ,
	id_twitter   INT  NOT NULL ,
	id_snapchat  INT  NOT NULL ,
	id_whatsapp  INT  NOT NULL ,
	id_instagram INT  NOT NULL ,
	id_user      INT   ,
	CONSTRAINT prk_constraint_network PRIMARY KEY (id_network)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: facebook
------------------------------------------------------------
CREATE TABLE public.facebook(
	id_facebook SERIAL NOT NULL ,
	pseudo      VARCHAR (25) NOT NULL UNIQUE,
	private     INT  NOT NULL ,
	id_network  INT  NOT NULL ,
	CONSTRAINT prk_constraint_facebook PRIMARY KEY (id_facebook)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: instagram
------------------------------------------------------------
CREATE TABLE public.instagram(
	id_instagram     SERIAL NOT NULL ,
	instagram_pseudo VARCHAR (50) NOT NULL UNIQUE,
	private          INT  NOT NULL ,
	id_network       INT  NOT NULL ,
	CONSTRAINT prk_constraint_instagram PRIMARY KEY (id_instagram)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: twitter
------------------------------------------------------------
CREATE TABLE public.twitter(
	id_twitter     SERIAL NOT NULL ,
	twitter_pseudo VARCHAR (50) NOT NULL UNIQUE,
	private        INT  NOT NULL ,
	id_network     INT  NOT NULL ,
	CONSTRAINT prk_constraint_twitter PRIMARY KEY (id_twitter)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: snapchat
------------------------------------------------------------
CREATE TABLE public.snapchat(
	id_snapchat     SERIAL NOT NULL ,
	snapchat_pseudo VARCHAR (50) NOT NULL UNIQUE,
	private         INT  NOT NULL ,
	id_network      INT  NOT NULL ,
	CONSTRAINT prk_constraint_snapchat PRIMARY KEY (id_snapchat)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: whatsapp
------------------------------------------------------------
CREATE TABLE public.whatsapp(
	id_whatsapp     SERIAL NOT NULL ,
	whatsapp_pseudo VARCHAR (50) NOT NULL UNIQUE,
	private         INT  NOT NULL ,
	id_network      INT  NOT NULL ,
	CONSTRAINT prk_constraint_whatsapp PRIMARY KEY (id_whatsapp)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: user_hobbies
------------------------------------------------------------
CREATE TABLE public.user_hobbies(
	id_user    INT  NOT NULL ,
	id_hobbies INT  NOT NULL ,
	CONSTRAINT prk_constraint_user_hobbies PRIMARY KEY (id_user,id_hobbies)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: relationship
------------------------------------------------------------
CREATE TABLE public.relationship(
	status         INTEGER  NOT NULL ,
	action_user_id INT  NOT NULL ,
	account_asked  INTEGER  NOT NULL ,
	id_user        INT  NOT NULL ,
	id_user_1      INT  NOT NULL ,
	CONSTRAINT prk_constraint_relationship PRIMARY KEY (id_user,id_user_1)
)WITHOUT OIDS;



ALTER TABLE public.user ADD CONSTRAINT FK_user_id_position FOREIGN KEY (id_position) REFERENCES public.position(id_position);
ALTER TABLE public.user ADD CONSTRAINT FK_user_id_network FOREIGN KEY (id_network) REFERENCES public.network(id_network);
ALTER TABLE public.network ADD CONSTRAINT FK_network_id_twitter FOREIGN KEY (id_twitter) REFERENCES public.twitter(id_twitter);
ALTER TABLE public.network ADD CONSTRAINT FK_network_id_snapchat FOREIGN KEY (id_snapchat) REFERENCES public.snapchat(id_snapchat);
ALTER TABLE public.network ADD CONSTRAINT FK_network_id_whatsapp FOREIGN KEY (id_whatsapp) REFERENCES public.whatsapp(id_whatsapp);
ALTER TABLE public.network ADD CONSTRAINT FK_network_id_instagram FOREIGN KEY (id_instagram) REFERENCES public.instagram(id_instagram);
ALTER TABLE public.network ADD CONSTRAINT FK_network_id_user FOREIGN KEY (id_user) REFERENCES public.user(id_user);
ALTER TABLE public.facebook ADD CONSTRAINT FK_facebook_id_network FOREIGN KEY (id_network) REFERENCES public.network(id_network);
ALTER TABLE public.instagram ADD CONSTRAINT FK_instagram_id_network FOREIGN KEY (id_network) REFERENCES public.network(id_network);
ALTER TABLE public.twitter ADD CONSTRAINT FK_twitter_id_network FOREIGN KEY (id_network) REFERENCES public.network(id_network);
ALTER TABLE public.snapchat ADD CONSTRAINT FK_snapchat_id_network FOREIGN KEY (id_network) REFERENCES public.network(id_network);
ALTER TABLE public.whatsapp ADD CONSTRAINT FK_whatsapp_id_network FOREIGN KEY (id_network) REFERENCES public.network(id_network);
ALTER TABLE public.user_hobbies ADD CONSTRAINT FK_user_hobbies_id_user FOREIGN KEY (id_user) REFERENCES public.user(id_user);
ALTER TABLE public.user_hobbies ADD CONSTRAINT FK_user_hobbies_id_hobbies FOREIGN KEY (id_hobbies) REFERENCES public.hobby(id_hobbies);
ALTER TABLE public.relationship ADD CONSTRAINT FK_relationship_id_user FOREIGN KEY (id_user) REFERENCES public.user(id_user);
ALTER TABLE public.relationship ADD CONSTRAINT FK_relationship_id_user_1 FOREIGN KEY (id_user_1) REFERENCES public.user(id_user);
