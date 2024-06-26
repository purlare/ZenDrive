USE [ZenDrive]
GO
/****** Object:  Table [dbo].[Заявки_на_тест_драйв]    Script Date: 27.03.2024 9:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки_на_тест_драйв](
	[Код_заявки] [int] IDENTITY(1,1) NOT NULL,
	[Код_электромобиля] [int] NOT NULL,
	[имя] [varchar](255) NOT NULL,
	[e_mail] [varchar](255) NULL,
	[телефон] [varchar](20) NOT NULL,
	[дата_заявки] [date] NOT NULL,
 CONSTRAINT [PK__Заявки_н__D51396584CF06E21] PRIMARY KEY CLUSTERED 
(
	[Код_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Кузов]    Script Date: 27.03.2024 9:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Кузов](
	[Код_кузова] [int] IDENTITY(1,1) NOT NULL,
	[Код_электромобиля] [int] NOT NULL,
	[длина] [int] NOT NULL,
	[ширина] [int] NOT NULL,
	[высота] [int] NOT NULL,
	[колесная_база] [int] NOT NULL,
	[шины] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Кузов__B426D197B22112C8] PRIMARY KEY CLUSTERED 
(
	[Код_кузова] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Характеристики]    Script Date: 27.03.2024 9:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Характеристики](
	[Код_характеристики] [int] IDENTITY(1,1) NOT NULL,
	[Код_электромобиля] [int] NOT NULL,
	[тип_двигателя] [varchar](50) NOT NULL,
	[мощность_электромотора] [int] NOT NULL,
	[запас_хода] [int] NOT NULL,
	[емкость_батареи] [int] NOT NULL,
	[привод] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Характер__AB27A303F03E976C] PRIMARY KEY CLUSTERED 
(
	[Код_характеристики] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Электромобили]    Script Date: 27.03.2024 9:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Электромобили](
	[Код_электромобиля] [int] IDENTITY(1,1) NOT NULL,
	[Название] [varchar](255) NOT NULL,
	[Наличие] [varchar](10) NOT NULL,
	[Цена] [int] NOT NULL,
	[Фото1] [varchar](50) NULL,
	[Фото2] [varchar](50) NULL,
 CONSTRAINT [PK__Электром__8DAF4B4BF4E499BB] PRIMARY KEY CLUSTERED 
(
	[Код_электромобиля] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заявки_на_тест_драйв] ON 

INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (1, 3, N'Валентин П.', N'pavlov1987@gmail.com ', N'89054566783', CAST(N'2024-01-25' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (2, 8, N'Игорь К.', N'florenj@yahoo.com ', N'89678360387', CAST(N'2024-02-04' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (3, 10, N'Дмитрий Н.', N'dimanosov@mail.ru ', N'89386728517', CAST(N'2024-01-23' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (4, 1, N'Мария Г.', N'mir1992@gmail.com  ', N'89567158238', CAST(N'2024-02-08' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (5, 4, N'Анна С.', N'anna2587@gmail.com', N'89098761234', CAST(N'2024-03-09' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (6, 7, N'Алексей П.', N'alex@mail.ru', N'89651237890', CAST(N'2024-01-14' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (7, 5, N'Елена И.', N'zzlena@icloud.com', N'89034561278', CAST(N'2024-02-27' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (8, 9, N'Сергей М.', N'uios@gmail.com', N'89675432109', CAST(N'2024-01-31' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (9, 6, N'Ольга В.', N'ivolga@yahoo.com', N'89227894561', CAST(N'2024-02-18' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (10, 3, N'Артем Р.', N'artem1979@mail.ru', N'89451236780', CAST(N'2024-03-07' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (26, 4, N'Виктория П.', N'vict@mail.ru', N'89038647523', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (27, 10, N'Михаил Р.', N'vdimi792@yahoo.com', N'89797534682', CAST(N'2024-04-11' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (28, 4, N'Александр К.', N'sasss@icloud.com', N'89356742786', CAST(N'2024-01-10' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (29, 1, N'Екатерина Г.', N'volkova97@gmail.com', N'89730567483', CAST(N'2024-03-31' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (30, 3, N'Тимур А.', N'nundem@gmail.com', N'89015675633', CAST(N'2024-05-18' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (31, 5, N'Николай П.', N'kolyapobedinskiy@yandex.ru', N'86773571942', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (32, 7, N'Марина Л.', N'tearp65@gmail.com', N'89358725347', CAST(N'2024-06-14' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (33, 1, N'Петр П.', N'braveheart@inbox.ru', N'89748357656', CAST(N'2024-03-17' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (34, 8, N'Василий К.', N'lonelyy333@bk.ru', N'89557342989', CAST(N'2024-06-29' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (35, 6, N'Никита З.', N'zolotov1998@gmail.com', N'89975864890', CAST(N'2024-05-10' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (36, 9, N'Маргарита Е.', N'memes@inbox.ru', N'89926578648', CAST(N'2024-01-05' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (37, 8, N'Григорий А.', N'rostovgrig@icloud.com', N'89268465784', CAST(N'2024-02-08' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (38, 4, N'Иван Щ.', N'shab1389@gmail.com', N'89936784544', CAST(N'2024-05-19' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (39, 2, N'Ян В.', N'gordiev66@yandex.ru', N'89367467867', CAST(N'2024-03-09' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (40, 9, N'Константин Ж.', N'kostyajis@inbox.ru', N'89577645646', CAST(N'2024-04-27' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (41, 2, N'Артем Б.', N'temaoeg45@gmail.com', N'89567349835', CAST(N'2024-05-18' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (42, 6, N'Денис М.', N'volssk@yahoo.com', N'89298379325', CAST(N'2024-10-12' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (43, 10, N'Лариса Х.', N'haritonoval@gmail.com', N'89247212945', CAST(N'2024-07-06' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (44, 5, N'Регина С.', N'gudn@mail.ru', N'89230473287', CAST(N'2024-04-13' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (45, 8, N'Сергей О.', N'ivolga77@inbox.ru', N'88794323423', CAST(N'2024-05-19' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (46, 3, N'Петр Ч.', N'chapov1984@gmail.com', N'89305435347', CAST(N'2024-02-09' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (47, 9, N'Анастасия В.', N'luchhik@yandex.ru', N'89034578947', CAST(N'2024-09-15' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (48, 6, N'Леонид И.', N'eon8972@gmail.com', N'89045678495', CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (49, 7, N'Павел Т.', N'inforpavl@yandex.ru', N'80948645758', CAST(N'2024-10-26' AS Date))
INSERT [dbo].[Заявки_на_тест_драйв] ([Код_заявки], [Код_электромобиля], [имя], [e_mail], [телефон], [дата_заявки]) VALUES (52, 2, N'Григорий Б.', N'grigg1974@gmail.com', N'89047497382', CAST(N'2024-04-21' AS Date))
SET IDENTITY_INSERT [dbo].[Заявки_на_тест_драйв] OFF
GO
SET IDENTITY_INSERT [dbo].[Кузов] ON 

INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (1, 1, 5036, 2018, 1439, 3150, N'R22')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (2, 2, 5040, 1910, 1569, 2990, N'R18')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (3, 3, 5200, 1852, 1800, 3100, N'265/45 R21')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (4, 4, 5103, 2019, 1636, 3019, N'R21')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (5, 5, 5200, 2062, 1618, 3150, N'R22')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (6, 6, 4891, 1852, 1679, 2965, N'R19-R21')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (7, 7, 4750, 1920, 1620, 2890, N'R18')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (8, 8, 4694, 1849, 1443, 2875, N'R18')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (9, 9, 5300, 1111, 1111, 3050, N'R22')
INSERT [dbo].[Кузов] ([Код_кузова], [Код_электромобиля], [длина], [ширина], [высота], [колесная_база], [шины]) VALUES (10, 10, 4970, 1999, 1560, 3005, N'R21')
SET IDENTITY_INSERT [dbo].[Кузов] OFF
GO
SET IDENTITY_INSERT [dbo].[Характеристики] ON 

INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (1, 1, N'Электрический', 672, 705, 120, N'4WD')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (2, 2, N'Электрический', 136, 431, 54, N'Передний привод')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (3, 3, N'Гибрид', 449, 1200, 45, N'Полный')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (4, 4, N'Электрический', 918, 560, 112, N'4WD')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (5, 5, N'Электрический', 598, 550, 97, N'4WD')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (6, 6, N'Электрический', 313, 510, 83, N'4WD')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (7, 7, N'Электрический', 485, 566, 77, N'4WD')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (8, 8, N'Электрический', 485, 605, 76, N'Задний привод')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (9, 9, N'Электрический', 1100, 600, 100, N'4WD')
INSERT [dbo].[Характеристики] ([Код_характеристики], [Код_электромобиля], [тип_двигателя], [мощность_электромотора], [запас_хода], [емкость_батареи], [привод]) VALUES (10, 10, N'Электрический', 544, 606, 100, N'4WD')
SET IDENTITY_INSERT [dbo].[Характеристики] OFF
GO
SET IDENTITY_INSERT [dbo].[Электромобили] ON 

INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (1, N'HIPHI  Z', N'Под заказ', 11600000, N'Pictures\1HIPHI Z.jpg', N'Pictures\2HIPHI Z.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (2, N'HONGQI E-QM 5 ', N'Да', 4550000, N'Pictures\1HONGQI E QM 5.jpg', N'Pictures\2HONGQI E QM 5.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (3, N'LI L9 ', N'Да', 7850000, N'Pictures\1Li L9.jpg', N'Pictures\2Li L9.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (4, N'LOTUS ELETRE', N'Под заказ', 17100000, N'Pictures\1LOTUS ELETRE.jpg', N'Pictures\2LOTUS ELETRE.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (5, N'HIPHI X ', N'Да', 13850000, N'Pictures\1HIPHI X.jpg', N'Pictures\2HIPHI X.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (6, N'VOLKSWAGEN ID.6 X', N'Да', 5725000, N'Pictures\1VOLKSWAGEN ID.6 X.jpg', N'Pictures\2VOLKSWAGEN ID.6 X.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (7, N'TESLA MODEL Y', N'Под заказ', 6100000, N'Pictures\1TESLA MODEL Y.jpg', N'Pictures\2TESLA MODEL Y.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (8, N'TESLA MODEL 3', N'Под заказ', 6100000, N'Pictures\1TESLA MODEL 3.jpg', N'Pictures\2TESLA MODEL 3.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (9, N'YANGWANG U8', N'Под заказ', 19350000, N'Pictures\1YANGWANG U8.jpg', N'Pictures\2YANGWANG U8.jpg')
INSERT [dbo].[Электромобили] ([Код_электромобиля], [Название], [Наличие], [Цена], [Фото1], [Фото2]) VALUES (10, N'ZEEKR 001', N'Да', 6200000, N'Pictures\1ZEEKR 001.jpg', N'Pictures\2ZEEKR 001.jpg')
SET IDENTITY_INSERT [dbo].[Электромобили] OFF
GO
ALTER TABLE [dbo].[Электромобили] ADD  CONSTRAINT [DF__Электромоб__Цена__38996AB5]  DEFAULT ((0)) FOR [Цена]
GO
ALTER TABLE [dbo].[Заявки_на_тест_драйв]  WITH CHECK ADD  CONSTRAINT [FK__Заявки_на__Код_э__47DBAE45] FOREIGN KEY([Код_электромобиля])
REFERENCES [dbo].[Электромобили] ([Код_электромобиля])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заявки_на_тест_драйв] CHECK CONSTRAINT [FK__Заявки_на__Код_э__47DBAE45]
GO
ALTER TABLE [dbo].[Кузов]  WITH CHECK ADD  CONSTRAINT [FK__Кузов__Код_элект__412EB0B6] FOREIGN KEY([Код_электромобиля])
REFERENCES [dbo].[Электромобили] ([Код_электромобиля])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Кузов] CHECK CONSTRAINT [FK__Кузов__Код_элект__412EB0B6]
GO
ALTER TABLE [dbo].[Характеристики]  WITH CHECK ADD  CONSTRAINT [FK__Характери__Код_э__3B75D760] FOREIGN KEY([Код_электромобиля])
REFERENCES [dbo].[Электромобили] ([Код_электромобиля])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Характеристики] CHECK CONSTRAINT [FK__Характери__Код_э__3B75D760]
GO
ALTER TABLE [dbo].[Кузов]  WITH CHECK ADD  CONSTRAINT [CK__Кузов__высота__440B1D61] CHECK  (([высота]>(0)))
GO
ALTER TABLE [dbo].[Кузов] CHECK CONSTRAINT [CK__Кузов__высота__440B1D61]
GO
ALTER TABLE [dbo].[Кузов]  WITH CHECK ADD  CONSTRAINT [CK__Кузов__длина__4222D4EF] CHECK  (([длина]>(0)))
GO
ALTER TABLE [dbo].[Кузов] CHECK CONSTRAINT [CK__Кузов__длина__4222D4EF]
GO
ALTER TABLE [dbo].[Кузов]  WITH CHECK ADD  CONSTRAINT [CK__Кузов__колесная___44FF419A] CHECK  (([колесная_база]>(0)))
GO
ALTER TABLE [dbo].[Кузов] CHECK CONSTRAINT [CK__Кузов__колесная___44FF419A]
GO
ALTER TABLE [dbo].[Кузов]  WITH CHECK ADD  CONSTRAINT [CK__Кузов__ширина__4316F928] CHECK  (([ширина]>(0)))
GO
ALTER TABLE [dbo].[Кузов] CHECK CONSTRAINT [CK__Кузов__ширина__4316F928]
GO
ALTER TABLE [dbo].[Характеристики]  WITH CHECK ADD  CONSTRAINT [CK__Характери__емкос__3E52440B] CHECK  (([емкость_батареи]>(0)))
GO
ALTER TABLE [dbo].[Характеристики] CHECK CONSTRAINT [CK__Характери__емкос__3E52440B]
GO
ALTER TABLE [dbo].[Характеристики]  WITH CHECK ADD  CONSTRAINT [CK__Характери__запас__3D5E1FD2] CHECK  (([запас_хода]>(0)))
GO
ALTER TABLE [dbo].[Характеристики] CHECK CONSTRAINT [CK__Характери__запас__3D5E1FD2]
GO
ALTER TABLE [dbo].[Характеристики]  WITH CHECK ADD  CONSTRAINT [CK__Характери__мощно__3C69FB99] CHECK  (([мощность_электромотора]>(0)))
GO
ALTER TABLE [dbo].[Характеристики] CHECK CONSTRAINT [CK__Характери__мощно__3C69FB99]
GO
ALTER TABLE [dbo].[Электромобили]  WITH CHECK ADD  CONSTRAINT [CHK_Электромобили_Наличие] CHECK  (([Наличие]='Под заказ' OR [Наличие]='Нет' OR [Наличие]='Да'))
GO
ALTER TABLE [dbo].[Электромобили] CHECK CONSTRAINT [CHK_Электромобили_Наличие]
GO
ALTER TABLE [dbo].[Электромобили]  WITH CHECK ADD  CONSTRAINT [CK__Электромо__Налич__37A5467C] CHECK  (([Наличие]='Под заказ' OR [Наличие]='Нет' OR [Наличие]='Да'))
GO
ALTER TABLE [dbo].[Электромобили] CHECK CONSTRAINT [CK__Электромо__Налич__37A5467C]
GO
ALTER TABLE [dbo].[Электромобили]  WITH CHECK ADD  CONSTRAINT [CK_Наличие] CHECK  (([Наличие]='Под заказ' OR [Наличие]='Да'))
GO
ALTER TABLE [dbo].[Электромобили] CHECK CONSTRAINT [CK_Наличие]
GO
