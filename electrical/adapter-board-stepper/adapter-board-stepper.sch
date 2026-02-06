<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.6.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.025" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="90" name="Modules" color="37" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="34" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="33" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="32" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="36" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="39" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="39" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="39" fill="1" visible="yes" active="yes"/>
<layer number="150" name="Simulation" color="35" fill="1" visible="no" active="yes"/>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="3" fill="1" visible="no" active="no"/>
<layer number="3" name="Route3" color="5" fill="1" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="8" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="8" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="23" fill="1" visible="no" active="no"/>
<layer number="30" name="bStop" color="23" fill="1" visible="no" active="no"/>
<layer number="31" name="tCream" color="27" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="24" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="19" fill="3" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="16" fill="6" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="20" fill="1" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="17" fill="1" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="18" fill="1" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="98" name="Guide" color="38" fill="1" visible="no" active="no"/>
<layer number="151" name="BoardFrame" color="22" fill="1" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<description>ADAPTER-BOARD-STEPPER</description>
<libraries>
<library name="symbols">
<description>&lt;div align=left&gt;&lt;table width="100%" cellpadding="5" cellspacing="0"  bgcolor="#E0E0E0"&gt;&lt;tr&gt;&lt;td&gt;
&lt;h3&gt;Schematic symbols&lt;/h3&gt;
Frames, graphics and block symbols for quickly drawing schematic sketches, wiring and block diagrams.&lt;br&gt;
&lt;font color=red&gt;&lt;b&gt;Schematics only&lt;/b&gt; - not suited for creating circuit boards&lt;/font&gt;&lt;br&gt;
&lt;author&gt;&lt;b&gt;Update:&lt;/b&gt; 2023-07-21 Andreas Weidner&lt;/author&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;br&gt;&lt;br&gt;

&lt;b&gt;Usage hints&lt;/b&gt;&lt;br&gt;
Keep the following information in mind when adding symbols to a schematic:&lt;ul&gt;
&lt;li&gt;Since the devices in this library contain &lt;b&gt;no useful packages&lt;/b&gt;, they should &lt;b&gt;not&lt;/b&gt; be used for creating circuit boards.&lt;/li&gt;
&lt;li&gt;To &lt;b&gt;avoid device name conflicts&lt;/b&gt; with other libraries, you should &lt;b&gt;not&lt;/b&gt; use this library in conjunction with
others when creating circuit boards. Since this library contains devices with names already available in other libraries,
the library browser may otherwise ask you to select the library from which to use a device. E.g., when typing
&lt;b&gt;add r&lt;/b&gt; while using both this library and another one with a device called &lt;b&gt;R&lt;/b&gt; included, the
library browser pops up asking which &lt;b&gt;R&lt;/b&gt; to add. To avoid this constant harassing, switch the usage of this
library off in all designs that do not need it.&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="FRAME-A4-LANDSCAPE">
<wire x1="0" y1="0" x2="25.0031" y2="0" width="0.4064" layer="94"/>
<wire x1="25.0031" y1="0" x2="49.8475" y2="0" width="0.4064" layer="94"/>
<wire x1="49.8475" y1="0" x2="74.8506" y2="0" width="0.4064" layer="94"/>
<wire x1="74.8506" y1="0" x2="99.7744" y2="0" width="0.4064" layer="94"/>
<wire x1="99.7744" y1="0" x2="124.6982" y2="0" width="0.4064" layer="94"/>
<wire x1="124.6982" y1="0" x2="149.6219" y2="0" width="0.4064" layer="94"/>
<wire x1="149.6219" y1="0" x2="174.5456" y2="0" width="0.4064" layer="94"/>
<wire x1="174.5456" y1="0" x2="199.5487" y2="0" width="0.4064" layer="94"/>
<wire x1="199.5487" y1="0" x2="224.3931" y2="0" width="0.4064" layer="94"/>
<wire x1="224.3931" y1="0" x2="249.3169" y2="0" width="0.4064" layer="94"/>
<wire x1="249.3169" y1="0" x2="274.32" y2="0" width="0.4064" layer="94"/>
<wire x1="274.32" y1="0" x2="274.32" y2="25.7969" width="0.4064" layer="94"/>
<wire x1="274.32" y1="25.7969" x2="274.32" y2="51.5144" width="0.4064" layer="94"/>
<wire x1="274.32" y1="51.5144" x2="274.32" y2="77.3113" width="0.4064" layer="94"/>
<wire x1="274.32" y1="77.3113" x2="274.32" y2="103.0288" width="0.4064" layer="94"/>
<wire x1="274.32" y1="103.0288" x2="274.32" y2="128.8256" width="0.4064" layer="94"/>
<wire x1="274.32" y1="128.8256" x2="274.32" y2="154.5432" width="0.4064" layer="94"/>
<wire x1="274.32" y1="154.5432" x2="274.32" y2="180.34" width="0.4064" layer="94"/>
<wire x1="274.32" y1="180.34" x2="249.3169" y2="180.34" width="0.4064" layer="94"/>
<wire x1="249.3169" y1="180.34" x2="224.3932" y2="180.34" width="0.4064" layer="94"/>
<wire x1="224.3932" y1="180.34" x2="199.4694" y2="180.34" width="0.4064" layer="94"/>
<wire x1="199.4694" y1="180.34" x2="174.5456" y2="180.34" width="0.4064" layer="94"/>
<wire x1="174.5456" y1="180.34" x2="149.6219" y2="180.34" width="0.4064" layer="94"/>
<wire x1="149.6219" y1="180.34" x2="124.6981" y2="180.34" width="0.4064" layer="94"/>
<wire x1="124.6981" y1="180.34" x2="99.7745" y2="180.34" width="0.4064" layer="94"/>
<wire x1="99.7745" y1="180.34" x2="74.7712" y2="180.34" width="0.4064" layer="94"/>
<wire x1="74.7712" y1="180.34" x2="49.927" y2="180.34" width="0.4064" layer="94"/>
<wire x1="49.927" y1="180.34" x2="24.9237" y2="180.34" width="0.4064" layer="94"/>
<wire x1="24.9237" y1="180.34" x2="0" y2="180.34" width="0.4064" layer="94"/>
<wire x1="0" y1="180.34" x2="0" y2="154.5432" width="0.4064" layer="94"/>
<wire x1="0" y1="154.5432" x2="0" y2="128.8256" width="0.4064" layer="94"/>
<wire x1="0" y1="128.8256" x2="0" y2="103.0287" width="0.4064" layer="94"/>
<wire x1="0" y1="103.0287" x2="0" y2="77.3113" width="0.4064" layer="94"/>
<wire x1="0" y1="77.3113" x2="0" y2="51.5144" width="0.4064" layer="94"/>
<wire x1="0" y1="51.5144" x2="0" y2="25.7969" width="0.4064" layer="94"/>
<wire x1="0" y1="25.7969" x2="0" y2="0" width="0.4064" layer="94"/>
<wire x1="2.54" y1="2.54" x2="25.0031" y2="2.54" width="0.4064" layer="94"/>
<wire x1="25.0031" y1="2.54" x2="49.8475" y2="2.54" width="0.4064" layer="94"/>
<wire x1="49.8475" y1="2.54" x2="74.8506" y2="2.54" width="0.4064" layer="94"/>
<wire x1="74.8506" y1="2.54" x2="99.7744" y2="2.54" width="0.4064" layer="94"/>
<wire x1="99.7744" y1="2.54" x2="124.6982" y2="2.54" width="0.4064" layer="94"/>
<wire x1="124.6982" y1="2.54" x2="149.6219" y2="2.54" width="0.4064" layer="94"/>
<wire x1="149.6219" y1="2.54" x2="163.83" y2="2.54" width="0.4064" layer="94"/>
<wire x1="163.83" y1="2.54" x2="174.5456" y2="2.54" width="0.4064" layer="94"/>
<wire x1="174.5456" y1="2.54" x2="180.34" y2="2.54" width="0.4064" layer="94"/>
<wire x1="180.34" y1="2.54" x2="199.5487" y2="2.54" width="0.4064" layer="94"/>
<wire x1="199.5487" y1="2.54" x2="207.01" y2="2.54" width="0.4064" layer="94"/>
<wire x1="207.01" y1="2.54" x2="224.3931" y2="2.54" width="0.4064" layer="94"/>
<wire x1="224.3931" y1="2.54" x2="249.3169" y2="2.54" width="0.4064" layer="94"/>
<wire x1="249.3169" y1="2.54" x2="271.78" y2="2.54" width="0.4064" layer="94"/>
<wire x1="271.78" y1="2.54" x2="271.78" y2="8.89" width="0.4064" layer="94"/>
<wire x1="271.78" y1="8.89" x2="271.78" y2="25.7969" width="0.4064" layer="94"/>
<wire x1="271.78" y1="25.7969" x2="271.78" y2="51.5144" width="0.4064" layer="94"/>
<wire x1="271.78" y1="51.5144" x2="271.78" y2="77.3113" width="0.4064" layer="94"/>
<wire x1="271.78" y1="77.3113" x2="271.78" y2="103.0288" width="0.4064" layer="94"/>
<wire x1="271.78" y1="103.0288" x2="271.78" y2="128.8256" width="0.4064" layer="94"/>
<wire x1="271.78" y1="128.8256" x2="271.78" y2="154.5432" width="0.4064" layer="94"/>
<wire x1="271.78" y1="154.5432" x2="271.78" y2="177.8" width="0.4064" layer="94"/>
<wire x1="271.78" y1="177.8" x2="249.3169" y2="177.8" width="0.4064" layer="94"/>
<wire x1="249.3169" y1="177.8" x2="224.3932" y2="177.8" width="0.4064" layer="94"/>
<wire x1="224.3932" y1="177.8" x2="199.4694" y2="177.8" width="0.4064" layer="94"/>
<wire x1="199.4694" y1="177.8" x2="174.5456" y2="177.8" width="0.4064" layer="94"/>
<wire x1="174.5456" y1="177.8" x2="149.6219" y2="177.8" width="0.4064" layer="94"/>
<wire x1="149.6219" y1="177.8" x2="124.6981" y2="177.8" width="0.4064" layer="94"/>
<wire x1="124.6981" y1="177.8" x2="99.7745" y2="177.8" width="0.4064" layer="94"/>
<wire x1="99.7745" y1="177.8" x2="74.7712" y2="177.8" width="0.4064" layer="94"/>
<wire x1="74.7712" y1="177.8" x2="49.927" y2="177.8" width="0.4064" layer="94"/>
<wire x1="49.927" y1="177.8" x2="24.9237" y2="177.8" width="0.4064" layer="94"/>
<wire x1="24.9237" y1="177.8" x2="2.54" y2="177.8" width="0.4064" layer="94"/>
<wire x1="2.54" y1="177.8" x2="2.54" y2="154.5432" width="0.4064" layer="94"/>
<wire x1="2.54" y1="154.5432" x2="2.54" y2="128.8256" width="0.4064" layer="94"/>
<wire x1="2.54" y1="128.8256" x2="2.54" y2="103.0287" width="0.4064" layer="94"/>
<wire x1="2.54" y1="103.0287" x2="2.54" y2="77.3113" width="0.4064" layer="94"/>
<wire x1="2.54" y1="77.3113" x2="2.54" y2="51.5144" width="0.4064" layer="94"/>
<wire x1="2.54" y1="51.5144" x2="2.54" y2="25.7969" width="0.4064" layer="94"/>
<wire x1="2.54" y1="25.7969" x2="2.54" y2="2.54" width="0.4064" layer="94"/>
<wire x1="24.9237" y1="180.34" x2="24.9237" y2="177.8" width="0.254" layer="94"/>
<wire x1="49.927" y1="180.34" x2="49.927" y2="177.8" width="0.254" layer="94"/>
<wire x1="74.7712" y1="180.34" x2="74.7712" y2="177.8" width="0.254" layer="94"/>
<wire x1="99.7745" y1="180.34" x2="99.7745" y2="177.8" width="0.254" layer="94"/>
<wire x1="124.6981" y1="180.34" x2="124.6981" y2="177.8" width="0.254" layer="94"/>
<wire x1="149.6219" y1="180.34" x2="149.6219" y2="177.8" width="0.254" layer="94"/>
<wire x1="174.5456" y1="180.34" x2="174.5456" y2="177.8" width="0.254" layer="94"/>
<wire x1="199.4694" y1="180.34" x2="199.4694" y2="177.8" width="0.254" layer="94"/>
<wire x1="224.3932" y1="180.34" x2="224.3932" y2="177.8" width="0.254" layer="94"/>
<wire x1="249.3169" y1="180.34" x2="249.3169" y2="177.8" width="0.254" layer="94"/>
<wire x1="25.0031" y1="2.54" x2="25.0031" y2="0" width="0.254" layer="94"/>
<wire x1="49.8475" y1="2.54" x2="49.8475" y2="0" width="0.254" layer="94"/>
<wire x1="74.8506" y1="2.54" x2="74.8506" y2="0" width="0.254" layer="94"/>
<wire x1="99.7744" y1="2.54" x2="99.7744" y2="0" width="0.254" layer="94"/>
<wire x1="124.6982" y1="2.54" x2="124.6982" y2="0" width="0.254" layer="94"/>
<wire x1="149.6219" y1="2.54" x2="149.6219" y2="0" width="0.254" layer="94"/>
<wire x1="174.5456" y1="2.54" x2="174.5456" y2="0" width="0.254" layer="94"/>
<wire x1="199.5487" y1="2.54" x2="199.5487" y2="0" width="0.254" layer="94"/>
<wire x1="224.3931" y1="2.54" x2="224.3931" y2="0" width="0.254" layer="94"/>
<wire x1="249.3169" y1="2.54" x2="249.3169" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="25.7969" x2="2.54" y2="25.7969" width="0.254" layer="94"/>
<wire x1="0" y1="51.5144" x2="2.54" y2="51.5144" width="0.254" layer="94"/>
<wire x1="0" y1="77.3113" x2="2.54" y2="77.3113" width="0.254" layer="94"/>
<wire x1="0" y1="103.0287" x2="2.54" y2="103.0287" width="0.254" layer="94"/>
<wire x1="0" y1="128.8256" x2="2.54" y2="128.8256" width="0.254" layer="94"/>
<wire x1="0" y1="154.5432" x2="2.54" y2="154.5432" width="0.254" layer="94"/>
<wire x1="271.78" y1="25.7969" x2="274.32" y2="25.7969" width="0.254" layer="94"/>
<wire x1="271.78" y1="51.5144" x2="274.32" y2="51.5144" width="0.254" layer="94"/>
<wire x1="271.78" y1="77.3113" x2="274.32" y2="77.3113" width="0.254" layer="94"/>
<wire x1="271.78" y1="103.0288" x2="274.32" y2="103.0288" width="0.254" layer="94"/>
<wire x1="271.78" y1="128.8256" x2="274.32" y2="128.8256" width="0.254" layer="94"/>
<wire x1="271.78" y1="154.5432" x2="274.32" y2="154.5432" width="0.254" layer="94"/>
<text x="11.5094" y="178.3556" size="1.524" layer="94" font="vector">1</text>
<text x="36.4332" y="178.3556" size="1.524" layer="94" font="vector">2</text>
<text x="61.4363" y="178.3556" size="1.524" layer="94" font="vector">3</text>
<text x="86.2806" y="178.3556" size="1.524" layer="94" font="vector">4</text>
<text x="111.3632" y="178.3556" size="1.524" layer="94" font="vector">5</text>
<text x="136.2869" y="178.3556" size="1.524" layer="94" font="vector">6</text>
<text x="161.2106" y="178.3556" size="1.524" layer="94" font="vector">7</text>
<text x="186.1344" y="178.3556" size="1.524" layer="94" font="vector">8</text>
<text x="211.0581" y="178.3556" size="1.524" layer="94" font="vector">9</text>
<text x="236.6168" y="178.3556" size="1.524" layer="94" font="vector">10</text>
<text x="261.4613" y="178.3556" size="1.524" layer="94" font="vector">11</text>
<text x="11.5094" y="0.5556" size="1.524" layer="94" font="vector">1</text>
<text x="36.4331" y="0.5556" size="1.524" layer="94" font="vector">2</text>
<text x="61.4363" y="0.5556" size="1.524" layer="94" font="vector">3</text>
<text x="86.2806" y="0.5556" size="1.524" layer="94" font="vector">4</text>
<text x="111.2838" y="0.5556" size="1.524" layer="94" font="vector">5</text>
<text x="136.2075" y="0.5556" size="1.524" layer="94" font="vector">6</text>
<text x="161.1312" y="0.5556" size="1.524" layer="94" font="vector">7</text>
<text x="186.055" y="0.5556" size="1.524" layer="94" font="vector">8</text>
<text x="211.0581" y="0.5556" size="1.524" layer="94" font="vector">9</text>
<text x="236.5375" y="0.5556" size="1.524" layer="94" font="vector">10</text>
<text x="261.4613" y="0.5556" size="1.524" layer="94" font="vector">11</text>
<text x="0.7938" y="12.1444" size="1.524" layer="94" font="vector">G</text>
<text x="0.7938" y="37.8619" size="1.524" layer="94" font="vector">F</text>
<text x="0.7939" y="63.6588" size="1.524" layer="94" font="vector">E</text>
<text x="0.7938" y="89.3763" size="1.524" layer="94" font="vector">D</text>
<text x="0.7939" y="115.1731" size="1.524" layer="94" font="vector">C</text>
<text x="0.7938" y="140.8906" size="1.524" layer="94" font="vector">B</text>
<text x="0.7938" y="166.6081" size="1.524" layer="94" font="vector">A</text>
<text x="272.4944" y="12.065" size="1.524" layer="94" font="vector">G</text>
<text x="272.4944" y="37.8619" size="1.524" layer="94" font="vector">F</text>
<text x="272.4944" y="63.6588" size="1.524" layer="94" font="vector">E</text>
<text x="272.4944" y="89.4556" size="1.524" layer="94" font="vector">D</text>
<text x="272.4944" y="115.0937" size="1.524" layer="94" font="vector">C</text>
<text x="272.4944" y="140.8906" size="1.524" layer="94" font="vector">B</text>
<text x="272.4944" y="166.5288" size="1.524" layer="94" font="vector">A</text>
<frame x1="0" y1="0" x2="274.32" y2="180.34" columns="11" rows="7" layer="94" border-left="no" border-top="no" border-right="no" border-bottom="no"/>
<wire x1="271.78" y1="43.18" x2="207.01" y2="43.18" width="0.4064" layer="94"/>
<wire x1="207.01" y1="43.18" x2="163.83" y2="43.18" width="0.4064" layer="94"/>
<wire x1="163.83" y1="43.18" x2="163.83" y2="36.83" width="0.4064" layer="94"/>
<wire x1="163.83" y1="36.83" x2="163.83" y2="33.02" width="0.4064" layer="94"/>
<wire x1="163.83" y1="33.02" x2="163.83" y2="25.4" width="0.4064" layer="94"/>
<wire x1="163.83" y1="25.4" x2="163.83" y2="21.59" width="0.4064" layer="94"/>
<wire x1="163.83" y1="21.59" x2="163.83" y2="17.78" width="0.4064" layer="94"/>
<wire x1="163.83" y1="17.78" x2="163.83" y2="13.97" width="0.4064" layer="94"/>
<wire x1="163.83" y1="13.97" x2="163.83" y2="10.16" width="0.4064" layer="94"/>
<wire x1="163.83" y1="10.16" x2="163.83" y2="6.35" width="0.4064" layer="94"/>
<wire x1="163.83" y1="6.35" x2="163.83" y2="2.54" width="0.4064" layer="94"/>
<wire x1="207.01" y1="2.54" x2="207.01" y2="6.35" width="0.4064" layer="94"/>
<wire x1="207.01" y1="6.35" x2="207.01" y2="10.16" width="0.4064" layer="94"/>
<wire x1="207.01" y1="10.16" x2="207.01" y2="13.97" width="0.4064" layer="94"/>
<wire x1="207.01" y1="13.97" x2="207.01" y2="17.78" width="0.4064" layer="94"/>
<wire x1="207.01" y1="17.78" x2="207.01" y2="21.59" width="0.4064" layer="94"/>
<wire x1="207.01" y1="21.59" x2="207.01" y2="25.4" width="0.4064" layer="94"/>
<wire x1="207.01" y1="25.4" x2="207.01" y2="33.02" width="0.4064" layer="94"/>
<wire x1="207.01" y1="33.02" x2="207.01" y2="36.83" width="0.4064" layer="94"/>
<wire x1="207.01" y1="36.83" x2="207.01" y2="39.37" width="0.4064" layer="94"/>
<wire x1="207.01" y1="39.37" x2="207.01" y2="43.18" width="0.4064" layer="94"/>
<wire x1="207.01" y1="39.37" x2="271.78" y2="39.37" width="0.254" layer="94"/>
<wire x1="163.83" y1="33.02" x2="180.34" y2="33.02" width="0.254" layer="94"/>
<wire x1="180.34" y1="33.02" x2="207.01" y2="33.02" width="0.254" layer="94"/>
<wire x1="163.83" y1="36.83" x2="207.01" y2="36.83" width="0.1524" layer="94"/>
<wire x1="180.34" y1="39.37" x2="180.34" y2="33.02" width="0.1524" layer="94"/>
<wire x1="180.34" y1="27.94" x2="180.34" y2="2.54" width="0.1524" layer="94"/>
<wire x1="163.83" y1="25.4" x2="207.01" y2="25.4" width="0.1524" layer="94"/>
<wire x1="207.01" y1="21.59" x2="163.83" y2="21.59" width="0.1524" layer="94"/>
<wire x1="163.83" y1="17.78" x2="207.01" y2="17.78" width="0.1524" layer="94"/>
<wire x1="207.01" y1="13.97" x2="163.83" y2="13.97" width="0.1524" layer="94"/>
<wire x1="207.01" y1="20.32" x2="271.78" y2="20.32" width="0.254" layer="94"/>
<wire x1="207.01" y1="8.89" x2="247.65" y2="8.89" width="0.1524" layer="94"/>
<wire x1="247.65" y1="8.89" x2="247.65" y2="2.54" width="0.1524" layer="94"/>
<wire x1="247.65" y1="8.89" x2="271.78" y2="8.89" width="0.1524" layer="94"/>
<wire x1="207.01" y1="10.16" x2="163.83" y2="10.16" width="0.1524" layer="94"/>
<text x="208.28" y="40.64" size="1.524" layer="97" font="vector">&gt;COMPANY</text>
<text x="208.28" y="36.83" size="1.524" layer="94" font="vector" ratio="16">Description:</text>
<text x="165.1" y="38.1" size="1.524" layer="94" font="vector" ratio="16">Date</text>
<text x="181.61" y="38.1" size="1.524" layer="94" font="vector" ratio="16">Name</text>
<text x="165.1" y="40.64" size="1.524" layer="94" font="vector" ratio="16">Created:</text>
<text x="165.1" y="26.67" size="1.524" layer="94" font="vector" ratio="16">Date</text>
<text x="181.61" y="26.67" size="1.524" layer="94" font="vector" ratio="16">Name</text>
<text x="165.1" y="29.21" size="1.524" layer="94" font="vector" ratio="16">Changed:</text>
<text x="270.8275" y="3.81" size="1.524" layer="97" font="vector" align="bottom-right">&gt;SHEET</text>
<text x="220.98" y="6.35" size="1.524" layer="97" font="vector">&gt;LAST_DATE_TIME</text>
<text x="220.98" y="3.81" size="1.524" layer="97" font="vector">&gt;PLOT_DATE_TIME</text>
<text x="220.98" y="17.78" size="1.524" layer="97" font="vector">&gt;DRAWING_NAME</text>
<text x="208.28" y="3.81" size="1.524" layer="94" font="vector" ratio="16">Printed:</text>
<text x="208.28" y="17.78" size="1.524" layer="94" font="vector" ratio="16">File:</text>
<text x="208.28" y="6.35" size="1.524" layer="94" font="vector" ratio="16">Saved:</text>
<text x="248.92" y="3.81" size="1.524" layer="94" font="vector" ratio="16">Sheet:</text>
<text x="165.1" y="34.29" size="1.524" layer="97" font="vector">&gt;CREATIONDATE</text>
<text x="181.61" y="34.29" size="1.524" layer="97" font="vector">&gt;CREATIONAUTHOR</text>
<text x="165.1" y="22.86" size="1.524" layer="97" font="vector">&gt;REVISIONDATE1</text>
<text x="181.61" y="22.86" size="1.524" layer="97" font="vector">&gt;REVISIONAUTHOR1</text>
<text x="165.1" y="19.05" size="1.524" layer="97" font="vector">&gt;REVISIONDATE2</text>
<text x="181.61" y="19.05" size="1.524" layer="97" font="vector">&gt;REVISIONAUTHOR2</text>
<text x="165.1" y="15.24" size="1.524" layer="97" font="vector">&gt;REVISIONDATE3</text>
<text x="181.61" y="15.24" size="1.524" layer="97" font="vector">&gt;REVISIONAUTHOR3</text>
<text x="165.1" y="11.43" size="1.524" layer="97" font="vector">&gt;REVISIONDATE4</text>
<text x="181.61" y="11.43" size="1.524" layer="97" font="vector">&gt;REVISIONAUTHOR4</text>
<text x="165.1" y="7.62" size="1.524" layer="97" font="vector">&gt;REVISIONDATE5</text>
<text x="181.61" y="7.62" size="1.524" layer="97" font="vector">&gt;REVISIONAUTHOR5</text>
<text x="208.28" y="31.75" size="3.81" layer="97" font="vector" ratio="16">&gt;TITLE1</text>
<text x="208.28" y="26.9875" size="3.81" layer="97" font="vector" ratio="16">&gt;TITLE2</text>
<text x="208.28" y="24.13" size="1.524" layer="97" font="vector">&gt;DESCRIPTION</text>
<text x="208.28" y="21.59" size="1.524" layer="97" font="vector">&gt;DESCRIPTION2</text>
<text x="208.28" y="15.24" size="1.524" layer="94" font="vector" ratio="16">Revision:</text>
<text x="220.98" y="15.24" size="1.524" layer="97" font="vector">&gt;REVISION</text>
<text x="208.28" y="12.7" size="1.524" layer="94" font="vector" ratio="16">Variant:</text>
<text x="220.98" y="12.7" size="1.524" layer="97" font="vector">&gt;ASSEMBLY_VARIANT</text>
<text x="208.28" y="10.16" size="1.524" layer="94" font="vector" ratio="16">Module:</text>
<text x="220.98" y="10.16" size="1.524" layer="97" font="vector"> </text>
<text x="248.92" y="6.35" size="1.524" layer="94" font="vector" ratio="16">Module page:</text>
<text x="270.8275" y="6.35" size="1.524" layer="97" font="vector" align="bottom-right"> </text>
<wire x1="207.01" y1="6.35" x2="163.83" y2="6.35" width="0.1524" layer="94"/>
<text x="165.1" y="3.81" size="1.524" layer="97" font="vector">&gt;REVISIONDATE6</text>
<text x="181.61" y="3.81" size="1.524" layer="97" font="vector">&gt;REVISIONAUTHOR6</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="FRAME-A4-LANDSCAPE" prefix="$">
<description>&lt;div align=left&gt;&lt;b&gt;Schematics frame&lt;/b&gt;, DIN A4 landscape&lt;br&gt;&lt;br&gt;
Displays the following (global) attributes in a document field:&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;DATE&lt;/tt&gt;, &lt;tt&gt;&amp;gt;AUTHOR&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;REVISIONDATE1&lt;/tt&gt;, &lt;tt&gt;&amp;gt;REVISIONAUTHOR1&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;REVISIONDATE2&lt;/tt&gt;, &lt;tt&gt;&amp;gt;REVISIONAUTHOR2&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;REVISIONDATE3&lt;/tt&gt;, &lt;tt&gt;&amp;gt;REVISIONAUTHOR3&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;REVISIONDATE4&lt;/tt&gt;, &lt;tt&gt;&amp;gt;REVISIONAUTHOR4&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;REVISIONDATE5&lt;/tt&gt;, &lt;tt&gt;&amp;gt;REVISIONAUTHOR5&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;REVISIONDATE6&lt;/tt&gt;, &lt;tt&gt;&amp;gt;REVISIONAUTHOR6&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;COMPANY&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;TITLE&lt;/tt&gt;, &lt;tt&gt;&amp;gt;TITLE2&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;DESCRIPTION&lt;/tt&gt;, &lt;tt&gt;&amp;gt;DESCRIPTION2&lt;/tt&gt;,&lt;br&gt;
&lt;tt&gt;&amp;nbsp;&amp;nbsp;&amp;gt;REVISION&lt;/tt&gt;&lt;/div&gt;</description>
<gates>
<gate name="A" symbol="FRAME-A4-LANDSCAPE" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="connectors">
<description>&lt;div align=left&gt;&lt;table width="100%" cellpadding="5" cellspacing="0"  bgcolor="#E0E0E0"&gt;&lt;tr&gt;&lt;td&gt;
&lt;h3&gt;Connectors&lt;/h3&gt;
Connectors, screw and crimp terminals, jumpers, test points, pins, pads, ...&lt;br&gt;
&lt;author&gt;&lt;b&gt;Update:&lt;/b&gt; 2024-06-11 Andreas Weidner&lt;/author&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
&lt;br&gt;&lt;br&gt;

&lt;b&gt;Device prefixes&lt;/b&gt;&lt;br&gt;
All devices have a dedicated prefix, sometimes followed by a 2-digit number, which signify
the connector type and its pin number. The following device types are available (excerpt):&lt;p&gt;
&lt;table cellpadding="0" cellspacing="0"&gt;
&lt;tr&gt;&lt;td&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;J[Nr]&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Jumper wire [length in 0.1"]&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;JP[Nr]&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Jumper pin block [pin number]&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;X[Nr]&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Connector [pin number]&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XA[Nr]&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Connector with alternating pins [pin number]&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XB[Nr]&amp;nbsp;&amp;nbsp;&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Backplane connector [pin number]&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XD&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Digital ground test point&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XG&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Ground test point&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XP&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Input/output pin&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XS[Nr]&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Shielded connector [pin number]&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XT&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Test point&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XU[Nr]&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Connector with unconnected (separate) pins [pin number]&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;&lt;hr&gt;&lt;p&gt;

&lt;b&gt;Device suffixes&lt;/b&gt;&lt;br&gt;
Most connectors and pins offer different suffixes to directly specify the package type. The following list gives some
examples of available suffixes (note that not all connectors offer all types of packages):&lt;br&gt;
&lt;table border="0" cellpadding="0" cellspacing="0"&gt;
&lt;tr&gt;&lt;td&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;(none)&amp;nbsp;&amp;nbsp;&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Default connector package (currently DIL with normal pads, if available)&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;H&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Horizontal mounting (parallel to PCB), straight contacts&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;V&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Vertical mounting (perpendicular to PCB), angled contacts&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;L&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Long pads (easily solderable, through-pin-routing possible)&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;N&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Normal pads (easily solderable)&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;R&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Reduced pads (small, through-pin-routing possible)&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;S&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;SMD contacts&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;&lt;hr&gt;&lt;p&gt;

&lt;b&gt;Device examples&lt;/b&gt;&lt;br&gt;
The following examples show devices that can be inserted into EAGLE schematics using
the &lt;b&gt;add&lt;/b&gt; command:&lt;p&gt; 
&lt;table border="0" cellpadding="0" cellspacing="0"&gt;
&lt;tr&gt;&lt;td&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;J&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Default jumper (currently 0.2" with normal pads)&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;X06&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Default 6-pin connector (currently IDC package with reduced pads)&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XA16-DIL-N&amp;nbsp;&amp;nbsp;&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Pin header with 2*8 alternating pins in DIL package with normal pads&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XS01-4S&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Default shielded connector with 4 shield pins (currently LEMO00 angled)&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;XPR&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Default input/output pin with reduced pads&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;&lt;hr&gt;&lt;p&gt;

&lt;b&gt;Board layers&lt;/b&gt;&lt;br&gt;
The board packages make special use of the following layers:&lt;p&gt;
&lt;table&gt;
&lt;tr&gt;&lt;td&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/td&gt;
  &lt;td width="1%"&gt;&lt;tt&gt;tDocu,&lt;br&gt;&amp;nbsp;&amp;nbsp;tNames,&lt;br&gt;&amp;nbsp;&amp;nbsp;tValues&amp;nbsp;&amp;nbsp;&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Placeplan including device names and values for printed documentation. Should
    &lt;b&gt;not&lt;/b&gt; be used for the board imprint due to complexity. Names and values occupy
    the &lt;b&gt;same&lt;/b&gt; board space, so two separate printouts are advisable&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;tt&gt;tPlace&lt;/tt&gt;&lt;/td&gt;
  &lt;td&gt;Less sophisticated, but concise placeplan &lt;b&gt;including&lt;/b&gt; device names and values for the board imprint (&lt;b&gt;no&lt;/b&gt; other layers should be used for the print)&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;&lt;/div&gt;</description>
<packages>
<package name="XS08-2S-RJ45">
<description>&lt;div align=left&gt;&lt;b&gt;RJ-45 connector&lt;/b&gt;, horizontal mount&lt;br&gt;
FCC68 standard, 8 pins&lt;/div&gt;</description>
<wire x1="8.255" y1="-15.24" x2="8.255" y2="5.715" width="0.4064" layer="51"/>
<wire x1="-8.255" y1="-15.24" x2="-8.255" y2="5.715" width="0.4064" layer="51"/>
<wire x1="-8.255" y1="5.715" x2="8.255" y2="5.715" width="0.4064" layer="51"/>
<wire x1="-8.255" y1="-15.24" x2="-6.985" y2="-15.24" width="0.4064" layer="51"/>
<wire x1="-6.985" y1="-15.24" x2="-2.54" y2="-15.24" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-15.24" x2="2.54" y2="-15.24" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-15.24" x2="6.985" y2="-15.24" width="0.4064" layer="51"/>
<wire x1="6.985" y1="-15.24" x2="8.255" y2="-15.24" width="0.4064" layer="51"/>
<wire x1="-6.985" y1="-15.24" x2="-6.985" y2="-13.97" width="0.254" layer="51"/>
<wire x1="-6.985" y1="-13.97" x2="-2.54" y2="-13.97" width="0.254" layer="51"/>
<wire x1="-2.54" y1="-13.97" x2="2.54" y2="-13.97" width="0.254" layer="51"/>
<wire x1="2.54" y1="-13.97" x2="6.985" y2="-13.97" width="0.254" layer="51"/>
<wire x1="6.985" y1="-13.97" x2="6.985" y2="-15.24" width="0.254" layer="51"/>
<wire x1="-2.54" y1="-13.97" x2="-2.54" y2="-15.24" width="0.254" layer="51"/>
<wire x1="2.54" y1="-13.97" x2="2.54" y2="-15.24" width="0.254" layer="51"/>
<wire x1="-7.9375" y1="-7.62" x2="-5.715" y2="-5.3975" width="1.016" layer="16" curve="-90" cap="flat"/>
<wire x1="-5.715" y1="-9.8425" x2="-3.4925" y2="-7.62" width="1.016" layer="16" curve="90" cap="flat"/>
<wire x1="-7.9375" y1="-7.62" x2="-5.715" y2="-5.3975" width="1.016" layer="1" curve="-90" cap="flat"/>
<wire x1="-5.715" y1="-9.8425" x2="-3.4925" y2="-7.62" width="1.016" layer="1" curve="90" cap="flat"/>
<wire x1="3.4925" y1="-7.62" x2="5.715" y2="-5.3975" width="1.016" layer="16" curve="-90" cap="flat"/>
<wire x1="5.715" y1="-9.8425" x2="7.9375" y2="-7.62" width="1.016" layer="16" curve="90" cap="flat"/>
<wire x1="3.4925" y1="-7.62" x2="5.715" y2="-5.3975" width="1.016" layer="1" curve="-90" cap="flat"/>
<wire x1="5.715" y1="-9.8425" x2="7.9375" y2="-7.62" width="1.016" layer="1" curve="90" cap="flat"/>
<wire x1="-8.255" y1="5.715" x2="-8.255" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-8.255" y1="5.715" x2="8.255" y2="5.715" width="0.254" layer="21"/>
<wire x1="8.255" y1="5.715" x2="8.255" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-8.255" y1="-6.35" x2="-8.255" y2="-15.24" width="0.254" layer="21"/>
<wire x1="-8.255" y1="-15.24" x2="8.255" y2="-15.24" width="0.254" layer="21"/>
<wire x1="8.255" y1="-15.24" x2="8.255" y2="-6.35" width="0.254" layer="21"/>
<circle x="-4.445" y="-1.27" radius="0.3175" width="0" layer="51"/>
<circle x="-3.175" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="-0.635" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="1.905" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="4.445" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="-1.905" y="-1.27" radius="0.3175" width="0" layer="51"/>
<circle x="0.635" y="-1.27" radius="0.3175" width="0" layer="51"/>
<circle x="3.175" y="-1.27" radius="0.3175" width="0" layer="51"/>
<circle x="-5.715" y="-7.62" radius="1.27" width="0.254" layer="51"/>
<circle x="5.715" y="-7.62" radius="1.27" width="0.254" layer="51"/>
<circle x="-7.62" y="-4.445" radius="0.635" width="0.254" layer="51"/>
<circle x="7.62" y="-4.445" radius="0.635" width="0.254" layer="51"/>
<circle x="-5.715" y="-7.62" radius="2.8575" width="0.4064" layer="16"/>
<circle x="-5.715" y="-7.62" radius="1.5875" width="0.4064" layer="16"/>
<circle x="-5.715" y="-7.62" radius="2.8575" width="0.4064" layer="1"/>
<circle x="-5.715" y="-7.62" radius="1.5875" width="0.4064" layer="1"/>
<circle x="5.715" y="-7.62" radius="2.8575" width="0.4064" layer="16"/>
<circle x="5.715" y="-7.62" radius="1.5875" width="0.4064" layer="16"/>
<circle x="5.715" y="-7.62" radius="2.8575" width="0.4064" layer="1"/>
<circle x="5.715" y="-7.62" radius="1.5875" width="0.4064" layer="1"/>
<pad name="1" x="-4.445" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90" first="yes"/>
<pad name="2" x="-3.175" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="3" x="-1.905" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="4" x="-0.635" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="5" x="0.635" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="6" x="1.905" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="7" x="3.175" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="8" x="4.445" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="GND2" x="7.62" y="-4.445" drill="1.651" diameter="3.048"/>
<pad name="GND1" x="-7.62" y="-4.445" drill="1.651" diameter="3.048"/>
<text x="-7.3025" y="3.81" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-7.3025" y="3.81" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-5.715" y="-1.905" size="1.016" layer="51" font="vector" ratio="16">1</text>
<text x="5.08" y="0.635" size="1.016" layer="51" font="vector" ratio="16">8</text>
<text x="-4.7625" y="0.635" size="1.016" layer="51" font="vector" ratio="16">2</text>
<text x="3.81" y="-1.905" size="1.016" layer="51" font="vector" ratio="16">7</text>
<text x="-8.255" y="6.35" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-8.255" y="-17.145" size="1.27" layer="21" font="vector" ratio="16">&gt;VALUE</text>
<hole x="-5.715" y="-7.62" drill="2.6924"/>
<hole x="5.715" y="-7.62" drill="2.6924"/>
</package>
<package name="XS08-RJ45">
<description>&lt;div align=left&gt;&lt;b&gt;RJ-45 connector&lt;/b&gt;, horizontal mount&lt;br&gt;
FCC68 standard, 8 pins&lt;br&gt;
&amp;nbsp;- Würth: 615 008 142 21&lt;/div&gt;</description>
<wire x1="7.9375" y1="-15.478125" x2="7.9375" y2="2.936875" width="0.4064" layer="51"/>
<wire x1="-7.9375" y1="-15.478125" x2="-7.9375" y2="2.936875" width="0.4064" layer="51"/>
<wire x1="-7.9375" y1="2.936875" x2="7.9375" y2="2.936875" width="0.4064" layer="51"/>
<wire x1="-7.9375" y1="-15.478125" x2="-6.985" y2="-15.478125" width="0.4064" layer="51"/>
<wire x1="-6.985" y1="-15.478125" x2="-2.54" y2="-15.478125" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-15.478125" x2="2.54" y2="-15.478125" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-15.478125" x2="6.985" y2="-15.478125" width="0.4064" layer="51"/>
<wire x1="6.985" y1="-15.478125" x2="7.9375" y2="-15.478125" width="0.4064" layer="51"/>
<wire x1="-6.985" y1="-15.478125" x2="-6.985" y2="-14.208125" width="0.254" layer="51"/>
<wire x1="-6.985" y1="-14.208125" x2="-2.54" y2="-14.208125" width="0.254" layer="51"/>
<wire x1="-2.54" y1="-14.208125" x2="2.54" y2="-14.208125" width="0.254" layer="51"/>
<wire x1="2.54" y1="-14.208125" x2="6.985" y2="-14.208125" width="0.254" layer="51"/>
<wire x1="6.985" y1="-14.208125" x2="6.985" y2="-15.478125" width="0.254" layer="51"/>
<wire x1="-2.54" y1="-14.208125" x2="-2.54" y2="-15.478125" width="0.254" layer="51"/>
<wire x1="2.54" y1="-14.208125" x2="2.54" y2="-15.478125" width="0.254" layer="51"/>
<wire x1="-7.9375" y1="2.936875" x2="-7.9375" y2="-10.31875" width="0.254" layer="21"/>
<wire x1="-7.9375" y1="2.936875" x2="7.9375" y2="2.936875" width="0.254" layer="21"/>
<wire x1="7.9375" y1="2.936875" x2="7.9375" y2="-10.31875" width="0.254" layer="21"/>
<wire x1="-7.9375" y1="-14.12875" x2="-7.9375" y2="-15.478125" width="0.254" layer="21"/>
<wire x1="-7.9375" y1="-15.478125" x2="7.9375" y2="-15.478125" width="0.254" layer="21"/>
<wire x1="7.9375" y1="-15.478125" x2="7.9375" y2="-14.12875" width="0.254" layer="21"/>
<circle x="-4.445" y="-1.27" radius="0.3175" width="0" layer="51"/>
<circle x="-3.175" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="-0.635" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="1.905" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="4.445" y="1.27" radius="0.3175" width="0" layer="51"/>
<circle x="-1.905" y="-1.27" radius="0.3175" width="0" layer="51"/>
<circle x="0.635" y="-1.27" radius="0.3175" width="0" layer="51"/>
<circle x="3.175" y="-1.27" radius="0.3175" width="0" layer="51"/>
<pad name="1" x="-4.445" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90" first="yes"/>
<pad name="2" x="-3.175" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="3" x="-1.905" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="4" x="-0.635" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="5" x="0.635" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="6" x="1.905" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="7" x="3.175" y="-1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="8" x="4.445" y="1.27" drill="0.889" diameter="1.27" shape="long" rot="R90"/>
<pad name="CASE2" x="7.699375" y="-12.1840625" drill="1.6002" diameter="3.048"/>
<pad name="CASE1" x="-7.699375" y="-12.1840625" drill="1.6002" diameter="3.048"/>
<text x="-0.3175" y="-6.0325" size="1.27" layer="25" font="vector" ratio="16" align="center">&gt;NAME</text>
<text x="-0.3175" y="-6.0325" size="1.27" layer="27" font="vector" ratio="16" align="center">&gt;VALUE</text>
<text x="-5.715" y="-1.905" size="1.016" layer="51" font="vector" ratio="16">1</text>
<text x="5.08" y="0.635" size="1.016" layer="51" font="vector" ratio="16">8</text>
<text x="-4.7625" y="0.635" size="1.016" layer="51" font="vector" ratio="16">2</text>
<text x="3.81" y="-1.905" size="1.016" layer="51" font="vector" ratio="16">7</text>
<text x="-8.016875" y="3.254375" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-8.016875" y="-15.795625" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<hole x="-5.715" y="-7.62" drill="3.0226"/>
<hole x="5.715" y="-7.62" drill="3.0226"/>
<circle x="-7.699375" y="-12.1840625" radius="0.3175" width="0" layer="51"/>
<circle x="7.699375" y="-12.1840625" radius="0.3175" width="0" layer="51"/>
<polygon width="0.254" layer="1">
<vertex x="-8.89" y="-1.42875"/>
<vertex x="-8.89" y="-13.97"/>
<vertex x="8.89" y="-13.97"/>
<vertex x="8.89" y="-1.42875"/>
<vertex x="6.35" y="-1.42875"/>
<vertex x="6.35" y="-4.445"/>
<vertex x="8.255" y="-6.35"/>
<vertex x="8.255" y="-8.89"/>
<vertex x="5.08" y="-12.065"/>
<vertex x="-5.08" y="-12.065"/>
<vertex x="-8.255" y="-8.89"/>
<vertex x="-8.255" y="-6.35"/>
<vertex x="-6.35" y="-4.445"/>
<vertex x="-6.35" y="-1.42875"/>
</polygon>
<rectangle x1="-8.73125" y1="-15.71625" x2="8.73125" y2="-14.12875" layer="41"/>
<rectangle x1="-7.62" y1="-12.7" x2="7.62" y2="-4.7625" layer="41"/>
</package>
<package name="X05-SIL-MALE-VERT-L">
<description>&lt;div align=left&gt;&lt;b&gt;Pin header&lt;/b&gt; 5 pins (male), SIL, long pads&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="6.35" y1="1.27" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.7463" x2="6.35" y2="1.7463" width="0.254" layer="21"/>
<wire x1="6.35" y1="1.7463" x2="6.35" y2="-1.7463" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.7463" x2="-6.35" y2="-1.7463" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.7463" x2="-6.35" y2="1.7463" width="0.254" layer="21"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<text x="-6.35" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.35" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="2.06375" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.6675" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-2.06375" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
</package>
<package name="X05-SIL-MALE-VERT-N">
<description>&lt;div align=left&gt;&lt;b&gt;Pin header&lt;/b&gt; 5 pins (male), SIL&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="6.35" y1="1.27" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.4293" y1="1.3494" x2="6.4294" y2="1.3494" width="0.254" layer="21"/>
<wire x1="6.4294" y1="1.3494" x2="6.4294" y2="-1.3493" width="0.254" layer="21"/>
<wire x1="6.4294" y1="-1.3493" x2="-6.4293" y2="-1.3493" width="0.254" layer="21"/>
<wire x1="-6.4293" y1="-1.3493" x2="-6.4293" y2="1.3494" width="0.254" layer="21"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="2.032"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="2.032" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="2.032"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="2.032"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="2.032"/>
<text x="-6.35" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.35" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.5087" y="1.74625" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.8262" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.5088" y="-1.74625" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
</package>
<package name="X05-SIL-MALE-VERT-R">
<description>&lt;div align=left&gt;&lt;b&gt;Pin header&lt;/b&gt; 5 pins (male), SIL, reduced pads&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="6.35" y1="1.27" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="1.27" x2="6.35" y2="-1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.27" x2="-6.35" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.27" x2="-6.35" y2="1.27" width="0.254" layer="21"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="1.397" shape="square" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<text x="-6.35" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.35" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="1.5875" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.6675" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-1.5875" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
</package>
<package name="X05-BROWN-VERT-L">
<description>&lt;div align=left&gt;&lt;b&gt;Connector&lt;/b&gt; 5 pins, SIL, long pads&lt;br&gt;
Coded, 12.8*6.0mm&lt;br&gt;
&amp;nbsp; - Brown Reichelt type&lt;/div&gt;</description>
<wire x1="-6.5088" y1="3.175" x2="-6.5088" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-6.5088" y1="-2.54" x2="-6.5088" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-6.5088" y1="-3.175" x2="6.5087" y2="-3.175" width="0.254" layer="21"/>
<wire x1="6.5087" y1="-3.175" x2="6.5087" y2="3.175" width="0.254" layer="21"/>
<wire x1="6.5087" y1="3.175" x2="-6.5088" y2="3.175" width="0.254" layer="21"/>
<wire x1="6.5088" y1="-3.175" x2="6.5088" y2="-1.905" width="0.4064" layer="51"/>
<wire x1="6.5088" y1="-1.905" x2="6.5088" y2="3.175" width="0.4064" layer="51"/>
<wire x1="6.5088" y1="3.175" x2="-6.5087" y2="3.175" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="3.175" x2="-6.5087" y2="-1.905" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="-1.905" x2="-6.5087" y2="-3.175" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="-3.175" x2="6.5088" y2="-3.175" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="-1.905" x2="-1.27" y2="-1.905" width="0.254" layer="51"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="-2.54" width="0.254" layer="51"/>
<wire x1="-1.27" y1="-2.54" x2="1.27" y2="-2.54" width="0.254" layer="51"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="-1.905" width="0.254" layer="51"/>
<wire x1="1.27" y1="-1.905" x2="6.5088" y2="-1.905" width="0.254" layer="51"/>
<wire x1="-6.5088" y1="-2.54" x2="6.5088" y2="-2.54" width="0.254" layer="21"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<text x="-6.5088" y="3.4925" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-7.7788" y="-0.635" size="1.27" layer="21" font="vector" ratio="16">1</text>
<text x="-6.5088" y="-4.7625" size="1.27" layer="21" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.5088" y="3.6514" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.5088" y="3.6514" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
</package>
<package name="X05-BROWN-VERT-N">
<description>&lt;div align=left&gt;&lt;b&gt;Connector&lt;/b&gt; 5 pins, SIL, long pads&lt;br&gt;
Coded, 12.8*6.0mm&lt;br&gt;
&amp;nbsp; - Brown Reichelt type&lt;/div&gt;</description>
<wire x1="-6.5088" y1="3.175" x2="-6.5088" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-6.5088" y1="-2.54" x2="-6.5088" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-6.5088" y1="-3.175" x2="6.5087" y2="-3.175" width="0.254" layer="21"/>
<wire x1="6.5087" y1="-3.175" x2="6.5087" y2="3.175" width="0.254" layer="21"/>
<wire x1="6.5087" y1="3.175" x2="-6.5088" y2="3.175" width="0.254" layer="21"/>
<wire x1="6.5088" y1="-3.175" x2="6.5088" y2="-1.905" width="0.4064" layer="51"/>
<wire x1="6.5088" y1="-1.905" x2="6.5088" y2="3.175" width="0.4064" layer="51"/>
<wire x1="6.5088" y1="3.175" x2="-6.5087" y2="3.175" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="3.175" x2="-6.5087" y2="-1.905" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="-1.905" x2="-6.5087" y2="-3.175" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="-3.175" x2="6.5088" y2="-3.175" width="0.4064" layer="51"/>
<wire x1="-6.5087" y1="-1.905" x2="-1.27" y2="-1.905" width="0.254" layer="51"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="-2.54" width="0.254" layer="51"/>
<wire x1="-1.27" y1="-2.54" x2="1.27" y2="-2.54" width="0.254" layer="51"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="-1.905" width="0.254" layer="51"/>
<wire x1="1.27" y1="-1.905" x2="6.5088" y2="-1.905" width="0.254" layer="51"/>
<wire x1="-6.5088" y1="-2.54" x2="6.5088" y2="-2.54" width="0.254" layer="21"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="2.032"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="2.032" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="2.032"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="2.032"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="2.032"/>
<text x="-6.5088" y="3.4925" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-7.7788" y="-0.635" size="1.27" layer="21" font="vector" ratio="16">1</text>
<text x="-6.5088" y="-4.7625" size="1.27" layer="21" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.5088" y="3.6514" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.5088" y="3.6514" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
</package>
<package name="X05-SCREW">
<description>&lt;div align=left&gt;&lt;b&gt;Screw terminal&lt;/b&gt; 5 pins, 0.2" grid&lt;/div&gt;</description>
<wire x1="-12.7" y1="5.08" x2="12.7" y2="5.08" width="0.4064" layer="51"/>
<wire x1="12.7" y1="5.08" x2="12.7" y2="2.54" width="0.4064" layer="51"/>
<wire x1="12.7" y1="2.54" x2="12.7" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="12.7" y1="-2.54" x2="12.7" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="12.7" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="1.27" y1="-5.08" x2="-1.27" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="-1.27" y1="-5.08" x2="-3.81" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="-3.81" y1="-5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-5.08" x2="-8.89" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="-8.89" y1="-5.08" x2="-11.43" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="-11.43" y1="-5.08" x2="-12.7" y2="-5.08" width="0.4064" layer="51"/>
<wire x1="-12.7" y1="-5.08" x2="-12.7" y2="-3.81" width="0.4064" layer="51"/>
<wire x1="-12.7" y1="-3.81" x2="-12.7" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="-12.7" y1="-2.54" x2="-12.7" y2="2.54" width="0.4064" layer="51"/>
<wire x1="-12.7" y1="2.54" x2="-12.7" y2="3.81" width="0.4064" layer="51"/>
<wire x1="-12.7" y1="3.81" x2="-12.7" y2="5.08" width="0.4064" layer="51"/>
<wire x1="-12.7" y1="2.54" x2="12.7" y2="2.54" width="0.254" layer="51"/>
<wire x1="-12.7" y1="-2.54" x2="12.7" y2="-2.54" width="0.254" layer="51"/>
<wire x1="-12.7" y1="3.81" x2="-13.335" y2="3.81" width="0.254" layer="51"/>
<wire x1="-13.335" y1="3.81" x2="-13.335" y2="2.54" width="0.254" layer="51"/>
<wire x1="-13.335" y1="2.54" x2="-12.7" y2="2.54" width="0.254" layer="51"/>
<wire x1="-12.7" y1="-2.54" x2="-13.335" y2="-2.54" width="0.254" layer="51"/>
<wire x1="-13.335" y1="-2.54" x2="-13.335" y2="-3.81" width="0.254" layer="51"/>
<wire x1="-13.335" y1="-3.81" x2="-12.7" y2="-3.81" width="0.254" layer="51"/>
<wire x1="-11.43" y1="-5.08" x2="-10.795" y2="-4.445" width="0.254" layer="51"/>
<wire x1="-10.795" y1="-4.445" x2="-9.525" y2="-4.445" width="0.254" layer="51"/>
<wire x1="-9.525" y1="-4.445" x2="-8.89" y2="-5.08" width="0.254" layer="51"/>
<wire x1="-6.35" y1="-5.08" x2="-5.715" y2="-4.445" width="0.254" layer="51"/>
<wire x1="-5.715" y1="-4.445" x2="-4.445" y2="-4.445" width="0.254" layer="51"/>
<wire x1="-4.445" y1="-4.445" x2="-3.81" y2="-5.08" width="0.254" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="-3.81" y2="1.27" width="0.508" layer="51"/>
<wire x1="-11.43" y1="-1.27" x2="-8.89" y2="1.27" width="0.508" layer="51"/>
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="1.27" width="0.508" layer="51"/>
<wire x1="-1.27" y1="-5.08" x2="-0.635" y2="-4.445" width="0.254" layer="51"/>
<wire x1="-0.635" y1="-4.445" x2="0.635" y2="-4.445" width="0.254" layer="51"/>
<wire x1="0.635" y1="-4.445" x2="1.27" y2="-5.08" width="0.254" layer="51"/>
<wire x1="-12.7" y1="5.08" x2="12.7" y2="5.08" width="0.254" layer="21"/>
<wire x1="12.7" y1="5.08" x2="12.7" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-1.27" y1="-5.08" x2="-3.81" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-5.08" x2="-8.89" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-11.43" y1="-5.08" x2="-12.7" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-12.7" y1="-5.08" x2="-12.7" y2="5.08" width="0.254" layer="21"/>
<wire x1="-11.43" y1="-5.08" x2="-10.795" y2="-4.445" width="0.254" layer="21"/>
<wire x1="-10.795" y1="-4.445" x2="-9.525" y2="-4.445" width="0.254" layer="21"/>
<wire x1="-9.525" y1="-4.445" x2="-8.89" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-5.08" x2="-5.715" y2="-4.445" width="0.254" layer="21"/>
<wire x1="-5.715" y1="-4.445" x2="-4.445" y2="-4.445" width="0.254" layer="21"/>
<wire x1="-4.445" y1="-4.445" x2="-3.81" y2="-5.08" width="0.254" layer="21"/>
<wire x1="-1.27" y1="-5.08" x2="-0.635" y2="-4.445" width="0.254" layer="21"/>
<wire x1="-0.635" y1="-4.445" x2="0.635" y2="-4.445" width="0.254" layer="21"/>
<wire x1="0.635" y1="-4.445" x2="1.27" y2="-5.08" width="0.254" layer="21"/>
<wire x1="8.89" y1="-1.27" x2="11.43" y2="1.27" width="0.508" layer="51"/>
<wire x1="3.81" y1="-1.27" x2="6.35" y2="1.27" width="0.508" layer="51"/>
<wire x1="3.81" y1="-5.08" x2="4.445" y2="-4.445" width="0.254" layer="51"/>
<wire x1="4.445" y1="-4.445" x2="5.715" y2="-4.445" width="0.254" layer="51"/>
<wire x1="5.715" y1="-4.445" x2="6.35" y2="-5.08" width="0.254" layer="51"/>
<wire x1="8.89" y1="-5.08" x2="9.525" y2="-4.445" width="0.254" layer="51"/>
<wire x1="9.525" y1="-4.445" x2="10.795" y2="-4.445" width="0.254" layer="51"/>
<wire x1="10.795" y1="-4.445" x2="11.43" y2="-5.08" width="0.254" layer="51"/>
<wire x1="8.89" y1="-5.08" x2="6.35" y2="-5.08" width="0.254" layer="21"/>
<wire x1="3.81" y1="-5.08" x2="1.27" y2="-5.08" width="0.254" layer="21"/>
<wire x1="3.81" y1="-5.08" x2="4.445" y2="-4.445" width="0.254" layer="21"/>
<wire x1="4.445" y1="-4.445" x2="5.715" y2="-4.445" width="0.254" layer="21"/>
<wire x1="5.715" y1="-4.445" x2="6.35" y2="-5.08" width="0.254" layer="21"/>
<wire x1="8.89" y1="-5.08" x2="9.525" y2="-4.445" width="0.254" layer="21"/>
<wire x1="9.525" y1="-4.445" x2="10.795" y2="-4.445" width="0.254" layer="21"/>
<wire x1="10.795" y1="-4.445" x2="11.43" y2="-5.08" width="0.254" layer="21"/>
<wire x1="12.7" y1="-5.08" x2="11.43" y2="-5.08" width="0.254" layer="21"/>
<circle x="-5.08" y="0" radius="1.905" width="0.254" layer="51"/>
<circle x="-10.16" y="0" radius="1.905" width="0.254" layer="51"/>
<circle x="0" y="0" radius="1.905" width="0.254" layer="51"/>
<circle x="10.16" y="0" radius="1.905" width="0.254" layer="51"/>
<circle x="5.08" y="0" radius="1.905" width="0.254" layer="51"/>
<pad name="1" x="-10.16" y="0" drill="1.2954" diameter="2.794" first="yes"/>
<pad name="2" x="-5.08" y="0" drill="1.2954" diameter="2.794"/>
<pad name="3" x="0" y="0" drill="1.2954" diameter="2.794"/>
<pad name="4" x="5.08" y="0" drill="1.2954" diameter="2.794" first="yes"/>
<pad name="5" x="10.16" y="0" drill="1.2954" diameter="2.794"/>
<text x="-12.065" y="3.175" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-12.065" y="3.175" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-14.4463" y="5.08" size="1.27" layer="21" font="vector" ratio="16" rot="R270">&gt;NAME</text>
<text x="13.1763" y="4.9212" size="1.27" layer="21" font="vector" ratio="16" rot="R270">&gt;VALUE</text>
</package>
<package name="X05-SIL-FEMALE-HORZ-L">
<description>&lt;div align=left&gt;&lt;b&gt;Socket header&lt;/b&gt; 5 receptacles (female), angled, SIL, long pads&lt;/div&gt;</description>
<wire x1="6.35" y1="1.27" x2="6.35" y2="8.255" width="0.4064" layer="51"/>
<wire x1="6.35" y1="8.255" x2="-6.35" y2="8.255" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="8.255" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="1.27" x2="-2.54" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="0" y2="1.27" width="0.4064" layer="51"/>
<wire x1="0" y1="1.27" x2="2.54" y2="1.27" width="0.4064" layer="51"/>
<wire x1="2.54" y1="1.27" x2="5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="5.08" y1="1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="8.255" x2="6.35" y2="8.255" width="0.254" layer="21"/>
<wire x1="6.35" y1="8.255" x2="6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="1.27" x2="6.19125" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="1.27" x2="-6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="8.255" width="0.254" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.1524" layer="51"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="5.08" y1="1.27" x2="5.08" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90" first="yes"/>
<pad name="3" x="0" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R270"/>
<text x="-5.715" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-5.715" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-2.06375" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;NAME</text>
<text x="-6.50875" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-3.4925" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<wire x1="-6.19125" y1="1.27" x2="-6.19125" y2="-1.74625" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="-1.74625" x2="6.19125" y2="-1.74625" width="0.254" layer="21"/>
<wire x1="6.19125" y1="-1.74625" x2="6.19125" y2="1.27" width="0.254" layer="21"/>
</package>
<package name="X05-SIL-MALE-HORZ-L">
<description>&lt;div align=left&gt;&lt;b&gt;Pin header&lt;/b&gt; 5 pins (male), angled, SIL, long pads&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.5875" x2="6.35" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="6.35" y1="-4.1275" x2="5.08" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-4.1275" x2="2.54" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-4.1275" x2="0" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="0" y1="-4.1275" x2="-2.54" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-4.1275" x2="-5.08" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-4.1275" x2="-6.35" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-4.1275" x2="-6.35" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.5875" x2="-5.08" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-1.5875" x2="-2.54" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-1.5875" x2="0" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="0" y1="-1.5875" x2="2.54" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-1.5875" x2="5.08" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-1.5875" x2="6.35" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-4.1275" x2="6.35" y2="-4.1275" width="0.254" layer="21"/>
<wire x1="6.35" y1="-4.1275" x2="6.35" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.5875" x2="6.19125" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="-1.5875" x2="-6.35" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.5875" x2="-6.35" y2="-4.1275" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-1.5875" x2="-5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.5875" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="-1.5875" x2="0" y2="0" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.5875" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-1.5875" x2="5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="-10.00125" x2="-5.08" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-10.00125" x2="-2.54" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="0" y1="-10.00125" x2="0" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-10.00125" x2="2.54" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-10.00125" x2="5.08" y2="-4.1275" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<text x="-5.715" y="-2.8575" size="1.27" layer="25" font="vector" ratio="16" align="center-left">&gt;NAME</text>
<text x="-5.715" y="-2.8575" size="1.27" layer="27" font="vector" ratio="16" align="center-left">&gt;VALUE</text>
<text x="-5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="2.06375" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.50875" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="3.4925" size="1.27" layer="21" font="vector" ratio="16">&gt;VALUE</text>
<text x="5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<wire x1="-6.19125" y1="-1.5875" x2="-6.19125" y2="1.74625" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="1.74625" x2="6.19125" y2="1.74625" width="0.254" layer="21"/>
<wire x1="6.19125" y1="1.74625" x2="6.19125" y2="-1.5875" width="0.254" layer="21"/>
</package>
<package name="X05-SIL-FEMALE-VERT-N">
<description>&lt;div align=left&gt;&lt;b&gt;Socket header&lt;/b&gt; 5 receptacles (female), SIL&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="6.35" y1="1.27" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.50875" y1="1.42875" x2="6.50875" y2="1.42875" width="0.254" layer="21"/>
<wire x1="6.50875" y1="1.42875" x2="6.50875" y2="-1.42875" width="0.254" layer="21"/>
<wire x1="6.50875" y1="-1.42875" x2="-6.50875" y2="-1.42875" width="0.254" layer="21"/>
<wire x1="-6.50875" y1="-1.42875" x2="-6.50875" y2="1.42875" width="0.254" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="2.032" first="yes"/>
<pad name="3" x="0" y="0" drill="0.8128" diameter="2.032"/>
<pad name="5" x="5.08" y="0" drill="0.8128" diameter="2.032"/>
<pad name="2" x="-2.54" y="0" drill="0.8128" diameter="2.032"/>
<pad name="4" x="2.54" y="0" drill="0.8128" diameter="2.032"/>
<text x="6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<circle x="-5.08" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="0" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="5.08" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="-2.54" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="2.54" y="0" radius="0.635" width="0.4064" layer="51"/>
<text x="-6.35" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.35" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.50875" y="1.74625" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.82625" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.50875" y="-1.74625" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
</package>
<package name="X05-SIL-FEMALE-VERT-L">
<description>&lt;div align=left&gt;&lt;b&gt;Socket header&lt;/b&gt; 5 receptacles (female), SIL, long pads&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="6.35" y1="1.27" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.74625" x2="6.35" y2="1.74625" width="0.254" layer="21"/>
<wire x1="6.35" y1="1.74625" x2="6.35" y2="-1.74625" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.74625" x2="-6.35" y2="-1.74625" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.74625" x2="-6.35" y2="1.74625" width="0.254" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90" first="yes"/>
<pad name="3" x="0" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="0.8128" diameter="1.397" shape="long" rot="R90"/>
<text x="6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<circle x="-5.08" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="0" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="5.08" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="-2.54" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="2.54" y="0" radius="0.635" width="0.4064" layer="51"/>
<text x="-6.35" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.35" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="2.06375" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.6675" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-2.06375" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
</package>
<package name="X05-SIL-FEMALE-VERT-R">
<description>&lt;div align=left&gt;&lt;b&gt;Socket header&lt;/b&gt; 5 receptacles (female), SIL, reduced pads&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="6.35" y1="1.27" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="1.27" x2="6.35" y2="-1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.27" x2="-6.35" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.27" x2="-6.35" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.397" shape="square" first="yes"/>
<pad name="3" x="0" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<pad name="5" x="5.08" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<pad name="2" x="-2.54" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<pad name="4" x="2.54" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<text x="6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<circle x="-5.08" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="0" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="5.08" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="-2.54" y="0" radius="0.635" width="0.4064" layer="51"/>
<circle x="2.54" y="0" radius="0.635" width="0.4064" layer="51"/>
<text x="-6.35" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.35" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-6.985" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="1.5875" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.6675" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-1.5875" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
</package>
<package name="X05-SIL-FEMALE-HORZ-N">
<description>&lt;div align=left&gt;&lt;b&gt;Socket header&lt;/b&gt; 5 receptacles (female), angled, SIL&lt;/div&gt;</description>
<wire x1="6.35" y1="1.27" x2="6.35" y2="8.255" width="0.4064" layer="51"/>
<wire x1="6.35" y1="8.255" x2="-6.35" y2="8.255" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="8.255" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="1.27" x2="-2.54" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="0" y2="1.27" width="0.4064" layer="51"/>
<wire x1="0" y1="1.27" x2="2.54" y2="1.27" width="0.4064" layer="51"/>
<wire x1="2.54" y1="1.27" x2="5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="5.08" y1="1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="8.255" x2="6.35" y2="8.255" width="0.254" layer="21"/>
<wire x1="6.35" y1="8.255" x2="6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="1.27" x2="6.19125" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="1.27" x2="-6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="8.255" width="0.254" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.1524" layer="51"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="5.08" y1="1.27" x2="5.08" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="2.032" first="yes"/>
<pad name="3" x="0" y="0" drill="0.8128" diameter="2.032"/>
<pad name="5" x="5.08" y="0" drill="0.8128" diameter="2.032"/>
<pad name="2" x="-2.54" y="0" drill="0.8128" diameter="2.032"/>
<pad name="4" x="2.54" y="0" drill="0.8128" diameter="2.032"/>
<text x="-5.715" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-5.715" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-1.74625" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;NAME</text>
<text x="-6.50875" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-3.33375" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<wire x1="-6.19125" y1="1.27" x2="-6.19125" y2="0.79375" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="-0.79375" x2="-6.19125" y2="-1.42875" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="-1.42875" x2="6.19125" y2="-1.42875" width="0.254" layer="21"/>
<wire x1="6.19125" y1="-1.42875" x2="6.19125" y2="-0.79375" width="0.254" layer="21"/>
<wire x1="6.19125" y1="0.79375" x2="6.19125" y2="1.27" width="0.254" layer="21"/>
</package>
<package name="X05-SIL-FEMALE-HORZ-R">
<description>&lt;div align=left&gt;&lt;b&gt;Socket header&lt;/b&gt; 5 receptacles (female), angled, SIL, reduced pads&lt;/div&gt;</description>
<wire x1="6.35" y1="1.27" x2="6.35" y2="8.255" width="0.4064" layer="51"/>
<wire x1="6.35" y1="8.255" x2="-6.35" y2="8.255" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="8.255" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="1.27" x2="-2.54" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="0" y2="1.27" width="0.4064" layer="51"/>
<wire x1="0" y1="1.27" x2="2.54" y2="1.27" width="0.4064" layer="51"/>
<wire x1="2.54" y1="1.27" x2="5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="5.08" y1="1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="8.255" x2="6.35" y2="8.255" width="0.254" layer="21"/>
<wire x1="6.35" y1="8.255" x2="6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="1.27" x2="6.19125" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="1.27" x2="-6.35" y2="1.27" width="0.254" layer="21"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="8.255" width="0.254" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.1524" layer="51"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="5.08" y1="1.27" x2="5.08" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.397" shape="square" first="yes"/>
<pad name="3" x="0" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<pad name="5" x="5.08" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<pad name="2" x="-2.54" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<pad name="4" x="2.54" y="0" drill="0.8128" diameter="1.397" shape="square"/>
<text x="-5.715" y="1.905" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-5.715" y="1.905" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-1.42875" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;NAME</text>
<text x="-6.50875" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="-2.8575" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<wire x1="-6.19125" y1="1.27" x2="-6.19125" y2="-1.11125" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="-1.11125" x2="6.19125" y2="-1.11125" width="0.254" layer="21"/>
<wire x1="6.19125" y1="-1.11125" x2="6.19125" y2="1.27" width="0.254" layer="21"/>
</package>
<package name="X05-SIL-MALE-HORZ-N">
<description>&lt;div align=left&gt;&lt;b&gt;Pin header&lt;/b&gt; 5 pins (male), angled, SIL&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.5875" x2="6.35" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="6.35" y1="-4.1275" x2="5.08" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-4.1275" x2="2.54" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-4.1275" x2="0" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="0" y1="-4.1275" x2="-2.54" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-4.1275" x2="-5.08" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-4.1275" x2="-6.35" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-4.1275" x2="-6.35" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.5875" x2="-5.08" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-1.5875" x2="-2.54" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-1.5875" x2="0" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="0" y1="-1.5875" x2="2.54" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-1.5875" x2="5.08" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-1.5875" x2="6.35" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-4.1275" x2="6.35" y2="-4.1275" width="0.254" layer="21"/>
<wire x1="6.35" y1="-4.1275" x2="6.35" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.5875" x2="6.19125" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="-1.5875" x2="-6.35" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.5875" x2="-6.35" y2="-4.1275" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-1.5875" x2="-5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.5875" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="-1.5875" x2="0" y2="0" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.5875" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-1.5875" x2="5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="-10.00125" x2="-5.08" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-10.00125" x2="-2.54" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="0" y1="-10.00125" x2="0" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-10.00125" x2="2.54" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-10.00125" x2="5.08" y2="-4.1275" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="2.032" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="2.032"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="2.032"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="2.032"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="2.032"/>
<text x="-5.715" y="-2.8575" size="1.27" layer="25" font="vector" ratio="16" align="center-left">&gt;NAME</text>
<text x="-5.715" y="-2.8575" size="1.27" layer="27" font="vector" ratio="16" align="center-left">&gt;VALUE</text>
<text x="-5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="1.74625" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.50875" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<wire x1="-6.19125" y1="-1.5875" x2="-6.19125" y2="-0.79375" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="0.79375" x2="-6.19125" y2="1.42875" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="1.42875" x2="6.19125" y2="1.42875" width="0.254" layer="21"/>
<wire x1="6.19125" y1="1.42875" x2="6.19125" y2="0.79375" width="0.254" layer="21"/>
<wire x1="6.19125" y1="-0.79375" x2="6.19125" y2="-1.5875" width="0.254" layer="21"/>
<text x="-6.35" y="3.175" size="1.27" layer="21" font="vector" ratio="16">&gt;VALUE</text>
</package>
<package name="X05-SIL-MALE-HORZ-R">
<description>&lt;div align=left&gt;&lt;b&gt;Pin header&lt;/b&gt; 5 pins (male), angled, SIL, reduced pads&lt;/div&gt;</description>
<wire x1="6.35" y1="-1.5875" x2="6.35" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="6.35" y1="-4.1275" x2="5.08" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-4.1275" x2="2.54" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-4.1275" x2="0" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="0" y1="-4.1275" x2="-2.54" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-4.1275" x2="-5.08" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-4.1275" x2="-6.35" y2="-4.1275" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-4.1275" x2="-6.35" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.5875" x2="-5.08" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-1.5875" x2="-2.54" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-2.54" y1="-1.5875" x2="0" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="0" y1="-1.5875" x2="2.54" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-1.5875" x2="5.08" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-1.5875" x2="6.35" y2="-1.5875" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-4.1275" x2="6.35" y2="-4.1275" width="0.254" layer="21"/>
<wire x1="6.35" y1="-4.1275" x2="6.35" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.5875" x2="6.19125" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="-1.5875" x2="-6.35" y2="-1.5875" width="0.254" layer="21"/>
<wire x1="-6.35" y1="-1.5875" x2="-6.35" y2="-4.1275" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-1.5875" x2="-5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.5875" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="-1.5875" x2="0" y2="0" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.5875" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-1.5875" x2="5.08" y2="0" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="-10.00125" x2="-5.08" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-10.00125" x2="-2.54" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="0" y1="-10.00125" x2="0" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-10.00125" x2="2.54" y2="-4.1275" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-10.00125" x2="5.08" y2="-4.1275" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="1.397" shape="square" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="1.397" shape="square"/>
<text x="-5.715" y="-2.8575" size="1.27" layer="25" font="vector" ratio="16" align="center-left">&gt;NAME</text>
<text x="-5.715" y="-2.8575" size="1.27" layer="27" font="vector" ratio="16" align="center-left">&gt;VALUE</text>
<text x="-5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.35" y="1.42875" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.50875" y="0" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="5.715" y="0" size="1.27" layer="51" font="vector" ratio="16" align="center-left">5</text>
<wire x1="-6.19125" y1="-1.5875" x2="-6.19125" y2="1.11125" width="0.254" layer="21"/>
<wire x1="-6.19125" y1="1.11125" x2="6.19125" y2="1.11125" width="0.254" layer="21"/>
<wire x1="6.19125" y1="1.11125" x2="6.19125" y2="-1.5875" width="0.254" layer="21"/>
<text x="-6.35" y="2.8575" size="1.27" layer="21" font="vector" ratio="16">&gt;VALUE</text>
</package>
<package name="X05-SIL-MALE-VERT-S">
<description>&lt;div align=left&gt;&lt;b&gt;Pin header&lt;/b&gt; 5 pins (male), SIL, alternating SMDs&lt;/div&gt;</description>
<smd name="1" x="-5.08" y="1.5875" dx="1.524" dy="3.81" layer="1"/>
<smd name="2" x="-2.54" y="-1.5875" dx="1.524" dy="3.81" layer="1"/>
<smd name="3" x="0" y="1.5875" dx="1.524" dy="3.81" layer="1"/>
<smd name="4" x="2.54" y="-1.5875" dx="1.524" dy="3.81" layer="1"/>
<smd name="5" x="5.08" y="1.5875" dx="1.524" dy="3.81" layer="1"/>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="6.35" y1="1.27" x2="5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="5.08" y1="1.27" x2="-5.08" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="1.27" x2="-6.35" y2="1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="1.27" x2="-6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="2.54" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="2.54" y1="-1.27" x2="6.35" y2="-1.27" width="0.4064" layer="51"/>
<wire x1="-6.35" y1="3.96875" x2="6.35" y2="3.96875" width="0.254" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="-3.96875" width="0.254" layer="21"/>
<wire x1="3.81" y1="-3.96875" x2="-3.81" y2="-3.96875" width="0.254" layer="21"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
<text x="-6.35" y="2.8575" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.35" y="2.8575" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-5.08" y="-1.905" size="1.27" layer="51" font="vector" ratio="16" align="top-center">1</text>
<text x="-3.81" y="-4.28625" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;NAME</text>
<text x="-5.08" y="-1.5875" size="1.27" layer="21" font="vector" ratio="16" align="top-center">1</text>
<text x="-6.35" y="4.28625" size="1.27" layer="21" font="vector" ratio="16">&gt;VALUE</text>
<wire x1="-6.35" y1="-1.27" x2="-6.35" y2="3.96875" width="0.254" layer="21"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="1.27" width="0.1524" layer="51"/>
<wire x1="0" y1="2.54" x2="0" y2="1.27" width="0.1524" layer="51"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="-6.35" y1="-1.27" x2="-3.81" y2="-1.27" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-1.27" x2="-3.81" y2="-3.96875" width="0.254" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="6.35" y2="-1.27" width="0.254" layer="21"/>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="3.96875" width="0.254" layer="21"/>
<text x="5.08" y="-1.905" size="1.27" layer="51" font="vector" ratio="16" align="top-center">5</text>
</package>
<package name="X05-WHITE-VERT-L">
<description>&lt;div align=left&gt;&lt;b&gt;Connector&lt;/b&gt; 5 pins, SIL, long pads&lt;br&gt;
Coded, 13.3*6.2mm&lt;br&gt;
&amp;nbsp; - White Reichelt type&lt;/div&gt;</description>
<wire x1="-6.6675" y1="-2.54" x2="-5.08" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-2.54" x2="6.6675" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="-1.905" width="0.254" layer="51"/>
<wire x1="-5.08" y1="-1.905" x2="5.08" y2="-1.905" width="0.254" layer="51"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="-2.54" width="0.254" layer="51"/>
<wire x1="-6.6676" y1="-2.54" x2="-6.6675" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-6.6675" y1="-2.54" x2="6.6673" y2="-2.54" width="0.254" layer="21"/>
<wire x1="6.6673" y1="-2.54" x2="6.6673" y2="3.4926" width="0.254" layer="21"/>
<wire x1="6.6673" y1="3.4926" x2="-6.6676" y2="3.4926" width="0.254" layer="21"/>
<wire x1="-6.6675" y1="3.4925" x2="6.6675" y2="3.4926" width="0.4064" layer="51"/>
<wire x1="6.6675" y1="3.4926" x2="6.6675" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="-6.6675" y1="-2.54" x2="-6.6675" y2="3.4925" width="0.4064" layer="51"/>
<wire x1="-6.6675" y1="-1.905" x2="6.6675" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-6.6675" y1="-2.54" x2="-6.6675" y2="-1.905" width="0.254" layer="21"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<text x="-6.6676" y="3.81" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.9851" y="0.0001" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.6675" y="-2.8575" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="-6.82625" y="3.96885" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.82625" y="3.96885" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-5.08" y="0.9525" size="1.27" layer="51" font="vector" ratio="16" align="bottom-center">1</text>
<wire x1="-6.6675" y1="-1.905" x2="-6.6675" y2="3.4925" width="0.254" layer="21"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="1.397" shape="long" rot="R90"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
</package>
<package name="X05-WHITE-VERT-N">
<description>&lt;div align=left&gt;&lt;b&gt;Connector&lt;/b&gt; 5 pins, SIL&lt;br&gt;
Coded, 13.3*6.2mm&lt;br&gt;
&amp;nbsp; - White Reichelt type&lt;/div&gt;</description>
<wire x1="-6.6675" y1="-2.54" x2="-5.08" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="5.08" y1="-2.54" x2="6.6675" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="-1.905" width="0.254" layer="51"/>
<wire x1="-5.08" y1="-1.905" x2="5.08" y2="-1.905" width="0.254" layer="51"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="-2.54" width="0.254" layer="51"/>
<wire x1="-6.6676" y1="-2.54" x2="-6.6675" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-6.6675" y1="-2.54" x2="6.6673" y2="-2.54" width="0.254" layer="21"/>
<wire x1="6.6673" y1="-2.54" x2="6.6673" y2="3.4926" width="0.254" layer="21"/>
<wire x1="6.6673" y1="3.4926" x2="-6.6676" y2="3.4926" width="0.254" layer="21"/>
<wire x1="-6.6675" y1="3.4925" x2="6.6675" y2="3.4926" width="0.4064" layer="51"/>
<wire x1="6.6675" y1="3.4926" x2="6.6675" y2="-2.54" width="0.4064" layer="51"/>
<wire x1="-6.6675" y1="-2.54" x2="-6.6675" y2="3.4925" width="0.4064" layer="51"/>
<wire x1="-6.6675" y1="-1.905" x2="6.6675" y2="-1.905" width="0.254" layer="21"/>
<wire x1="-6.6675" y1="-2.54" x2="-6.6675" y2="-1.905" width="0.254" layer="21"/>
<circle x="-2.54" y="0" radius="0.3175" width="0" layer="51"/>
<circle x="-5.08" y="0" radius="0.3175" width="0" layer="51"/>
<text x="-6.6676" y="3.81" size="1.27" layer="21" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.9851" y="0.0001" size="1.27" layer="21" font="vector" ratio="16" align="center-right">1</text>
<text x="-6.6675" y="-2.8575" size="1.27" layer="21" font="vector" ratio="16" align="top-left">&gt;VALUE</text>
<text x="-6.82625" y="3.96885" size="1.27" layer="25" font="vector" ratio="16">&gt;NAME</text>
<text x="-6.82625" y="3.96885" size="1.27" layer="27" font="vector" ratio="16">&gt;VALUE</text>
<text x="-5.08" y="0.9525" size="1.27" layer="51" font="vector" ratio="16" align="bottom-center">1</text>
<wire x1="-6.6675" y1="-1.905" x2="-6.6675" y2="3.4925" width="0.254" layer="21"/>
<pad name="2" x="-2.54" y="0" drill="0.9906" diameter="2.032" rot="R90"/>
<pad name="1" x="-5.08" y="0" drill="0.9906" diameter="2.032" rot="R90" first="yes"/>
<pad name="3" x="0" y="0" drill="0.9906" diameter="2.032" rot="R90"/>
<circle x="0" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="4" x="2.54" y="0" drill="0.9906" diameter="2.032" rot="R90"/>
<circle x="2.54" y="0" radius="0.3175" width="0" layer="51"/>
<pad name="5" x="5.08" y="0" drill="0.9906" diameter="2.032" rot="R90"/>
<circle x="5.08" y="0" radius="0.3175" width="0" layer="51"/>
</package>
<package name="X05-KGR50/6">
<pad name="1" x="-3.0310875" y="-1.749996875" drill="0.9906" diameter="2.54" rot="R120"/>
<pad name="2" x="-3.0310875" y="1.75" drill="0.9906" diameter="2.54" rot="R60"/>
<pad name="5" x="3.0310875" y="-1.749996875" drill="0.9906" diameter="2.54" rot="R240"/>
<pad name="4" x="3.0310875" y="1.75" drill="0.9906" diameter="2.54" rot="R300"/>
<pad name="3" x="0" y="3.5" drill="0.9906" diameter="2.54"/>
<circle x="0" y="0" radius="10" width="0.4064" layer="51"/>
<circle x="0" y="0" radius="9" width="0.4064" layer="51"/>
<circle x="0" y="0" radius="8" width="0.4064" layer="51"/>
<circle x="3.03108125" y="1.749996875" radius="1" width="0.4064" layer="51"/>
<circle x="3.031084375" y="-1.749996875" radius="1" width="0.4064" layer="51"/>
<circle x="-3.0310875" y="-1.749996875" radius="1" width="0.4064" layer="51"/>
<circle x="-3.0310875" y="1.75" radius="1" width="0.4064" layer="51"/>
<circle x="0" y="3.5" radius="1" width="0.4064" layer="51"/>
<wire x1="-1" y1="-6" x2="-1" y2="-4.5" width="0.4064" layer="51"/>
<wire x1="-1" y1="-4.5" x2="1" y2="-4.5" width="0.4064" layer="51"/>
<wire x1="1" y1="-4.5" x2="1" y2="-6" width="0.4064" layer="51"/>
<wire x1="-1" y1="-6" x2="1" y2="-6" width="0.4064" layer="51" curve="-341.075356"/>
<text x="0" y="10.4775" size="1.27" layer="27" font="vector" ratio="16" align="bottom-center">&gt;VALUE</text>
<text x="0" y="10.4775" size="1.27" layer="25" font="vector" ratio="16" align="bottom-center">&gt;NAME</text>
<text x="0" y="10.4775" size="1.27" layer="21" font="vector" ratio="16" align="bottom-center">&gt;NAME</text>
<text x="0" y="12.065" size="1.27" layer="21" font="vector" ratio="16" align="bottom-center">&gt;VALUE</text>
<circle x="0" y="0" radius="10" width="0.254" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="XA08">
<wire x1="-1.27" y1="8.89" x2="3.81" y2="8.89" width="0.4064" layer="94"/>
<wire x1="3.81" y1="8.89" x2="3.81" y2="-11.43" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-11.43" x2="-1.27" y2="-11.43" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="8.89" x2="-1.27" y2="-11.43" width="0.4064" layer="94"/>
<circle x="0" y="7.62" radius="0.635" width="0.1524" layer="94"/>
<circle x="2.54" y="5.08" radius="0.635" width="0.1524" layer="94"/>
<circle x="0" y="2.54" radius="0.635" width="0.1524" layer="94"/>
<circle x="2.54" y="0" radius="0.635" width="0.1524" layer="94"/>
<circle x="0" y="-2.54" radius="0.635" width="0.1524" layer="94"/>
<circle x="2.54" y="-5.08" radius="0.635" width="0.1524" layer="94"/>
<circle x="0" y="-7.62" radius="0.635" width="0.1524" layer="94"/>
<circle x="2.54" y="-10.16" radius="0.635" width="0.1524" layer="94"/>
<text x="-1.27" y="11.43" size="1.524" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="9.525" size="1.524" layer="96" font="vector">&gt;VALUE</text>
<text x="-1.5875" y="9.525" size="1.524" layer="95" font="vector" rot="R180">1</text>
<text x="4.445" y="-12.065" size="1.524" layer="95" font="vector">8</text>
<pin name="1" x="0" y="7.62" visible="off" length="point" swaplevel="1"/>
<pin name="2" x="2.54" y="5.08" visible="off" length="point" swaplevel="1"/>
<pin name="3" x="0" y="2.54" visible="off" length="point" swaplevel="1"/>
<pin name="4" x="2.54" y="0" visible="off" length="point" swaplevel="1"/>
<pin name="5" x="0" y="-2.54" visible="off" length="point" swaplevel="1"/>
<pin name="6" x="2.54" y="-5.08" visible="off" length="point" swaplevel="1"/>
<pin name="7" x="0" y="-7.62" visible="off" length="point" swaplevel="1"/>
<pin name="8" x="2.54" y="-10.16" visible="off" length="point" swaplevel="1"/>
</symbol>
<symbol name="CASE">
<wire x1="-4.445" y1="-2.54" x2="4.445" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="4.445" y1="-2.54" x2="4.445" y2="2.54" width="0.4064" layer="94"/>
<wire x1="4.445" y1="2.54" x2="-4.445" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-4.445" y2="-2.54" width="0.4064" layer="94"/>
<text x="0" y="0.9525" size="1.524" layer="95" font="vector" align="center">&gt;PART</text>
<text x="0" y="-0.9525" size="1.524" layer="96" font="vector" align="center">CASE</text>
<pin name="CASE" x="0" y="-5.08" visible="off" length="short" rot="R90"/>
</symbol>
<symbol name="X05">
<wire x1="0" y1="6.35" x2="1.27" y2="5.08" width="0.1524" layer="94"/>
<wire x1="1.27" y1="5.08" x2="1.27" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="0" y2="-6.35" width="0.1524" layer="94"/>
<text x="2.54" y="8.89" size="1.524" layer="95" font="vector" rot="R180">&gt;NAME</text>
<text x="2.54" y="10.795" size="1.524" layer="96" font="vector" rot="R180">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pin" length="short" swaplevel="1"/>
<pin name="2" x="-2.54" y="2.54" visible="pin" length="short" swaplevel="1"/>
<pin name="3" x="-2.54" y="0" visible="pin" length="short" swaplevel="1"/>
<pin name="4" x="-2.54" y="-2.54" visible="pin" length="short" swaplevel="1"/>
<pin name="5" x="-2.54" y="-5.08" visible="pin" length="short" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="XS08" prefix="X" uservalue="yes">
<description>&lt;div align=left&gt;&lt;b&gt;Shielded connector&lt;/b&gt;, 8 pins, 2 shield pins&lt;/div&gt;</description>
<gates>
<gate name="A" symbol="XA08" x="0" y="0"/>
<gate name="C" symbol="CASE" x="12.7" y="0" addlevel="request"/>
</gates>
<devices>
<device name="-RJ45" package="XS08-2S-RJ45">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="C" pin="CASE" pad="GND1 GND2" route="any"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-RJ45-WUERTH" package="XS08-RJ45">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="C" pin="CASE" pad="CASE1 CASE2" route="any"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="X05" prefix="X" uservalue="yes">
<description>&lt;div align=left&gt;&lt;b&gt;Connector&lt;/b&gt; 5 pins&lt;/div&gt;</description>
<gates>
<gate name="A" symbol="X05" x="0" y="0"/>
</gates>
<devices>
<device name="-SIL-MALE-VERT-L" package="X05-SIL-MALE-VERT-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-MALE-VERT-N" package="X05-SIL-MALE-VERT-N">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-MALE-VERT-R" package="X05-SIL-MALE-VERT-R">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-BROWN-VERT-L" package="X05-BROWN-VERT-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-BROWN-VERT-N" package="X05-BROWN-VERT-N">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="" package="X05-SIL-MALE-VERT-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="L" package="X05-SIL-MALE-VERT-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="N" package="X05-SIL-MALE-VERT-N">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="R" package="X05-SIL-MALE-VERT-R">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SCREW" package="X05-SCREW">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-FEMALE-HORZ-L" package="X05-SIL-FEMALE-HORZ-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-MALE-HORZ-L" package="X05-SIL-MALE-HORZ-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-FEMALE-VERT-N" package="X05-SIL-FEMALE-VERT-N">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-FEMALE-VERT-L" package="X05-SIL-FEMALE-VERT-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-FEMALE-VERT-R" package="X05-SIL-FEMALE-VERT-R">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-FEMALE-HORZ-N" package="X05-SIL-FEMALE-HORZ-N">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-FEMALE-HORZ-R" package="X05-SIL-FEMALE-HORZ-R">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-MALE-HORZ-N" package="X05-SIL-MALE-HORZ-N">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-MALE-HORZ-R" package="X05-SIL-MALE-HORZ-R">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-SIL-MALE-VERT-S" package="X05-SIL-MALE-VERT-S">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="S" package="X05-SIL-MALE-VERT-S">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-WHITE-VERT-L" package="X05-WHITE-VERT-L">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-WHITE-VERT-N" package="X05-WHITE-VERT-N">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
<device name="-KGR50/6" package="X05-KGR50/6">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="IGNOREVALUE" value="1"/>
<attribute name="SPICE" value="&lt;ignore&gt;"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
<attribute name="AUTHOR" value="lokies"/>
<attribute name="COMPANY" value="Max-Planck-Institut für Gravitationsphysik"/>
<attribute name="CREATIONAUTHOR" value="lokies"/>
<attribute name="CREATIONDATE" value="2024-06-26"/>
<attribute name="DESCRIPTION" value=""/>
<attribute name="DESCRIPTION2" value=""/>
<attribute name="INFOSETTINGS" value="Used by 'info.ulp' - do not edit manually! |FileTime=2026-02-24, 15:16:09|FileVersion=2||[FrontMatter]|DocTitle=|SubTitle=|Authors=|Keywords=|Abstract=|LaTeXSyntax=0||[Safety]|VoltageHazard=-1|HeatHazard=-1|Convection=0|ForcedAir=0|WaterCooling=0|LightHazard=-1|LaserPower=1000|LaserWavelength=1064|LaserClass=6|LightPower=1000|LightInvisible=0||[Notes]|Machinery=-1|IntendedUsers=-1|"/>
<attribute name="REVISION" value="2024-06-26"/>
<attribute name="REVISIONAUTHOR1" value=""/>
<attribute name="REVISIONAUTHOR2" value=""/>
<attribute name="REVISIONAUTHOR3" value=""/>
<attribute name="REVISIONAUTHOR4" value=""/>
<attribute name="REVISIONAUTHOR5" value=""/>
<attribute name="REVISIONAUTHOR6" value=""/>
<attribute name="REVISIONDATE1" value=""/>
<attribute name="REVISIONDATE2" value=""/>
<attribute name="REVISIONDATE3" value=""/>
<attribute name="REVISIONDATE4" value=""/>
<attribute name="REVISIONDATE5" value=""/>
<attribute name="REVISIONDATE6" value=""/>
<attribute name="TITLE" value="ADAPTER-BOARD-STEPPER"/>
<attribute name="TITLE1" value="ADAPTER-BOARD-"/>
<attribute name="TITLE2" value="STEPPER"/>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="$1" library="symbols" deviceset="FRAME-A4-LANDSCAPE" device=""/>
<part name="X1" library="connectors" deviceset="XS08" device="-RJ45"/>
<part name="X2" library="connectors" deviceset="X05" device="-SIL-MALE-VERT-L"/>
<part name="X3" library="connectors" deviceset="X05" device="-SIL-MALE-VERT-L"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="$1" gate="A" x="0" y="0"/>
<instance part="X1" gate="A" x="50.8" y="129.54" rot="R90"/>
<instance part="X2" gate="A" x="43.18" y="114.3" rot="R270"/>
<instance part="X3" gate="A" x="60.96" y="114.3" rot="R270"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="X2" gate="A" pin="1"/>
<pinref part="X1" gate="A" pin="4"/>
<wire x1="48.26" y1="116.84" x2="50.8" y2="116.84" width="0.1524" layer="91"/>
<wire x1="50.8" y1="116.84" x2="50.8" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="X2" gate="A" pin="2"/>
<wire x1="45.72" y1="116.84" x2="45.72" y2="119.38" width="0.1524" layer="91"/>
<pinref part="X1" gate="A" pin="3"/>
<wire x1="45.72" y1="119.38" x2="48.26" y2="119.38" width="0.1524" layer="91"/>
<wire x1="48.26" y1="119.38" x2="48.26" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="X2" gate="A" pin="3"/>
<wire x1="43.18" y1="116.84" x2="43.18" y2="121.92" width="0.1524" layer="91"/>
<pinref part="X1" gate="A" pin="2"/>
<wire x1="43.18" y1="121.92" x2="45.72" y2="121.92" width="0.1524" layer="91"/>
<wire x1="45.72" y1="121.92" x2="45.72" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="X2" gate="A" pin="4"/>
<wire x1="40.64" y1="116.84" x2="40.64" y2="124.46" width="0.1524" layer="91"/>
<pinref part="X1" gate="A" pin="1"/>
<wire x1="40.64" y1="124.46" x2="43.18" y2="124.46" width="0.1524" layer="91"/>
<wire x1="43.18" y1="124.46" x2="43.18" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="X3" gate="A" pin="4"/>
<wire x1="58.42" y1="116.84" x2="58.42" y2="119.38" width="0.1524" layer="91"/>
<pinref part="X1" gate="A" pin="5"/>
<wire x1="58.42" y1="119.38" x2="53.34" y2="119.38" width="0.1524" layer="91"/>
<wire x1="53.34" y1="119.38" x2="53.34" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="X3" gate="A" pin="3"/>
<wire x1="60.96" y1="116.84" x2="60.96" y2="121.92" width="0.1524" layer="91"/>
<pinref part="X1" gate="A" pin="6"/>
<wire x1="60.96" y1="121.92" x2="55.88" y2="121.92" width="0.1524" layer="91"/>
<wire x1="55.88" y1="121.92" x2="55.88" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="X3" gate="A" pin="2"/>
<wire x1="63.5" y1="116.84" x2="63.5" y2="124.46" width="0.1524" layer="91"/>
<pinref part="X1" gate="A" pin="7"/>
<wire x1="63.5" y1="124.46" x2="58.42" y2="124.46" width="0.1524" layer="91"/>
<wire x1="58.42" y1="124.46" x2="58.42" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="X3" gate="A" pin="1"/>
<wire x1="66.04" y1="116.84" x2="66.04" y2="127" width="0.1524" layer="91"/>
<pinref part="X1" gate="A" pin="8"/>
<wire x1="66.04" y1="127" x2="60.96" y2="127" width="0.1524" layer="91"/>
<wire x1="60.96" y1="127" x2="60.96" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
