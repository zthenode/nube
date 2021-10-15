<?xml version="1.0"?>
<!--==========================================================-->
<!--                                                          -->
<!--   File: wsdl.xsl                                         -->
<!--                                                          -->
<!-- Author: $author$                                        -->
<!--   Date: 12/31/2005                                       -->
<!--                                                          -->
<!--    $Id$                                                  -->
<!--                                                          -->
<!--==========================================================-->
<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xalan="http://xml.apache.org/xalan"
 xmlns:xsd="http://www.w3.org/2001/XMLSchema"
 xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
 xmlns:wsdl-soap="http://schemas.xmlsoap.org/wsdl/soap/"
 xmlns:exsl="http://exslt.org/common"
 exclude-result-prefixes="xalan"
 version="1.0">

<xsl:output
 method="xml"
 version="1.0"
 indent="yes"/>

<xsl:param name="service_location" select="''"/>
<xsl:param name="service_name" select="'service'"/>
<xsl:param name="operation_name" select="'operation'"/>
<xsl:param name="result_name" select="'result'"/>
<xsl:param name="result_type" select="''"/>
<xsl:param name="parameter_name" select="''"/>
<xsl:param name="parameter_type" select="''"/>

<xsl:variable name="service_operations_tree">
	<service_operation name="{$operation_name}">
	    <result
	     name="{$result_name}"
	     type="{$result_type}"/>

	    <xsl:if test="'' != $parameter_name">
        <parameter
         name="{$parameter_name}"
         type="{$parameter_type}"/>
	    </xsl:if>
	</service_operation>
</xsl:variable>

<xsl:variable name="service_operations"
 select="exsl:node-set($service_operations_tree)"/>

<!--==========================================================-->
<!--                                                          -->
<!-- Template match "*"                                       -->
<!--                                                          -->
<!--==========================================================-->
<xsl:template match="*">

	<xsl:comment>==========================================================</xsl:comment>
	<xsl:comment> WSDL file                                                </xsl:comment>
	<xsl:comment>==========================================================</xsl:comment>
	<xsl:element name="wsdl:definitions">
		<xsl:attribute name="xmlns:targetns">
			<xsl:value-of select="$service_name"/>
		</xsl:attribute>
		<xsl:attribute name="targetNamespace">
			<xsl:value-of select="$service_name"/>
		</xsl:attribute>
		<xsl:attribute name="name">
			<xsl:value-of select="$service_name"/>
		</xsl:attribute>

		<xsl:for-each select="$service_operations/service_operation">
		<xsl:comment>==========================================================</xsl:comment>
		<xsl:comment> message definition                                       </xsl:comment>
		<xsl:comment>==========================================================</xsl:comment>
		<wsdl:message name="output-of-{@name}">
		    <xsl:for-each select="result">
		    <xsl:comment>==========================================================</xsl:comment>
		    <xsl:comment> result                                                   </xsl:comment>
		    <xsl:comment>==========================================================</xsl:comment>
		    <wsdl:part name="{@name}" type="{@type}"/>
		    </xsl:for-each>
		</wsdl:message>
		<xsl:comment>==========================================================</xsl:comment>
		<xsl:comment> message definition                                       </xsl:comment>
		<xsl:comment>==========================================================</xsl:comment>
		<wsdl:message name="input-of-{@name}">
		    <xsl:for-each select="parameter">
		    <xsl:comment>==========================================================</xsl:comment>
		    <xsl:comment> parameter                                                </xsl:comment>
		    <xsl:comment>==========================================================</xsl:comment>
		    <wsdl:part name="{@name}" type="{@type}"/>
		    </xsl:for-each>
		</wsdl:message>
		</xsl:for-each>

		<xsl:comment>==========================================================</xsl:comment>
		<xsl:comment> messaging interface                                      </xsl:comment>
		<xsl:comment>==========================================================</xsl:comment>
		<wsdl:portType name="interface-of-{$service_name}">
		<xsl:for-each select="$service_operations/service_operation">
		    <xsl:comment>==========================================================</xsl:comment>
		    <xsl:comment> operation                                                </xsl:comment>
		    <xsl:comment>==========================================================</xsl:comment>
		    <wsdl:operation name="{@name}">
		        <xsl:comment>==========================================================</xsl:comment>
		        <xsl:comment> input                                                    </xsl:comment>
		        <xsl:comment>==========================================================</xsl:comment>
			    <wsdl:input message="targetns:input-of-{@name}"/>
		        <xsl:comment>==========================================================</xsl:comment>
		        <xsl:comment> output                                                   </xsl:comment>
		        <xsl:comment>==========================================================</xsl:comment>
			    <wsdl:output message="targetns:output-of-{@name}"/>
		    </wsdl:operation>
		</xsl:for-each>
		</wsdl:portType>

		<xsl:comment>==========================================================</xsl:comment>
		<xsl:comment> messaging implementation                                 </xsl:comment>
		<xsl:comment>==========================================================</xsl:comment>
		<wsdl:binding
		 name="binding-of-{$service_name}"
		 type="targetns:interface-of-{$service_name}">
			<wsdl-soap:binding style="rpc" transport="http://schemas.xmlsoap.org/soap/http"/>

			<xsl:for-each select="$service_operations/service_operation">
		    <xsl:comment>==========================================================</xsl:comment>
		    <xsl:comment> operation                                                </xsl:comment>
		    <xsl:comment>==========================================================</xsl:comment>
			<wsdl:operation name="{@name}">
				<wsdl-soap:operation soapAction="{$service_name}"/>
		        <xsl:comment>==========================================================</xsl:comment>
		        <xsl:comment> input                                                    </xsl:comment>
		        <xsl:comment>==========================================================</xsl:comment>
				<wsdl:input>
					<wsdl-soap:body
					 use="encoded"
					 namespace="{$service_name}"
					 encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"/>
				</wsdl:input>
		        <xsl:comment>==========================================================</xsl:comment>
		        <xsl:comment> output                                                   </xsl:comment>
		        <xsl:comment>==========================================================</xsl:comment>
				<wsdl:output>
					<wsdl-soap:body
					 use="encoded"
					 namespace="{$service_name}"
					 encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"/>
				</wsdl:output>
			</wsdl:operation>
			</xsl:for-each>
		</wsdl:binding>

	</xsl:element>
</xsl:template>

</xsl:stylesheet>
