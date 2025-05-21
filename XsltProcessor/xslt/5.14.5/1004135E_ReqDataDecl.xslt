<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rdd="urn:customs.ru:Information:ExchangeDocuments:ReqDataDecl:5.14.5" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <!-- Шаблон для типа ReqDataDeclType -->
<xsl:template match="rdd:ReqDataDecl">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
					p{text-indent: 20px; margin: 0;}
					
					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="rdd:DocKind=1">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="50%">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="50%">
										<xsl:value-of select="rdd:DeclName/cat_ru:OrganizationName"/>
										<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
											<xsl:value-of select="cat_ru:ShortName"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="border-bottom: 2px solid black;text-indent:20px;">
										<xsl:text>В соответствии с пунктом 4 статьи 325 Таможенного кодекса Евразийского экономического союза уведомляем, что в ходе проверки </xsl:text>
										<b>
											<xsl:text>декларации на товары № </xsl:text>
											<u>
												<xsl:apply-templates select="rdd:RequestInfo/rdd:GTDID"/>
											</u>
										</b>
										<xsl:text> и документов и сведений, обнаружены следующие признаки, указывающие на то, что сведения о таможенной стоимости товаров, заявленных в таможенной декларации, должным образом не подтверждены либо могут являться недостоверными:</xsl:text>
										<br/>
										<u>
											<xsl:apply-templates select="rdd:RequestInfo/rdd:Violations"/>
										</u>
									</td>
								</tr>
								<tr>
									<td style="text-indent:20px;">
										<xsl:text>В соответствии с пунктом 7 статьи 325 Таможенного кодекса Евразийского экономического союза Вам необходимо </xsl:text>
										<b>
											<xsl:text>в срок</xsl:text>
											<xsl:text> до </xsl:text>
											<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
											<xsl:apply-templates mode="date_words" select="rdd:RequestInfo/rdd:DateLimit"/>
											<xsl:text> года</xsl:text>
										</b>
										<xsl:text> предоставить следующие документы и (или) сведения любо объяснения причин, по которым такие документы и (или) сведения не погут быть представлены и (или) отсутствуют:</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<xsl:apply-templates mode="table" select="."/>
						<p>Запрошенные документы и (или) сведения должны быть представлены одним комплектом (одновременно).</p>
						<p>Одновременно с запрошенными таможенным органом документами и (или) сведениями могут быть представлены иные документы и (или) сведения в целях подтверждения достоверности и полноты сведений, заявленных в таможенной декларации, и (или) сведений, содержащихся в иных документах.</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:RequestInfo/rdd:PreReleaseSign"/>В соответствии с пунктами 6,12 статьи 325 Таможенного кодекса Евразийского экономического союза информируем о возможности произвести выпуск товаров в соответствии со статьей 121 Таможенного кодекса Евразийского экономического союза (до завершения проверки таможенных, иных документов и (или) сведений).</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:RequestInfo/rdd:GuaranteeSign"/>Для выпуска товаров Вам необходимо
							<b>
								<xsl:text> в срок</xsl:text>
								<xsl:text> до </xsl:text>
								<xsl:choose>
									<xsl:when  test="rdd:RequestInfo/rdd:DateGuarantee">
										<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
										<xsl:apply-templates mode="date_words" select="rdd:RequestInfo/rdd:DateGuarantee"/>
									</xsl:when>
									<xsl:otherwise>
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</xsl:otherwise>
								</xsl:choose>	
								<xsl:text> года </xsl:text>
							</b>
							предоставить обеспечение исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.
						</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:RequestInfo/rdd:ReleaseSign"/>При выпуске товаров в соответствии со статьей 121 Таможенного кодекса Евразийского экономического союза документы и (или) сведения, запрошенные таможенным органом, могут быть представлены после выпуска товаров
							<b>
								<xsl:text> в срок</xsl:text>
								<xsl:text> до </xsl:text>
								<xsl:choose>
									<xsl:when  test="rdd:RequestInfo/rdd:DateRelease">
										<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
										<xsl:apply-templates mode="date_words" select="rdd:RequestInfo/rdd:DateRelease"/>
									</xsl:when>
									<xsl:otherwise>
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</xsl:otherwise>
								</xsl:choose>	
	
								<xsl:text> года </xsl:text>
							</b>
						</p>
						<br/>
						<br/>
						<div style="width:100%;text-align:right;">
							<xsl:value-of select="rdd:CustomsPerson/cat_ru:PersonName"/>
						</div>
						<!-- br/>
						<br/>
						<br/>
						<br/>
						<div style="border-top: 1px solid black; width:50mm;"/>
						<div style="width:100%;font-size:8pt;">
						* Указывается срок в соответствии с пунктом 7 статьи 325 ТК ЕАЭС:<br/>
						<p>1) не позднее, чем за 4 часа до истечения срока, указанного в пункте 3 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных при подаче таможенной декларации;</p>
						<p>2) не позднее, чем за 1 рабочий день до истечения срока, установленного таможенным органом при продлении срока выпуска товаров в соответствии с пунктами 4-6 статьи 119 ТК ЕАЭС, - если запрос документв и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных в соответствии с пунктом 2 статьи 325 ТК ЕАЭС, и проверяемые сведения влияют на размер таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.</p>
						<br/>
						** Указывается срок выпуска товарова, установленный:<br/>
						<p>в пункте 3 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных при подаче таможенной декларации;</p>
						<p>в пункте 6 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленнх в соответствии с пунктом 2 статьи 325 ТК ЕАЭС, и проверяемые сведения влияют на размер таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.</p>
						<br/>
						*** Указывается срок, не превышающий 60 календарных дней со дня регистрации таможенной декларации, за исключением случая, предусмотренного пунктом 2 статьи 314 ТК ЕАЭС.
						</div-->
					</xsl:if>
					<xsl:if test="rdd:DocKind=2">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС<br/>
											ДОПОЛНИТЕЛЬНЫХ ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ<br/>
											В СООТВЕТСТВИИ С ПУНКТОМ 15 СТАТЬИ 325 ТК ЕАЭС</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="20%"/>
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:DeclName/cat_ru:OrganizationName"/>
										<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
											<xsl:value-of select="cat_ru:ShortName"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt; font-style: italic;">(наименование таможенного органа)</td>
									<td></td>
									<td style="font-size: 8pt; font-style: italic;">(наименование декларанта или таможенного представителя)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p style="border-bottom: 2px solid black; text-indent:20px;">
							Уведомляем, что представленные документы и (или) сведения в соответствии с пунктами 1 и 4 статьи 325 Таможенного кодекса ЕАЭС не устраняют основания для проведения проверки таможенных, иных документов и (или) сведений в отношении таможенной стоимости товаров, заявленных в декларации на товары №
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="rdd:RequestInfo/rdd:GTDID"/>
							<xsl:text>, </xsl:text>
							по следующим основаниям:
							<br/>
							<u>
								<xsl:apply-templates select="rdd:RequestInfo/rdd:Violations"/>
							</u>
						</p>
						<br/>
						<p style="text-indent: 20px;">
							Для целей установления достоверности и полноты проверяемых сведений, заявленных в таможенной декларации и (или) сведений, содержащихся в иных документах, в соответствии с пунктом 15 статьи 325 Таможенного кодекса ЕАЭС необходимо в срок до
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="date_words" select="rdd:RequestInfo/rdd:DateLimit"/>
							<xsl:text> года </xsl:text>
							представить следующие документы и (или) сведения:
						</p>
						<xsl:apply-templates mode="table" select="."/>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:value-of select="rdd:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="rdd:CustomsPerson/cat_ru:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:value-of select="rdd:CustomsPerson/cat_ru:LNP"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size:8pt; font-style: italic;">(Ф.И.О. должностного лица уполномоченного таможенного органа, ЭЦП)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="rdd:DocKind=3">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>УВЕДОМЛЕНИЕ<br/>
											о завершении проверки таможенных, иных документов и (или) сведений</b><br/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td width="30%">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="date_words" select="rdd:ResolDate"/>
												<xsl:if test="rdd:ResolDate">
													<xsl:text> г.</xsl:text>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(дата)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
									<td width="40%"></td>
									<td width="30%">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="rdd:NotificationInfo/rdd:Place"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(место составления)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>В соответствии с частью 8 статьи 226 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" уведомляю о том, что проводимая</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="rdd:OfficeName"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>на основании статей 326, 340 Таможенного кодекса Евразийского экономического союза</xsl:text>
										<sup>1</sup>
										<xsl:text> и статей 225, 239 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" проверка таможенных, иных документов и (или) сведений в целях</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rdd:NotificationInfo/rdd:ObjectiveAudit"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(указывается цель проверки в соответствии с пунктом 2 статьи 324 Таможенного кодекса Евразийского экономического союза либо иная конкретная цель)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<br/><br/>
										<xsl:text>в отношении:</xsl:text>
										
										<xsl:apply-templates select="rdd:CustomsCostInf"/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data"></xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(перечень проверенных таможенных, иных документов и (или) сведений с указанием их реквизитов)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										
										<br/><br/>
										<xsl:text>представленных лицом:</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="rdd:DeclName" mode="org"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(сведения о лице, чьи документы и (или) сведения проверялись: наименование, основной государственный регистрационный номер (при наличии), идентификационный номер налогоплательщика (при наличии), код причины постановки на учет (при наличии), место нахождения, адрес юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя, основной государственный регистрационный номер индивидуального предпринимателя (при наличии), идентификационный номер налогоплательщика (при наличии), место жительства индивидуального предпринимателя/фамилия, имя, отчество (при наличии), идентификационный номер налогоплательщика (при наличии), место жительства физического лица, не являющегося индивидуальным предпринимателем)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<br/><br/>
										<xsl:text>завершена </xsl:text>
										<xsl:apply-templates mode="date_words" select="rdd:NotificationInfo/rdd:EndAuditDate"/>
										<xsl:text> г.</xsl:text>
										<br/><br/>
										<xsl:text>По результатам проведения проверки таможенных, иных документов и (или) сведений нарушения регулирующих таможенные правоотношения международных договоров и актов, составляющих право Евразийского экономического союза, и законодательства Российской Федерации о таможенном регулировании не выявлены.</xsl:text>
										<br/><br/>
										<xsl:apply-templates select="rdd:CustomsPerson"/>
										<br/><br/>
										<xsl:text>Настоящее уведомление получил</xsl:text>
										<sup>2</sup>
										<br/><br/><br/>
										<table>
											<tbody>
												<tr>
													<td class="value" align="left" width="60%">
														<xsl:value-of select="rdd:NotificationInfo/rdd:SecondExempReceived/cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="rdd:NotificationInfo/rdd:SecondExempReceived/cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="rdd:NotificationInfo/rdd:SecondExempReceived/cat_ru:PersonMiddleName"/>
													</td>
													<td width="10%"></td>
													<td class="value" align="center" width="30%">
														<xsl:apply-templates mode="date_words" select="rdd:NotificationInfo/rdd:SecondExempReceived/cat_ru:IssueDate"/>
														<xsl:if test="rdd:NotificationInfo/rdd:SecondExempReceived/cat_ru:IssueDate">
															<xsl:text> г.</xsl:text>
														</xsl:if>
													</td>
												</tr>
												<tr align="center">
													<td class="descr">(фамилия, инициалы, подпись лица, получившего уведомление)</td>
													<td></td>
													<td class="descr">(дата получения уведомления)</td>
												</tr>
											</tbody>
										</table>
										<br/>
										<br/>
										<br/>
										<span style="font-size:8pt;">
											<sup>1</sup>
											<xsl:text> Федеральный закон от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, № 47, ст. 6843).</xsl:text>
											<br/>
											<sup>2</sup>
											<xsl:text> Заполняется при вручении уведомления о завершении проверки таможенных, иных документов и (или) сведений лицу, чьи документы и (или) сведения проверялись (его представителю).</xsl:text>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="rdd:CustomsPerson">
		<table>
			<tbody>
				<tr valign="bottom">
					<td width="30%">
						<xsl:text>Начальник (заместитель начальника) таможенного органа</xsl:text>
					</td>
					<td width="5%"></td>
					<td width="30%" class="value"></td>
					<td width="5%"></td>
					<td width="30%" class="value" align="center">
						<xsl:value-of select="rdd:CustomsPerson/cat_ru:PersonName"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="descr">(подпись)</td>
					<td></td>
					<td class="descr">(инициалы, фамилия)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="rdd:DeclName" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> Адрес(а): </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="position() &gt; 1">; </xsl:if>
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name(.) = 'AddressKindCode'">
					<xsl:choose>
						<xsl:when test=". = 1"> регистрации </xsl:when>
						<xsl:when test=". = 2"> фактический </xsl:when>
						<xsl:when test=". = 3"> почтовый </xsl:when>
						<xsl:otherwise> общий </xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="rdd:CustomsCostInf">
		<table>
			<tbody>
				<tr>
					<td>
						<i><xsl:value-of select="rdd:Position"/>. </i>
						<xsl:apply-templates select="rdd:CustCostInf"/>
						<xsl:if test="rdd:Comment">
							<br/>
							<xsl:text>Примечание: </xsl:text>
							<xsl:apply-templates select="rdd:Comment"/>
						</xsl:if>
						<br/>
						<xsl:text>Запрашиваемые документы: </xsl:text>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered">Описание</td>
									<td class="bordered">Номер</td>
									<td class="bordered">Дата</td>
									<td class="bordered">ID позиции в запросе</td>
									<td class="bordered">Код вида</td>
									<td class="bordered">Способ предоставления</td>
									<td class="bordered">Примечание</td>
								</tr>
								<xsl:for-each select="rdd:ReqDocuments">
									<tr align="center" valign="top">
										<td class="bordered">
											<xsl:value-of select="rdd:PrDocumentName"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="rdd:PrDocumentNumber"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates mode="russian_date" select="rdd:PrDocumentDate"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="rdd:RequestPositionID"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="rdd:DocCode"/>
										</td>
										<td class="bordered">
											<xsl:choose>
												<xsl:when test="rdd:CommKind=0">Документ из архива декларанта</xsl:when>
												<xsl:otherwise><xsl:value-of select="rdd:CommKind"></xsl:value-of></xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="rdd:Comment"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template mode="signs" match="*">
		<xsl:variable name="color">
			<xsl:choose>
				<xsl:when test=". = 'true' or . = 1"/>
				<xsl:otherwise>color: white;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div style="display: inline-block; border: 1px solid black; width:5mm; height:5 mm;text-align:center;{$color}">
			V
		</div>
	</xsl:template>
	
	<xsl:template mode="table" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" width="5%">№ п/п</td>
					<td class="bordered">Перечень заявленных сведений, требующих подтверждения/уточнения</td>
					<td class="bordered">Перечень запрашиваемых документов и (или) сведений</td>
					<td class="bordered">Примечание</td>
				</tr>
				<tr align="center">
					<td class="bordered">1</td>
					<td class="bordered">2</td>
					<td class="bordered">3</td>
					<td class="bordered">4</td>
				</tr>
				<xsl:for-each select="rdd:CustomsCostInf">
					<tr valign="top">
						<td class="bordered">
							<xsl:value-of select="rdd:Position"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:CustCostInf"/>
						</td>
						<td class="bordered">
							<xsl:for-each select="rdd:ReqDocuments">
								<xsl:value-of select="rdd:PrDocumentName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rdd:PrDocumentNumber"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates mode="russian_date" select="rdd:PrDocumentDate"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rdd:RequestPositionID"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rdd:DocCode"/>
								<xsl:if test="rdd:CommKind">
									<xsl:choose>
										<xsl:when test="rdd:CommKind=0"> документ из архива декларанта </xsl:when>
										<xsl:otherwise> Способ представления документа: <xsl:value-of select="rdd:CommKind"/></xsl:otherwise>
									</xsl:choose>
								</xsl:if>	
								<xsl:apply-templates select="rdd:Comment"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:Comment"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="rdd:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template mode="num_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="time_words" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,12,2)"/>
				<xsl:text> часов </xsl:text>
				<xsl:value-of select="substring(.,14,2)"/>
				<xsl:text> минут </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="date_words" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:text> "</xsl:text>
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:if test="substring(.,6,2)='01'">января</xsl:if>
				<xsl:if test="substring(.,6,2)='02'">февраля</xsl:if>
				<xsl:if test="substring(.,6,2)='03'">марта</xsl:if>
				<xsl:if test="substring(.,6,2)='04'">апреля</xsl:if>
				<xsl:if test="substring(.,6,2)='05'">мая</xsl:if>
				<xsl:if test="substring(.,6,2)='06'">июня</xsl:if>
				<xsl:if test="substring(.,6,2)='07'">июля</xsl:if>
				<xsl:if test="substring(.,6,2)='08'">августа</xsl:if>
				<xsl:if test="substring(.,6,2)='09'">сентября</xsl:if>
				<xsl:if test="substring(.,6,2)='10'">октября</xsl:if>
				<xsl:if test="substring(.,6,2)='11'">ноября</xsl:if>
				<xsl:if test="substring(.,6,2)='12'">декабря</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(.,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexData"/></sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template mode="russian_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>