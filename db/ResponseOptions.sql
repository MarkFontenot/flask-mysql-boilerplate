CREATE TABLE mytable(
   question_id INTEGER  NOT NULL PRIMARY KEY 
  ,option_text VARCHAR(6) NOT NULL
  ,correct     VARCHAR(5) NOT NULL
    PRIMARY KEY (question_id, option_text),

    FOREIGN KEY (question_id)
        REFERENCES Question (id)
);
INSERT INTO mytable(question_id,option_text,correct) VALUES (57,'vbthom','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (230,'dgnyhu','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (46,'wespje','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (201,'mfmbro','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (78,'dbwkwh','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (120,'jrfmcw','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (95,'ieaqcc','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (238,'jiqvyb','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (139,'xuewhp','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (59,'mxkysr','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (52,'jwteqy','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (15,'fdjerl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (54,'oaajmp','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (60,'fzxpwz','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (1,'nwbjhh','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (217,'hdwhtm','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (133,'imzbvf','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (34,'vfrben','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (66,'rqpxjp','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (20,'gvjrhq','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (13,'ahjpel','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (179,'cmnelv','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (58,'bofnan','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (299,'eyzawu','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (137,'yczbyl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (37,'xueqzf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (238,'ekckwq','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (109,'dkehjy','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (84,'nvftst','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (127,'ydhzyy','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (12,'vrwtrv','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (50,'pyiucf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (117,'shssdb','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (114,'xwkuhk','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (95,'vuoccl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (75,'hawqaj','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (219,'japorj','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (268,'zzeuaa','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (136,'wmmhfb','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (107,'ixiuge','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (22,'lmwxik','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (177,'vlwiwc','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (57,'fleceb','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (84,'idjxan','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (217,'rqbolz','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (147,'wfvigc','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (56,'norvjw','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (117,'cxrfdq','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (142,'lkhxtx','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (161,'pptvxu','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (17,'ktwdzd','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (95,'yrrocx','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (153,'cwjxgp','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (286,'ndhkya','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (45,'mbnyqi','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (108,'muphkc','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (250,'vyqoug','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (133,'rzodso','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (36,'wzvmja','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (290,'xodice','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (254,'xvegff','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (61,'zglqlk','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (212,'yiilnz','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (98,'gnsmdr','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (83,'elbfze','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (33,'ysfrzm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (55,'ghkcrb','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (153,'whvkxt','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (43,'myiqwc','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (176,'xfgbdu','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (157,'bwlglr','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (58,'nhitfe','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (62,'fthdxk','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (192,'qyyouv','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (132,'asfpyu','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (286,'plfaud','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (237,'xszenb','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (254,'hxrmqp','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (16,'stmthm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (250,'sbawwv','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (263,'vnzyzl','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (41,'cxtoks','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (295,'osusra','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (205,'xibczv','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (190,'xzdqja','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (195,'rxzmtb','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (271,'dtkyyc','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (136,'xoditn','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (300,'itsqvi','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (79,'rptpao','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (53,'mpmhin','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (30,'ybckkc','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (79,'xbkkxf','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (137,'muwtti','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (197,'esxjen','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (81,'rjuwfy','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (150,'kmkyxt','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (210,'wwrpkh','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (225,'euckbp','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (116,'hkjdou','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (265,'csfyci','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (114,'jeeqrc','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (63,'mxvcww','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (62,'kovmok','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (15,'saklnp','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (66,'dresgh','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (162,'cotxnc','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (120,'oubbxn','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (36,'okgciu','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (185,'efgezf','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (250,'fmbzoz','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (106,'gzidmx','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (137,'gjccmk','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (169,'vyywzm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (175,'ugpxvf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (51,'yrqpnt','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (179,'nouwko','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (6,'azewjp','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (39,'wklsbz','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (79,'trvyoj','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (263,'ydoale','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (214,'pivjio','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (1,'yojogd','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (10,'mzkwal','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (66,'mpivyf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (245,'lzgfbm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (278,'lzlkpc','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (140,'xsnymn','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (264,'jinczm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (7,'ygkxbm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (199,'djelcl','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (204,'mvvofz','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (267,'sqdoyu','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (126,'wtcwby','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (83,'eutlwy','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (260,'cslxto','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (257,'apwoar','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (79,'vqanul','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (249,'kqfzsu','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (190,'totiow','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (117,'xekvpj','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (104,'nzvvlb','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (204,'yamccp','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (209,'xtniak','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (269,'uvcrwx','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (286,'nupvoe','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (287,'hkeulm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (106,'tbfjls','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (150,'brgwei','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (146,'yrxjvs','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (38,'vymhwx','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (289,'aovpzd','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (194,'zcvdsz','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (25,'werlsl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (288,'nabnmv','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (123,'xartjk','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (70,'oadygp','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (187,'qzvlip','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (8,'gqmvsh','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (201,'vtaunk','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (118,'nibmoo','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (253,'affdsg','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (133,'bfrqbw','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (106,'omxzgu','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (22,'udtjpu','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (266,'wwmwci','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (186,'dxmlkt','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (42,'zfuvrp','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (268,'ktekyz','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (277,'ravlgx','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (107,'ztqgvf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (257,'yatffy','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (97,'ujhkbd','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (22,'ttxvib','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (10,'jvlvct','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (71,'wuucde','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (161,'fvqybi','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (252,'dhvfef','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (119,'gdilui','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (214,'mqffrh','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (286,'rkviyd','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (251,'fetfas','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (62,'gdtjyn','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (211,'idcmpx','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (172,'nkumcj','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (225,'kzxxxq','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (193,'ppdzej','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (112,'vtgbny','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (205,'virhch','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (222,'aovblt','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (242,'biibhk','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (108,'hsaaec','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (42,'gcyuta','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (256,'jbupci','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (151,'iidsyk','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (40,'pcemjj','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (133,'lqevlk','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (292,'qfllwx','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (5,'twyvcx','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (93,'pltpoo','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (169,'bwutfm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (2,'dybajg','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (38,'ozmqer','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (83,'ybckua','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (30,'krltns','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (185,'xsftvm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (257,'sadikg','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (143,'ymyjmr','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (49,'vnsiyl','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (29,'eglwxm','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (180,'zfxucu','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (189,'mufrmj','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (72,'icakth','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (86,'ynotzm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (32,'rcccdr','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (150,'qsecgf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (193,'fcyupy','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (226,'bsqhvh','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (288,'xkgpsz','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (61,'sduayr','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (277,'nzhrlj','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (52,'pfvgdw','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (197,'wtftbo','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (204,'fhgutu','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (263,'acjbsh','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (119,'jjhwfd','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (286,'wssaew','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (90,'eimrrp','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (182,'sslsge','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (244,'nygzil','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (106,'yredpl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (19,'zygafl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (206,'ouould','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (211,'bvrxkf','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (85,'xedelt','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (296,'nyzrze','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (210,'lfctir','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (192,'tguiuy','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (41,'qszuqz','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (295,'ffeksx','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (104,'tjlxdc','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (71,'mjzwdn','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (178,'ruvzrv','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (221,'bbmuai','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (11,'vnqgsc','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (43,'siedld','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (50,'yxdpph','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (37,'eaoxhq','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (168,'wxwzwi','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (251,'uodiba','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (284,'kuefro','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (105,'kseoha','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (298,'cejgyl','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (218,'qukyyv','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (31,'iwqrgd','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (217,'rtyjza','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (24,'lblupn','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (19,'ypfcmf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (3,'xshrpu','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (14,'krpmia','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (51,'utcxdd','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (16,'dckvjl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (220,'skdjrv','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (134,'pnutet','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (81,'izgsps','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (117,'rzzgdh','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (156,'blwynw','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (173,'iypyof','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (151,'exwtgn','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (277,'tnpftm','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (36,'keiscc','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (151,'uebpsj','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (122,'nvqcpx','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (247,'quopfo','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (13,'embdls','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (33,'xlgsdg','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (298,'ozeaql','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (176,'abhhvf','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (171,'cmwulr','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (118,'xphxje','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (230,'fwlqpi','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (189,'wksuzz','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (165,'upzato','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (120,'ahfeor','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (186,'wclrvl','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (93,'imeeat','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (41,'hfbdre','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (271,'etcfkr','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (169,'mltrzg','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (40,'uskgvy','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (149,'bjqbar','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (231,'lvxfwy','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (27,'otlnxv','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (83,'gbazkb','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (150,'glukff','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (190,'qootcs','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (183,'elhbgk','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (171,'yobtoi','false');
INSERT INTO mytable(question_id,option_text,correct) VALUES (262,'urwtde','true');
INSERT INTO mytable(question_id,option_text,correct) VALUES (58,'kkycte','false');
