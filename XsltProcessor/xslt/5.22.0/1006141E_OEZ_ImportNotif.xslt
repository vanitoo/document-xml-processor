<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" 
	xmlns:impn="urn:customs.ru:Information:CustomsDocuments:OEZ_ImportNotif:5.22.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0"
	xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.22.0">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	
	<xsl:param name="OEZ_NotifReg"/>
	
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='OEZ_ImportNotif']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn2" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
   <xsl:template match="impn:OEZ_ImportNotif">
      <html>
         <head>
            <title>Уведомление/Разрешение о ввозе товаров и въезде средства транспорта на территорию ОЭЗ/ПОЭЗ</title>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}	
						table
							{
							table-layout: fixed;
							width: 100%;
							border: 0;
							/*empty-cells: show;*/
							border-collapse: collapse;
							margin-top: 0px;
							}					
						td {
							font-family: Arial;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						
						.graphMainbold {
						font-family: Arial;
						font-size: 10pt;
						font-weight:bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
					border-bottom: solid 1pt #000000;
					font-weight: bold;
										}	
					.borderednormal {
					border-bottom: solid 1pt #000000;
					font-weight: normal;
										}	
					.tdBorder {
						border: 1px solid black;
						}
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:297mm">
                  <tbody>
                     <tr>
                        <!--Head-->
                        <td align="left" style="width:167mm" valign="top">
                           <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">Уведомление</xsl:if>
                           <xsl:if test="impn:DocSign='3'">Разрешение</xsl:if> № <u>
								<xsl:choose>
									<xsl:when test="impn:DocSign='3'">
										<xsl:apply-templates select="impn:RegistrationNumber" mode="reg_num"/>
									</xsl:when>
									<xsl:when test="$OEZ_NotifReg">
										<xsl:apply-templates select="$OEZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="impn:RegistrationNumber" mode="reg_num"/>
									</xsl:otherwise>
								</xsl:choose>
                              </u>
                           <br/>
                           <xsl:if test="impn:DocSign='1'">о ввозе товаров на территорию особой экономической зоны<br/>и въезде средства транспорта</xsl:if>
                           <xsl:if test="impn:DocSign='2' or impn:DocSign='3'">о ввозе товаров на территорию<br/>портовой особой экономической зоны</xsl:if>
                        </td>
                        <td>
                           <table style="width:130mm">
                              <tbody>
                                 <tr>
                                    <td align="left" valign="top">B <u>
                                          <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                                             <xsl:apply-templates select="impn:Customs/cat_ru:Code"/> 
														<xsl:apply-templates select="impn:Customs/cat_ru:OfficeName"/>
                                          </xsl:if>
                                          <xsl:if test="impn:DocSign='3'">
                                             <xsl:apply-templates select="impn:Consignee/cat_ru:OrganizationName"/> 
															<xsl:if test="impn:Consignee/impn:Address">
                                                <xsl:for-each select="impn:Consignee/impn:Address">
                                                   <xsl:call-template name="Address"/>
                                                </xsl:for-each> 
															
                                                <!--xsl:apply-templates name="Address" select="impn:Consignee/impn:Address"/-->
                                             </xsl:if>
                                             <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures">
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                             </xsl:if>
                                          </xsl:if>
                                       </u>
                                    </td>
                                 </tr>
                                 <tr>
                                    <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                                       <td align="center" class="graphLittle">(наименование таможенного органа с указанием кода таможенного органа)</td>
                                    </xsl:if>
                                    <xsl:if test="impn:DocSign='3'">
                                       <td align="center" class="graphLittle">
													(наименование/адрес резидента портовой особой экономической заны, ОГРН,ИНН,КПП
													</td>
                                    </xsl:if>
                                 </tr>
                                 <tr>
                                    <td align="left">От <u>
                                          <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                                             <xsl:apply-templates select="impn:Consignee/cat_ru:OrganizationName"/> 
														<xsl:if test="impn:Consignee/impn:Address">
                                                <xsl:for-each select="impn:Consignee/impn:Address">
                                                   <xsl:call-template name="Address"/>
                                                </xsl:for-each> 
															
                                                <!--xsl:apply-templates name="Address" select="impn:Consignee/impn:Address"/-->
                                             </xsl:if>
                                             <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures">
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
                                                <xsl:if test="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="impn:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                             </xsl:if>
                                          </xsl:if>
                                          <xsl:if test="impn:DocSign='3'">
                                             <xsl:apply-templates select="impn:Customs/cat_ru:Code"/> 
														<xsl:apply-templates select="impn:Customs/cat_ru:OfficeName"/>
                                          </xsl:if>
                                       </u>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graphLittle">
                                       <xsl:choose>
                                          <xsl:when test="impn:DocSign='2'">(наименование/адрес резидента портовой особой экономической заны, ОГРН,ИНН,КПП</xsl:when>
                                          <xsl:when test="impn:DocSign='3'">(наименование таможенного органа с указанием кода таможенного органа)</xsl:when>
                                          <xsl:otherwise>(наименование/адрес резидента ОЭЗ (нерезидента ОЭЗ ОГРН,ИНН,КПП) или фамилия, имя, отчество( для физических лиц, ИНН, ОГРНИП)</xsl:otherwise>
                                       </xsl:choose>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table style="width:297mm">
                  <tbody>
                     <tr>
                        <td align="left">
                           <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">Настоящим уведомляю, что будет осуществлен ввоз товаров </xsl:if>
                           <xsl:if test="impn:DocSign='3'">Ввоз товаров на территорию ПОЭЗ в срок до </xsl:if>
                           <u>
                              <xsl:apply-templates select="impn:ImportDate" mode="russian_date"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <xsl:if test="impn:DocSign='2' or impn:DocSign='1'">
                           <td class="graphLittle">(планируемая дата ввоза товаров)</td>
                        </xsl:if>
                        <xsl:if test="impn:DocSign='3'">
                           <td align="right" class="graphLittle" style="width: 140mm">(установленный срок ввоза товаров)</td>
                        </xsl:if>
                     </tr>
                     <tr align="left">
                        <td>Средство транспорта <u>
                              <xsl:if test="impn:TransportMeans/impn:TransportKind='1'">a/м </xsl:if>
                              <xsl:if test="impn:TransportMeans/impn:TransportKind='2'">ж/д </xsl:if>
                              <xsl:if test="impn:TransportMeans/impn:TransportKind='3'">авиа </xsl:if>
                              <xsl:if test="impn:TransportMeans/impn:TransportMark">
                                 <xsl:apply-templates select="impn:TransportMeans/impn:TransportMark"/> </xsl:if>
                           </u> регистрационный номер <u>
                              <xsl:apply-templates select="impn:TransportMeans/impn:ActiveTransportIdentifier"/>
                              <xsl:if test="//impn:DocSign='2' or //impn:DocSign='3'">, прицеп/полуприцеп 
										<xsl:for-each select="impn:TransportMeans/impn:TransportRegNumber">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </xsl:if>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graphLittle" style="width:110mm; padding-left:200px;">(тип/марка)</td>
                     </tr>
                     <xsl:if test="impn:DocSign='1'">
                        <tr>
                           <td align="left">Регистрационный номер прицепа/полуприцепа <u>
                                 <xsl:for-each select="impn:TransportMeans/impn:TransportRegNumber">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </u>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="impn:AddInformation">
                        <tr>
                           <td align="left">Дополнительные сведения <u>
                                 <xsl:for-each select="impn:AddInformation">
                                    <xsl:apply-templates select="."/>
                                 </xsl:for-each>
                              </u>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="//impn:DocSign='2'">
                        <tr>
                           <td align="left">К уведомлению прилагается опись и документы на <u>   </u> л.
								</td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="//impn:DocSign='3'">
                        <tr>
                           <td align="left">К разрешению прилагается опись и документы на <u>   </u> л.
								</td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="center">
                           <br/>Сведения о товарах<br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:if test="//impn:DocSign='1'">
                  <table>
                     <tbody>
                        <tr>
                           <td class="tdBorder" width="4%">№ п/п</td>
                           <td class="tdBorder" width="20%">Наименование товара</td>
                           <td class="tdBorder" width="8%">Кол-во товаров</td>
                           <td class="tdBorder" width="8%">Единица измерения</td>
                           <td class="tdBorder" width="8%">Статус товара</td>
                           <td class="tdBorder">Идентификационные признаки товара</td>
                           <td class="tdBorder" width="25%">Примечание</td>
							<xsl:if test="//impn:TechID">                        
								<td class="tdBorder">Технические идентификаторы</td>
							</xsl:if>
                        </tr>
                        <tr align="center">
                           <td class="tdBorder">1</td>
                           <td class="tdBorder">2</td>
                           <td class="tdBorder">3</td>
                           <td class="tdBorder">4</td>
                           <td class="tdBorder">5</td>
                           <td class="tdBorder">6</td>
                           <td class="tdBorder">7</td>
							<xsl:if test="//impn:TechID">                        
								<td class="tdBorder">8</td>
							</xsl:if>
                        </tr>
                        <xsl:for-each select="impn:GoodsInfo">
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <td class="tdBorder">
                                 <xsl:number value="position()"/>
                              </td>
                              <td class="tdBorder">
                                 <xsl:for-each select="impn:GoodsDescription">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </td>
                              <td class="tdBorder" align="right">
                                 <xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
                              </td>
                              <td class="tdBorder">
                                 <xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
										<xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/> 
									</td>
                              <td class="tdBorder">
                                 <xsl:apply-templates select="impn:GoodsStatus"/><xsl:if test="impn:GoodsStatus and impn:CustomsModeCode">/</xsl:if><xsl:apply-templates select="impn:CustomsModeCode"/>
                              </td>
                              <td class="tdBorder">
                                 <xsl:for-each select="impn:GoodsIdentification">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </td>
                              <td class="tdBorder">
                                 <xsl:for-each select="impn:Note">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </td>
							<xsl:if test="//impn:TechID">
							   <td class="tdBorder" style="word-break: break-all;">
								  <xsl:choose>
									<xsl:when test="impn:TechID">
										<xsl:for-each select="impn:TechID">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise><br/></xsl:otherwise>
								  </xsl:choose>
							   </td>
							</xsl:if>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="//impn:DocSign='2'">
                  <table style="width:297mm">
                     <tbody>
                        <tr valign="top">
                           <td class="tdBorder" width="4%">№ п/п</td>
                           <td class="tdBorder" width="20%">Наименование товара</td>
                           <td class="tdBorder" width="10%">Классифика- ционный код товара по ТН ВЭД ЕАЭС</td>
                           <td class="tdBorder" width="8%">Кол-во товаров</td>
                           <td class="tdBorder" width="8%">Статус товара</td>
                           <td class="tdBorder">Отправитель (получатель) товара</td>
                           <td class="tdBorder" width="25%">Прочее</td>
							<xsl:if test="//impn:TechID">                        
								<td class="tdBorder">Технические идентификаторы</td>
							</xsl:if>
                        </tr>
                        <tr align="center">
                           <td class="tdBorder">1</td>
                           <td class="tdBorder">2</td>
                           <td class="tdBorder">3</td>
                           <td class="tdBorder">4</td>
                           <td class="tdBorder">5</td>
                           <td class="tdBorder">6</td>
                           <td class="tdBorder">7</td>
							<xsl:if test="//impn:TechID">                        
								<td class="tdBorder">8</td>
							</xsl:if>
                        </tr>
                        <xsl:for-each select="impn:GoodsInfo">
                           <xsl:variable name="pos" select="position()"/>
                           <tr valign="top">
                              <td class="tdBorder">
                                 <xsl:number value="position()"/>
                              </td>
                              <td class="tdBorder">
                                 <xsl:for-each select="impn:GoodsDescription">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </td>
                              <td class="tdBorder">
											 <xsl:apply-templates select="impn:GoodsTNVEDCode"/>
                              </td>
                              <td class="tdBorder">
											<xsl:if test="impn:PackagesQuantity">
												<xsl:text>Количество грузовых мест </xsl:text><xsl:apply-templates select="impn:PackagesQuantity"/>
											</xsl:if>
											<xsl:if test="impn:PackagingKind">
												<xsl:text> упаковка: </xsl:text><xsl:apply-templates select="impn:PackagingKind"/>,
											</xsl:if> 
											<xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:GoodsQuantity"/> <xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                 <xsl:if test="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                              </td>
                              <td class="tdBorder">
                                 <xsl:apply-templates select="impn:GoodsStatus"/><xsl:if test="impn:GoodsStatus and impn:CustomsModeCode">/</xsl:if><xsl:apply-templates select="impn:CustomsModeCode"/>
                              </td>
                              <td class="tdBorder">
											 <xsl:apply-templates select="impn:ConsignParticipant"/>
                              </td>
                              <td class="tdBorder">
                                 <xsl:for-each select="impn:Note">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </td>
							<xsl:if test="//impn:TechID">
							   <td class="tdBorder" style="word-break: break-all;">
								  <xsl:choose>
									<xsl:when test="impn:TechID">
										<xsl:for-each select="impn:TechID">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise><br/></xsl:otherwise>
								  </xsl:choose>
							   </td>
							</xsl:if>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="//impn:DocSign='3'">
                  <table style="width:297mm">
                     <tbody>
                        <tr>
                           <td class="tdBorder">№ п/п</td>
                           <td class="tdBorder">Наименование товара</td>
                           <td class="tdBorder" style="width:35mm">Классификационный код товара по ТН ВЭД ЕАЭС</td>
                           <td class="tdBorder">Кол-во товаров</td>
                           <td class="tdBorder">Статус товара</td>
                           <td class="tdBorder">Отправитель (получатель) товара</td>
                           <!--<td>Прочее</td>-->
							<xsl:if test="//impn:TechID">                        
								<td class="tdBorder">Технические идентификаторы</td>
							</xsl:if>
                        </tr>
                        <tr align="center">
                           <td class="tdBorder">1</td>
                           <td class="tdBorder">2</td>
                           <td class="tdBorder">3</td>
                           <td class="tdBorder">4</td>
                           <td class="tdBorder">5</td>
                           <td class="tdBorder">6</td>
                           <!--<td>7</td>-->
							<xsl:if test="//impn:TechID">                        
								<td class="tdBorder">7</td>
							</xsl:if>
                        </tr>
                        <xsl:for-each select="impn:GoodsInfo">
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <td class="tdBorder">
                                 <xsl:number value="position()"/>
                              </td>
                              <td class="tdBorder">
                                 <xsl:for-each select="impn:GoodsDescription">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </td>
                              <td class="tdBorder">
											 <xsl:apply-templates select="impn:GoodsTNVEDCode"/>
                              </td>
                              <td class="tdBorder">
											Количество грузовых мест <xsl:apply-templates select="impn:PackagesQuantity"/> 
											упаковка: <xsl:apply-templates select="impn:PackagingKind"/>, 
											<xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:GoodsQuantity"/> <xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                 <xsl:if test="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="impn:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                              </td>
                              <td class="tdBorder">
                                 <xsl:apply-templates select="impn:GoodsStatus"/><xsl:if test="impn:GoodsStatus and impn:CustomsModeCode">/</xsl:if><xsl:apply-templates select="impn:CustomsModeCode"/>
                              </td>
                              <td class="tdBorder">
											 <xsl:apply-templates select="impn:ConsignParticipant"/>
                              </td>
                              <!--<td>
											<xsl:for-each select="impn:Note">
												<xsl:apply-templates select="."/>&#160;
										</xsl:for-each>
										</td>-->
							<xsl:if test="//impn:TechID">
							   <td class="tdBorder" style="word-break: break-all;">
								  <xsl:choose>
									<xsl:when test="impn:TechID">
										<xsl:for-each select="impn:TechID">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise><br/></xsl:otherwise>
								  </xsl:choose>
							   </td>
							</xsl:if>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="*" mode="reg_num">
	   <xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'Number']"/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn2"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
            <xsl:value-of select="substring($dateIn2,9,2)"/>
            <xsl:value-of select="substring($dateIn2,6,2)"/>
            <xsl:value-of select="substring($dateIn2,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn2"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:apply-templates select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:apply-templates select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:apply-templates select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:apply-templates select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:apply-templates select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="impn:ConsignParticipant">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:apply-templates select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:apply-templates select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:apply-templates select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
		  <span class="header"> Адрес:</span>
		  <br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
		  <br/>
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span> ИНН: <xsl:apply-templates select="cat_ru:INN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span> УНП: <xsl:apply-templates select="cat_ru:UNP"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span> Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span> БИН: <xsl:apply-templates select="cat_ru:BIN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span> ИИН: <xsl:apply-templates select="cat_ru:IIN"/>
         </span>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span> ИТН: 
			<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header"> Адрес:</span>
      <br/>
      <xsl:if test="cat_ru:CounryName">
         <xsl:apply-templates select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:apply-templates select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:apply-templates select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:apply-templates select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:apply-templates select="cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:apply-templates select="cat_ru:PostalCode"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="RUScat_ru:IdentityCard">
      <span class="header"> Документ, удостоверяющий личность:</span>
      <br/>
      <xsl:if test="RUScat_ru:IdentityCardName">
         <xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardCode">(код вида документа <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
         <xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:apply-templates select="RUScat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="RUScat_ru:AddressKindCode"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
							<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
						</xsl:choose>
					</element>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:variable name="xpath_AddressKindCode1">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode1}">
								<xsl:choose>
									<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
									<xsl:when test=".='2'">Фактический адрес: </xsl:when>
									<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
									<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
								</xsl:choose>
							</element>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
