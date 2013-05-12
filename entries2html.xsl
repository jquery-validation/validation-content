<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="node_modules/grunt-jquery-content/tasks/jquery-xml/entries2html-base.xsl"/>
<xsl:variable name="method-prefix-dot" select="false()"/>

<xsl:template name="example-code">
&lt;!doctype html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="utf-8"&gt;
&lt;title&gt;<xsl:value-of select="desc"/>&lt;/title&gt;
<xsl:if test="css">
&lt;style&gt;<xsl:copy-of select="css/text()"/>  &lt;/style&gt;</xsl:if>
&lt;script src="jquery.validate.js"&gt;&lt;/script&gt;
&lt;script&gt;<xsl:copy-of select="code/text()"/>&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;form&gt;
	<xsl:copy-of select="html/text()"/>
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</xsl:template>

</xsl:stylesheet>
