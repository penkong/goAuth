INSERT INTO industries
  (industry, how_clean)
VALUES 
  ("software_saas", 1),
  ("software_paas", 1),
  ("software_xaas", 1),
  ("software_blog", 1),
  ("software_image",1),
  ("software_ecommerce", 3);

INSERT INTO statuses
  (status)
VALUES
  ("awaiting"),
  ("temp"),
  ("activated"),
  ("freezed"),
  ("in_active"),
  ("banned"),
  ("deleted"),
  ("verified");

INSERT INTO 
  "roles" ("role") 
VALUES 
  ("viewer"),
  ("test"),
  ("temp"),
  ("helper"),
  ("vendor"),
  ("controller"),
  ("supervisor"),
  ("blocker"),
  ("organizer"),
  ("investigator"),
  ("super_admin"),
  ("admin"),
  ("boss"),
  ("owner"),
  ("investor"),

  ("simple_user"),
  ("bronze_user"),
  ("silver_user"),
  ("gold_user"),
  ("diamond_user"),
  ("blogger_user"),

  ("simple_student"),
  ("bronze_student"),
  ("silver_student"),
  ("gold_student"),
  ("diamond_student"),
  ("assistance"),
  ("teacher"),
  ("master"),
  ("guru");


INSERT INTO apps
  (app, app_base_os, desktop, web, paid, industry_id)
VALUES 
  ("the_o_i","linux",false, true, false, 1),
  ("m_on", "linux", true, true, false, 2),
  ("penbeh", "linux", false, true, false, 4);
