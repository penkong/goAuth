INSERT INTO industries(industry, how_clean)
VALUES 
  ('sofware_provider', 1),
  ('sofware_development', 1),
  ('saas', 1),
  ('paas', 1),
  ('xaas', 1),
  ('blog', 1),
  ('image',1),
  ('ecommerce', 3);

INSERT INTO statuses(status)
VALUES 
  ('temp'),
  ('activated'),
  ('freezed'),
  ('in_active'),
  ('banned'),
  ('deleted'),
  ('verified');

-- --

INSERT INTO roles(role) 
VALUES 
  ('viewer'),
  ('test'),
  ('temp'),
  ('simple_user'),
  ('helper'),
  ('affiliator'),
  ('vendor'),
  ('client'),
  ('supervisor'),
  ('organizer'),
  ('inspector'),
  ('manager'),
  ('super_admin'),
  ('admin'),
  ('boss'),
  ('owner'),
  ('investor'),
  ('bronze_user'),
  ('silver_user'),
  ('gold_user'),
  ('diamond_user'),
  ('blogger_user'),
  ('simple_student'),
  ('bronze_student'),
  ('silver_student'),
  ('gold_student'),
  ('diamond_student'),
  ('assistance'),
  ('teacher'),
  ('master'),
  ('guru');

-- 

INSERT INTO positions(department, position)
VALUES 
  ('top_managment', 'chairman'),
  ('top_managment', 'vice_president'),
  ('top_managment', 'board_of_directors'),
  ('top_managment', 'chief_executive_officer'),
  ('top_managment', 'chief_financial_officer'),

  ('middle_managment', 'senior_general_manager'),  
  ('middle_managment', 'assistance_general_manager'),
  ('middle_managment', 'senior_regional_manager'),
  ('middle_managment', 'assistance_regional_manager'),

  ('first_line_managment', 'office_manager'),
  ('first_line_managment', 'supervisor'),
  ('first_line_managment', 'financial'),

  ('first_line_managment', 'front_desk'),
  ('first_line_managment', 'system_architect'),
  ('first_line_managment', 'cheif_technology_officer'),

  ('first_line_managment', 'managment_information_system_director'),
  ('first_line_managment', 'database_officer'),
  ('first_line_managment', 'team_leader'),

  ('first_line_managment', 'project_manager'),
  ('first_line_managment', 'analysis_officer'),
  ('first_line_managment', 'information_technology_officer'),

  ('first_line_managment', 'network_managment_officer'),
  ('first_line_managment', 'change_managment_officer'),
  ('first_line_managment', 'quality_assurance_officer'),

  ('first_line_managment', 'testing_officer'),
  ('first_line_managment', 'design_officer'),

  ('second_line_managment', 'project_project_manager'),
  ('second_line_managment', 'hardware_info_system_manager'),
  ('second_line_managment', 'information_technology_manager'),
  ('second_line_managment', 'network_manager'),
  ('second_line_managment', 'change_managment_manager'),
  ('second_line_managment', 'analysis_manager'),

  ('accounting', 'executive'),
  ('accounting', 'assistance'),
  ('accounting', 'budget_maker'),

  ('advertisment', 'supervisor'),
  ('advertisment', 'creative_service'),
  ('advertisment', 'production'),

  ('human_resources','hr_manager'),
  ('human_resources','hr_internal'),
  ('human_resources','hr_external'),
  ('human_resources','hr_assistance'),

  ('marketing', 'strategy'),
  ('marketing', 'researcher'),
  ('marketing', 'analyst'),
  ('marketing', 'promotion'),
  ('marketing', 'budget_control'),

  ('customer_service', 'supervisor'),
  ('customer_service', 'consulting'),
  ('customer_service', 'complaining'),

  ('research_and_development', 'head_R&D'),
  ('research_and_development', 'assistance_R&D'),

  ('planning', 'head_planner'),
  ('planning', 'planner'),

  ('analysis','head_analyst'),
  ('analysis','analyst'),

  ('content', 'head_content'),
  ('content', 'content_creator'),
  ('content', 'copywriter'),

  ('design', 'head_designer'),
  ('design', 'UI_designer'),
  ('design', 'UX_designer'),

  ('implementation_maintenance', 'senior_software_engineer'),
  ('implementation_maintenance', 'software_engineer'),
  ('implementation_maintenance', 'junior_software_engineer'),

  ('implementation_maintenance', 'senior_DBA'),
  ('implementation_maintenance', 'DBA'),
  ('implementation_maintenance', 'junior_DBA'),

  ('implementation_maintenance', 'senior_backend_engineer'),
  ('implementation_maintenance', 'backend_engineer'),
  ('implementation_maintenance', 'junior_backend_engineer'),

  ('implementation_maintenance', 'senior_frontend_engineer'),
  ('implementation_maintenance', 'frontend_engineer'),
  ('implementation_maintenance', 'junior_frontend_engineer'),

  ('implementation_maintenance', 'senior_tester'),
  ('implementation_maintenance', 'tester'),
  ('implementation_maintenance', 'junior_tester'),

  ('implementation_maintenance', 'senior_data_engineer'),
  ('implementation_maintenance', 'data_engineer'),
  ('implementation_maintenance', 'junior_data_engineer'),

  ('implementation_maintenance', 'senior_architec'),
  ('implementation_maintenance', 'architec'),
  ('implementation_maintenance', 'junior_architec'),

  ('implementation_maintenance', 'senior_fullstack_engineer'),
  ('implementation_maintenance', 'fullstack_engineer'),
  ('implementation_maintenance', 'junior_fullstack_engineer'),

  ('implementation_maintenance', 'senior_game_engineer'),
  ('implementation_maintenance', 'game_engineer'),
  ('implementation_maintenance', 'junior_game_engineer'),

  ('implementation_maintenance', 'x_developer'),

  ('logistic_supplies', 'head_logistic'),
  ('logistic_supplies', 'agentlogistic'),

  ('shipment', 'head_shipment'),
  ('shipment', 'agent_shipment');
  
--

INSERT INTO apps(app, app_base_os, desktop, web, paid, industry_id)
VALUES 
  ('the_o_i','linux',false, true, false, 3),
  ('m_on', 'linux', true, true, false, 4),
  ('penbeh', 'linux', false, true, false, 6);

--

INSERT INTO teams(team, industry_id)
VALUES 
  ('viking_cc', 2);
--

INSERT INTO companies(company, bio, country, region, ceo, address, how_clean, industry_id)
VALUES 
  ('the_cc', 'the company that will do best things for the world', 'sweden','europe', 'mazdak Nazemi','no 34, Solna, Stockholm',1,1);

-- 

INSERT INTO teams_apps_companies(team_id, app_id, company_id) 
VALUES 
  (1,1,1),
  (1,2,1),
  (1,3,1);