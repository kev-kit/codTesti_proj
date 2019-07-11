<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all">

<xsl:output method="html"/>

<xsl:strip-space elements="*"/>
    
<!-- template core -->

<xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
    
    <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <meta name="keywords" content="{string-join(//keywords/term, ', ')}"/>
            <link rel="stylesheet" type="text/css" href="style.css"/>   
            <script type="text/javascript" src="js/cartoline.js"/>
            <title><xsl:value-of select="/teiCorpus/teiHeader//summary"/></title> 
        </head>
        
        <body>
            <xsl:apply-templates select="teiCorpus/teiHeader[position()=1]"/>  
        </body>
    </html>

</xsl:template>


<xsl:template match="teiHeader[position()=1]">
    <header>
        <div class="wrap_h1">
            <h1><xsl:value-of select="fileDesc/titleStmt/title"/></h1>
        </div>
    
        <div class="wrap_ico">
            <!-- iconePG -->
            <div class="center">
                <figure id="toGC" title="icona Giovanni Coliola - click per aprire la cartolina (questa immagine &#232; frutto di un lavoro di fantasia atto a guidare l'utente e non vuole rappresentare il reale aspetto dei personaggi)">
                    <img src="{//note[@xml:id='GC_icon']/@source}" alt="icona Giovanni Coliola - click per aprire la cartolina (questa immagine &#232; frutto di un lavoro di fantasia atto a guidare l'utente e non vuole rappresentare il reale aspetto dei personaggi)" />
                    <figcaption>
                        <xsl:value-of select="string-join((//person[@xml:id='GC']//forename, //person[@xml:id='GC']//surname), ' ' )"/>
                    </figcaption>
                </figure>
                
                <figure id="toOT" title="icona Oliva Turtura - click per aprire la cartolina (questa immagine &#232; frutto di un lavoro di fantasia atto a guidare l'utente e non vuole rappresentare il reale aspetto dei personaggi)">
                    <img src="{//note[@xml:id='OT_icon']/@source}" alt="icona Oliva Turtura - click per aprire la cartolina (questa immagine &#232; frutto di un lavoro di fantasia atto a guidare l'utente e non vuole rappresentare il reale aspetto dei personaggi)" />
                    <figcaption>
                        <xsl:value-of select="string-join((//person[@xml:id='OT']//forename, //person[@xml:id='OT']//surname), ' ' )"/>
                    </figcaption>
                </figure>
            </div>
            
        </div>
    
        <div class="wrap_h2">
            <h2><xsl:value-of select="fileDesc//summary"/></h2>
    
            <h2>
                <xsl:value-of select="substring(fileDesc//msIdentifier/repository, 1, 24)"/>
                <xsl:text disable-output-escaping='yes'>&lt;/br></xsl:text>
                <xsl:value-of select="substring(fileDesc//msIdentifier/repository, 26, 20)"/>
            </h2>
    
            <h2><xsl:value-of select="fileDesc//msIdentifier/settlement"/></h2>
        </div>
    
        <h4><xsl:value-of select="/teiCorpus/teiHeader//addrLine[position()=1]"/></h4>
    </header>

    <xsl:apply-templates select="//TEI"/>

    <script type="text/javascript" src="js/map_responsive.js" />
    
    <footer>
        <div class="ruoli">
            <ul>
                <li class="ruolo"><xsl:text>codifica e trascrizione</xsl:text></li>   <!-- ruolo -->
                <li><xsl:value-of select="//name[@xml:id='KV']"/></li>
            </ul>  
        </div>
        
        <div class="ruoli">
            <ul>
                <li class="ruolo"><xsl:text>publisher</xsl:text></li>   <!-- ruolo -->
                <li><xsl:value-of select="fileDesc//publisher"/></li>
            </ul>
            <ul>
                <li class="ruolo"><xsl:text>licenza</xsl:text></li>   <!-- ruolo -->
                <li><xsl:value-of select="fileDesc//availability/p"/></li>
            </ul>        
            <ul>
                <li><xsl:value-of select="fileDesc//edition/date"/></li>
            </ul>
        </div>
        
        <div class="ruoli">
            <ul>
                <li class="ruolo"><xsl:text>responsabile scientifico</xsl:text></li>   <!-- ruolo -->
                <li><xsl:value-of select="//name[@xml:id='GP']"/></li>
                <li><xsl:value-of select="//name[@xml:id='ES']"/></li>
            </ul>    
            <ul>
                <li class="ruolo"><xsl:text>compilatore</xsl:text></li>   <!-- ruolo -->
                <li><xsl:value-of select="//name[@xml:id='XY2']"/></li>
            </ul>        
            <ul>
                <li class="ruolo"><xsl:text>funzionario responsabile</xsl:text></li>   <!-- ruolo -->
                <li><xsl:value-of select="//name[@xml:id='MR']"/></li>
            </ul>        
        </div>
    </footer>

</xsl:template>


<xsl:template match="TEI">

    <div class="container" id="{substring(teiHeader//correspAction[@type='sent']/persName/@ref, 2, 3)}">        
        <section class="text">
            
            <div class="wrapTop">
                <div class="wrapIcon">
                    <img src="{teiHeader/fileDesc/notesStmt/note[@type='immagine']/@source}" />
                </div>            
    
                <div class="wrapBt">
                    <input class="bt bt_fronte" type="button" value="FRONTE"/> 
                    <input class="bt bt_retro" type="button" value="RETRO"/>
                    <!-- pulsanti di switch -->
                </div>
                <h2>
                    <xsl:value-of select="teiHeader//sourceDesc//title"/>
                </h2>
            </div>

            <div class="wrapArticle">
                <div class="mittente">
                    <p>
                        <xsl:if test="teiHeader//correspAction[@type='sent']/persName/@ref='#GC'">
                            <xsl:value-of select="string-join((//person[@xml:id='GC']//forename, //person[@xml:id='GC']//surname), ' ' )"/>    
                        </xsl:if>
                        <xsl:if test="teiHeader//correspAction[@type='sent']/persName/@ref='#OT'">
                            <xsl:value-of select="string-join((//person[@xml:id='OT']//forename, //person[@xml:id='OT']//surname), ' ' )"/>    
                        </xsl:if>
                        
                        <xsl:text> scrive a </xsl:text>

                        <xsl:if test="teiHeader//correspAction[@type='sent']/persName/@ref != '#GC'">
                            <xsl:value-of select="string-join((//person[@xml:id='GC']//forename, //person[@xml:id='GC']//surname), ' ' )"/>    
                        </xsl:if>
                        <xsl:if test="teiHeader//correspAction[@type='sent']/persName/@ref != '#OT'">
                            <xsl:value-of select="string-join((//person[@xml:id='OT']//forename, //person[@xml:id='OT']//surname), ' ' )"/>    
                        </xsl:if>
                    </p>
                </div>
                
                <div class="wrapMiddle">
                    <xsl:apply-templates select="text//div[@type='fronte']" />
                    <xsl:apply-templates select="text//div[@type='retro']" />
                </div>
            </div>
            
        </section>
        
        <xsl:apply-templates select="facsimile" />
                
    </div>        

</xsl:template>


<xsl:template match="div[@type='fronte']">
    
    <article class="fronte">
        <h3><xsl:text>Descrizione Immagine</xsl:text></h3>
        <p>
            <xsl:value-of select="figure//desc"/>
        </p>
        
        <xsl:if test="figure//floatingText">
            <h3><xsl:text>Testo Scritto</xsl:text></h3>
            <ul>
                <xsl:for-each select="figure//floatingText//l">
                    <li id="{ concat( substring(lb/@facs, 2) ,'_li') }">
                        <xsl:apply-templates select="node()"/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>    
        
        <xsl:if test="figure//stamp">
            <h3><xsl:text>Riferimenti Editoriali</xsl:text></h3>
            <xsl:apply-templates select="//text[@xml:id='text_013']//figDesc//stamp"/>
        </xsl:if>
        
    </article>        
        
</xsl:template>

<xsl:template match="figure//floatingText//l">
    <xsl:value-of select="normalize-space(node())"/>    
</xsl:template>
    
<xsl:template match="text[@xml:id='text_013']//figDesc//stamp">
    <p title="{normalize-space(note)}" id="{ concat( substring(mentioned/@facs, 2) ,'_li') }">
        <xsl:value-of select="mentioned"/>  <!-- inserire link a opere g.campi (da mettere nelle note TEI) -->
        <a target="_blank" href="{//note[@xml:id='link_Campi']/@source}">
            <xsl:text> (opere Campi)</xsl:text>
        </a>
    </p>
</xsl:template>    
    
<xsl:template match="div[@type='retro']">
        
    <article class="retro">
        <h3><xsl:text>Testo Scritto</xsl:text></h3>
        <ul>
            <xsl:for-each select="div[@type='message']//l">
                <li id="{ concat( substring(lb/@facs, 2) ,'_li') }">
                    <xsl:apply-templates select="node()"/>                
                </li>
            </xsl:for-each>
        </ul>
    </article>
    <article class="retro">
        <h3><xsl:text>Riferimenti Editoriali</xsl:text></h3>
        <ul>
            <xsl:for-each select="div[@type='stamp_string']//stamp[@type='stamp_strings']/child::node()">
                <li id="{ concat( substring(@facs, 2) ,'_li') }">
                    <xsl:value-of select="node()"/>
                </li>
            </xsl:for-each>
        </ul>
    </article>
        
</xsl:template>


<xsl:template match="div[@type='message']//l">
    <xsl:value-of select="normalize-space(node())"/>    
</xsl:template>


<xsl:template match="facsimile">
    
    <section class="img">    
        <p><xsl:text>scorri il cursore sull'immagine</xsl:text></p>
        <div class="wrapMiddle_IMG">
            <xsl:apply-templates select="surface[@type='fronte']"/>
            <xsl:apply-templates select="surface[@type='retro']"/>
        </div>
    </section>
    
</xsl:template>

<xsl:template match="surface[@type='fronte']">
    <img src="{graphic/@url}" usemap="#{graphic/@xml:id}" class="fronte" itemprop="{substring(graphic/@width, 1, 4)},{substring(graphic/@height, 1, 4)}"/>
    <map name="{graphic/@xml:id}">
        <xsl:for-each select="zone">
            <area shape="rect" coords="{@ulx}, {@uly}, {@lrx}, {@lry}" onmouseover="ev_li({concat(@xml:id, '_li')})" onmouseout="no_li({concat(@xml:id, '_li')})"/>
        </xsl:for-each>        
    </map>
</xsl:template>
    
<xsl:template match="surface[@type='retro']">
    <img src="{graphic/@url}" usemap="#{graphic/@xml:id}" class="retro" itemprop="{substring(graphic/@width, 1, 4)},{substring(graphic/@height, 1, 4)}"/>
    <map name="{graphic/@xml:id}">
        <xsl:for-each select="zone">
            <xsl:if test="@points">
                <area shape="poly" coords="{@points}" onmouseover="ev_li({concat(@xml:id, '_li')})" onmouseout="no_li({concat(@xml:id, '_li')})" />    
            </xsl:if>
            <xsl:if test="@ulx">
                <area shape="rect" coords="{@ulx}, {@uly}, {@lrx}, {@lry}" onmouseover="ev_li({concat(@xml:id, '_li')})" onmouseout="no_li({concat(@xml:id, '_li')})"/>
            </xsl:if>
        </xsl:for-each>
    </map>    
</xsl:template>
    
    


</xsl:stylesheet>
