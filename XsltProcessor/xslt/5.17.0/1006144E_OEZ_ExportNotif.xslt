<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:exnot="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportNotif:5.17.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
	<xsl:template match="//*[local-name()='OEZ_ExportNotif']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_dt">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_dt">
				<xsl:with-param name="dateIn3" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
   <xsl:template match="exnot:OEZ_ExportNotif">
      <html>
         <head>
            <title>Уведомление о вывозе товаров с территории особой экономической зоны</title>
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
							empty-cells: show;
							border-collapse: collapse;
							margin-top: 1px;
							}
						td {
							font-family:Arial;
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
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:297mm;">
                  <tbody>
                     <tr>
                        <!--Head-->
                        <td align="left" style="width:167mm" valign="top">
                           <xsl:if test="exnot:DocSign='0'">Предварительное уведомление<br/>о вывозе товаров с территории особой экономической зоны<br/>№ </xsl:if>
                           <xsl:if test="exnot:DocSign='1'">Уведомление о вывозе товаров<br/>с территории портовой особой экономической зоны<br/>№ </xsl:if>
                           <xsl:if test="exnot:DocSign='2'">Уведомление о вывозе товаров<br/>с территории опережающего социально-экономического развития<br/>№ </xsl:if>
                           <u>
                              <xsl:apply-templates select="exnot:RegistrationNumber/exnot:CustomsCode"/>/<xsl:apply-templates select="exnot:RegistrationNumber/exnot:RegistrationDate" mode="russian_date_gtd"/>/<xsl:apply-templates select="exnot:RegistrationNumber/exnot:Number"/>
                           </u>
                        </td>
                        <td>
                           <table style="width:130mm">
                              <tbody>
                                 <tr>
                                    <td align="left">B 
														<xsl:apply-templates select="exnot:Customs/cat_ru:Code"/> 
														<xsl:apply-templates select="exnot:Customs/cat_ru:OfficeName"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа<br/> с указанием кода таможенного органа)</td>
                                 </tr>
                                 <tr>
                                    <td align="left">От 
														<xsl:apply-templates select="exnot:IncidentNotif/cat_ru:OrganizationName"/> 
														<xsl:if test="exnot:IncidentNotif/exnot:Address">
                                          <xsl:for-each select="exnot:IncidentNotif/exnot:Address">
                                             <xsl:call-template name="Address"/>
                                          </xsl:for-each> 
															
                                          <!--xsl:apply-templates name="Address" select="impn:Consignee/impn:Address"/-->
                                       </xsl:if>
                                       <xsl:if test="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures">
                                          <xsl:apply-templates select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
															<xsl:apply-templates select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
															<xsl:apply-templates select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
														</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graphLittle" style="border-top:1pt solid black">
                                       <xsl:if test="exnot:DocSign='0'">(наименование или фамилия, <br/>имя, отчество (для <br/>физического лица), <br/>подающего предварительное уведомление)</xsl:if>
                                       <xsl:if test="exnot:DocSign='1'">(наименование/адрес резидента<br/>портовой особой экономической<br/> зоны, ОГРН, ИНН, КПП)</xsl:if>
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
                     <xsl:if test="exnot:PassKind">
						 <tr>
							<td align="left">
								<xsl:variable name="xpath_PassKind">
									<xsl:call-template name="get_xpath">
										<xsl:with-param name="node" select="exnot:PassKind"/>
									</xsl:call-template>
								</xsl:variable>
								<element xml_node="{$xpath_PassKind}">
									<xsl:choose>
										<xsl:when test="exnot:PassKind='0' or exnot:PassKind='false' or exnot:PassKind='f'">уведомление о разовом вывозе</xsl:when>
										<xsl:when test="exnot:PassKind='1' or exnot:PassKind='true' or exnot:PassKind='t'">запрос на многоразовый пропуск</xsl:when>
										<xsl:otherwise><xsl:value-of select="exnot:PassKind"/></xsl:otherwise>
									</xsl:choose>
								</element>
							</td>
						</tr>
					</xsl:if>
                     <tr>
                        <td align="left">
								Отправитель 
									<u>
                              <xsl:if test="not(exnot:Consignor)">                                                        </xsl:if>
                              <xsl:apply-templates select="exnot:Consignor/cat_ru:OrganizationName"/> 
										<xsl:if test="exnot:Consignor/exnot:Address">
                                 <xsl:for-each select="exnot:Consignor/exnot:Address">
                                    <xsl:call-template name="Address"/>
                                 </xsl:for-each> 
										</xsl:if>
                              <xsl:if test="exnot:Consignor/cat_ru:RFOrganizationFeatures">
                                 <xsl:apply-templates select="exnot:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
											<xsl:apply-templates select="exnot:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
											<xsl:apply-templates select="exnot:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
										</xsl:if>
                           </u>
									 Дата <xsl:if test="exnot:DocSign='1'">вывоза </xsl:if>
                           <u>
                              <xsl:apply-templates select="exnot:ExportDate" mode="russian_date"/>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle" style="width:130mm">(наименование и адрес)</td>
                     </tr>
                     <tr align="left">
                        <td>Средство транспорта <u>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportKind='1'">a/м </xsl:if>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportKind='2'">ж/д </xsl:if>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportKind='3'">авиа </xsl:if>
                              <xsl:if test="exnot:TransportMeans/exnot:TransportMark">
                                 <xsl:apply-templates select="exnot:TransportMeans/exnot:TransportMark"/> </xsl:if>
                           </u> регистрационный номер <u>
                              <xsl:apply-templates select="exnot:TransportMeans/exnot:ActiveTransportIdentifier"/>
                              <xsl:if test="exnot:DocSign='1'">, прицеп/полуприцеп <xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </xsl:if>
                           </u>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphLittle" style="width:110mm">(тип/марка)</td>
                     </tr>
                     <xsl:if test="exnot:DocSign='0'">
                        <tr>
                           <td align="left">Регистрационный номер прицепа/полуприцепа <u>
                                 <xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
                                    <xsl:apply-templates select="."/> 
										</xsl:for-each>
                              </u>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td align="left">Дополнительные сведения <u>
                              <xsl:for-each select="exnot:AddInformation">
                                 <xsl:apply-templates select="."/>
                              </xsl:for-each>
                           </u>
                        </td>
                     </tr>
                     <xsl:if test="exnot:DocSign='1'">
                        <tr>
                           <td align="left">К уведомлению прилагается опись и документы на <u>       </u> л.
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
               <table border="1" cellpadding="0" cellspacing="0" style="width:297mm">
                  <tbody>
                     <tr>
                        <td width="4%">№ п/п</td>
                        <td width="20%">Наименование</td>
                        <td width="8%">Кол-во товаров</td>
                        <td width="8%">Кол-во грузовых мест</td>
                        <td width="8%">Вес товаров</td>
                        <td width="8%">Вид упаковки</td>
                        <td width="8%">Статус товаров</td>
                        <xsl:choose>
							<xsl:when test="//*[local-name()='OEZ_ExportNotif']//*[local-name()='TechID']">
								<td width="25%">Примечание</td>
								<td width="11%">Технические идентификаторы</td>
							</xsl:when>
							<xsl:otherwise>
								<td width="36%">Примечание</td>
							</xsl:otherwise>
						</xsl:choose>
                     </tr>
                     <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
						<xsl:if test="//*[local-name()='OEZ_ExportNotif']//*[local-name()='TechID']">
							<td>9</td>
						</xsl:if>
                     </tr>
                     <xsl:for-each select="exnot:GoodsInfo">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <td>
                              <xsl:number value="position()"/>
                           </td>
                           <td>
                              <xsl:for-each select="exnot:GoodsDescription">
                                 <xsl:apply-templates select="."/> 
										</xsl:for-each>
                           </td>
                           <td>
                              <xsl:apply-templates select="exnot:SupplementaryQuantity/cat_ru:GoodsQuantity"/> 
										<xsl:apply-templates select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> 
										<xsl:apply-templates select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="exnot:PackagesQuantity"/> 
							</td>
                           <td>
                              <xsl:apply-templates select="exnot:WeighQuantity"/> 
							</td>
                           <td>
                              <xsl:apply-templates select="exnot:PackagingKind"/> 
										
										
							</td>
                           <td align="left">
                              <xsl:for-each select="exnot:GoodsStatus">
                                 <xsl:apply-templates select="exnot:StatusSymbolicValue"/>
                                 <xsl:if test="exnot:CustomsModeCode"><xsl:text>/</xsl:text><xsl:apply-templates select="exnot:CustomsModeCode"/>
                                 </xsl:if>
                                 <xsl:if test="exnot:GTDID"><xsl:text>/</xsl:text><xsl:apply-templates select="exnot:GTDID/cat_ru:CustomsCode"/><xsl:text>/</xsl:text><xsl:apply-templates select="exnot:GTDID/cat_ru:RegistrationDate" mode="russian_date_dt"/><xsl:text>/</xsl:text><xsl:apply-templates select="exnot:GTDID/cat_ru:GTDNumber"/>
                                 </xsl:if> 
								<xsl:if test="exnot:GoodsNumeric"><xsl:text>/</xsl:text><xsl:apply-templates select="exnot:GoodsNumeric"/>
								</xsl:if>
								<xsl:if test="exnot:NetWeightQuantity"><xsl:text>/</xsl:text><xsl:apply-templates select="exnot:NetWeightQuantity"/>
                                </xsl:if>
                                 <xsl:if test="exnot:SupplementaryQuantity"><xsl:text>/</xsl:text><xsl:apply-templates select="exnot:SupplementaryQuantity/cat_ru:GoodsQuantity"/><xsl:apply-templates select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
                                    <xsl:if test="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"> (код <xsl:apply-templates select="exnot:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                                 </xsl:if>
                                 <br/>
                              </xsl:for-each>
                           </td>
                           <td>
                              <xsl:for-each select="exnot:Note">
                                 <xsl:apply-templates select="."/> 
								</xsl:for-each>
                           </td>
							<xsl:if test="//*[local-name()='OEZ_ExportNotif']//*[local-name()='TechID']">
								 <td style="word-break: break-all;">
								  <xsl:choose>
									<xsl:when test="exnot:TechID">
										<xsl:for-each select="exnot:TechID">
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
            </div>
         </body>
      </html>
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
   <xsl:template name="russian_date_dt">
      <xsl:param name="dateIn3"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn3,5,1)='-' and substring($dateIn3,8,1)='-'">
            <xsl:value-of select="substring($dateIn3,9,2)"/>
            <xsl:value-of select="substring($dateIn3,6,2)"/>
            <xsl:value-of select="substring($dateIn3,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn3"/>
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
</xsl:stylesheet>
