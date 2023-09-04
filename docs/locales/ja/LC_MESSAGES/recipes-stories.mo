Þ    `                      
     '   (  ¾   P  ß     l   ï     \  z   ì  §   g	  /   
  ®   ?
  ^   î
  F   M       h   ±  	     H   $  .   m  "     $   ¿  #   ä  #     Q   ,  H   ~  3   Ç     û  -     1   E  [   w  X   Ó     ,  ì   >  \   +  v     6   ÿ  '   6  *   ^  8     Q   Â  6     /   K  f   {  i   â  '   L     t  ò   |  l   o  m   Ü  b   J  K   ­  ~   ù  -   x  H   ¦  »   ï    «  B   É  m     æ   z  Ù   a  -   ;  I   i    ³  #  7    [  -   g  Y        ï  /   |      ¬   ü   K!  q   H"  (   º"  '   ã"  m   #  V   y#     Ð#  h   k$     Ô$     T%  W   è%  Ñ   @&  [   '  \   n'  }   Ë'  z   I(  ß   Ä(  +   ¤)  6   Ð)  k   *  þ   s*  v   r+      é+  <   ,  p   Ç,  >   8-     w-    -     ,/  $   @/    e/  4  0     ¶1     C2  à   Í2     ®3  E   ¯4  ó   õ4     é5  `   k6  +   Ì6  ©   ø6     ¢7  f   ©7  ?   8  9   P8  1   8     ¼8  !   Ò8  x   ô8  o   m9  T   Ý9     2:  :   R:  I   :  n   ×:  c   F;     ª;  (  À;     é<  ½   r=  D   0>  '   u>  C   >  f   á>     H?  N   Ê?  L   @     f@     ñ@  (   A     ³A  U  ÆA  °   C  ª   ÍC  r   xD  e   ëD  à   QE  <   2F  O   oF  ò   ¿F  ~  ²G  Q   1I     I  0  J    JK  U   SL  W   ©L  T  M  æ  VO  T  =Q  E   R  i   ØR  °   BS  B   óS  À   6T  g  ÷T     _V  $   ëV  3   W  ´   DW  f   ùW  Æ   `X     'Y  ¡   ÂY  é   dZ     N[  þ   Û[     Ú\  ¢   j]  ¦   ^  ·   ´^    l_  C   r`  ,   ¶`     ã`  .  ra     ¡b  Ø   @c  i   d     d  _   e  #   ~e   **Files:** Alternating table row background colors As a general recommendation, HTML and CSS sources should be **read as binary files** and decoded before using them in a story. The Python `pathlib.Path` provides convenient ways to do this:: As mentioned in the :ref:`tutorial<WorkingWithStories>`, stories may be created using up to three input sources: HTML, CSS and Archives -- all of which are optional and which, respectively, can be provided programmatically. At the time of writing the HTML engine for Stories is fairly basic and supports a subset of CSS2 attributes. Automatic generation of a Table of Contents (TOC) on separately numbered pages at the start of the document - using a specialized :ref:`Story`. Based on a few global parameters, areas on each page are identified, that can be used to receive text layouted by a Story. Because a :ref:`DocumentWriter` can only write to a new file, stories cannot be placed on existing pages. This script demonstrates a circumvention of this restriction. Both variants will produce the same output PDF. By creating a sequence of :ref:`Story` objects within a grid created via the :ref:`make_table<Functions_make_table>` function a developer can create grid layouts as required. Column widths are computed automatically based on column content. They cannot be directly set. Create using existing HTML source [#f1]_, that may come from anywhere. Create using the Python API. Flat table layouts are supported ("rows x columns"), no support of the "colspan" / "rowspan" attributes. Footnotes Here is the inevitable "Hello World" example. We will show two variants: How to Add a Line of Text with Some Formatting How to Create a Simple Grid Layout How to Display a List from JSON Data How to Generate a Table of Contents How to Integrate with Existing PDFs How to Make Multi-Columned Layouts and Access Fonts from Package `pymupdf-fonts`_ How to Make a Layout which Wraps Around a Predefined "no go area" Layout How to Output Database Content with Story Templates How to Output an HTML Table How to Read External HTML and CSS for a Story How to do Basic Layout with :meth:`Story.write()` How to do Iterative Layout and Create PDF Links with :meth:`Story.write_stabilized_links()` How to do Iterative Layout for a Table of Contents with :meth:`Story.write_stabilized()` How to use Images Images can be referenced in the provided HTML source, or the reference to a desired image can also be stored via the Python API. In any case, this requires using an :ref:`Archive`, which refers to the place where the image can be found. Images with the binary content embedded in the HTML source are **not supported** by stories. In addition, two "Ubuntu" font families from package `pymupdf-fonts`_ are used instead of defaulting to Base-14 fonts. It does not take a :ref:`DocumentWriter` `writer` arg. It features the following capabilities: It returns a PDF :ref:`Document` instance. Layout text around images of an existing ("target") PDF. Many of these recipe's source code are included as examples in the `docs` folder. Multi-page output simulating **repeating header rows** Outputting HTML tables is supported as follows: Row heights are computed automatically based on row content - leading to multi-line rows where needed. So the script uses :meth:`Story.write_stabilized()` to repeatedly lay things out until things are stable. Some important CSS support to consider: Stories Styling for :htmlTag:`tr` elements is not supported and ignored. Therefore, a table-wide grid or alternating row background colors are not supported. One of the following example scripts however shows an easy way to deal with this limitation. Table "actors" contains one row per actor and film title (fields (actor) **"name"** and (film) **"title"**). Table "films" contains one row per film with the fields **"title"**, **"director"** and (release) **"year"**. Table **cells may contain images** which will be considered in the column width calculation magic. Table header rows are only **shown on the first page / "where" rectangle.** Table header tag :htmlTag:`th` supports attribute "scope" with values "row" or "col". Applicable text will be bold by default. Table rows and columns delimited by gridlines Table rows dynamically generated / filled with data from an SQL database The "style" attribute is ignored when given directly in HTML table elements. Styling for a table and its elements must happen separately, in CSS source or within the :htmlTag:`style` tag. The :meth:`Story.write*()` functions provide a different way to use the :ref:`Story` functionality, removing the need for calling code to implement a loop that calls :meth:`Story.place()` and :meth:`Story.draw()` etc, at the expense of having to provide at least a `rectfn()` callback. The Python API variant -- everything is created programmatically:: The above effect (sans-serif and blue text) could have been achieved by using a separate CSS source like so:: The basic idea is letting :ref:`DocumentWriter` output to a PDF in memory. Once the story has finished, we re-open this memory PDF and put its pages to desired locations on **existing** pages via method :meth:`Page.show_pdf_page`. The contents section is at the start of the document, so modifications to the contents can change page numbers in the rest of the document, which in turn can cause page numbers in the contents section to be incorrect. The example SQL database contains two tables: The following examples will showcase combinations for using these inputs. The fontsize to use for text. This value determines whether the provided text will fit in the empty spaces of the (fixed) pages of target PDF. It cannot be predicted in any way. The script ends with an exception if target PDF has not enough pages, and prints a warning message if not all pages receive at least some text. In both cases, the FONTSIZE value can be changed (a float value). The layout creates a temporary (memory) PDF. Its produced page content (the text) is used to overlay the corresponding target page. If text requires more pages than are available in target PDF, an exception is raised. If not all target pages receive at least some text, a warning is printed. The main PDF with the Python sources is being written to memory by its :ref:`DocumentWriter`. Another :ref:`Story` / :ref:`DocumentWriter` pair is then used to create a (memory) PDF for the TOC pages. Finally, both these PDFs are joined and the result stored to disk. The only available layout is relative layout. The page **footer is automatically changed** to show the name of the current Python file. The potentially multiple lines of a table row will always be kept together on one page (respectively "where" rectangle) and not be splitted. The script demonstrates the following features: The script produces "quickfox-image-no-go.pdf" which contains the original pages and image positions, but with the original article text laid out around them. The script reads "image-no-go.pdf" in its own folder. This is the "target" PDF. It contains 2 pages with each 2 images (from the original article), which are positioned at places that create a broad overall test coverage. Otherwise the pages are empty. The story DOM consists of a template for one film, which reports film data together with a list of casted actors. The width of the border(s) on each page. These cases are fairly straightforward. These global parameters are not stored anywhere in the target PDF and must therefore be provided in some way: This document showcases some typical use cases for :ref:`Stories<WorkingWithStories>`. This example takes some JSON data input which it uses to populate a :ref:`Story`. It also contains some visual text formatting and shows how to add links. This is a demo script using PyMuPDF's Story class to output text as a PDF with a two-column page layout. This is done by using :meth:`Story.write_stabilized_links()`; this is slightly different from :meth:`Story.write_stabilized()`: This script creates html content dynamically, adding a contents section based on :ref:`ElementPosition` items that have non-zero `.heading` values. This script demonstrates how to report SQL database content using an **HTML template**. This script is similar to the one described in "How to use :meth:`Story.write_stabilized()`" above, except that the generated PDF also contains links that correspond to the internal links in the original html. This script lays out multiple copies of its own source code, into four rectangles per page. This script lists the source code of all Python scripts that live in the script's directory. This script outputs an article (taken from Wikipedia) that contains text and multiple images and uses a 2-column page layout. Use of 3 separate :ref:`Story` objects per page: header story, footer story and the story for printing the Python sources. Use of :meth:`Story.element_positions` to collect the data for the TOC and for the dynamic adjustment of page footers. This is an example of a **bidirectional communication** between the story output process and the script. Use of a 2-column page layout for the text. Using the Alternative :meth:`Story.write*()` functions Variant using an existing HTML source [#f1]_ -- which in this case is defined as a constant in the script:: We extend our "Hello World" example from above and display an image of our planet right after the text. Assuming the image has the name "world.jpg" and is present in the script's folder, then this is the modified version of the above Python API variant:: Yet another feature used here is that all data -- the images and the article HTML -- are jointly stored in a ZIP file. [The reasons for this are a little involved; for example a :ref:`DocumentWriter` is not necessarily a PDF writer, so doesn't really work in a PDF-specific API.] `background` is unavailable, use `background-color` instead. `docs/samples/national-capitals.py` Advanced script extending table output options using simple additional code: `docs/samples/table01.py` This script reflects basic features. `float` is unavailable. Project-Id-Version: PyMuPDF 1.23.0rc1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-08-16 14:20+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Suzan Sanver <suzan.sanver@dijipiji.com>
Language: ja
Language-Team: ja <suzan.sanver@dijipiji.com>
Plural-Forms: nplurals=1; plural=0;
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.10.3
 **ãã¡ã¤ã«ï¼** äº¤äºã®ãã¼ãã«è¡ã®èæ¯è² ä¸è¬çãªæ¨å¥¨äºé ã¨ãã¦ãHTMLã¨CSSã®ã½ã¼ã¹ã¯ãã¤ããªãã¡ã¤ã«ã¨ãã¦èª­ã¿è¾¼ã¾ããã¹ãã¼ãªã¼ã§ä½¿ç¨ããåã«ãã³ã¼ããããã¹ãã§ããPythonã® `pathlib.Path` ã¯ããããä¾¿å©ã«è¡ãããã®æ¹æ³ãæä¾ãã¦ãã¾ãã:: â ï¸ãã¥ã¼ããªã¢ã«ã§èª¬æããã¦ããããã«ãã¹ãã¼ãªã¼ãºã¯æå¤§3ã¤ã®å¥åã½ã¼ã¹ï¼HTMLãCSSãã¢ã¼ã«ã¤ãï¼ãä½¿ç¨ãã¦ä½æã§ãã¾ãããããã®ã½ã¼ã¹ã¯ãã¹ã¦ãªãã·ã§ã³ã§ããããããããã­ã°ã©ã ã§æä¾ãããã¨ãã§ãã¾ãã å·ç­æç¹ã§ã¯ãã¹ãã¼ãªã¼ã®HTMLã¨ã³ã¸ã³ã¯ããªãåºæ¬çã§ãããä¸é¨ã®CSS2å±æ§ããµãã¼ããã¦ãã¾ãã å°ç¨ã® :ref:`Story` ãä½¿ç¨ãã¦ãææ¸ã®åé ­ã«ç¬ç«ãããã¼ã¸ãã¨ã«èªåçã«ç®æ¬¡ï¼TOCï¼ãçæãã¾ãã åãã¼ã¸ã®ç¹å®ã®é åããStoryã«ãã£ã¦ã¬ã¤ã¢ã¦ãããããã­ã¹ããåãå¥ããããã«ä½¿ç¨ã§ããããã«ãããã¤ãã®ã°ã­ã¼ãã«ãã©ã¡ã¼ã¿ã«åºã¥ãã¦è­å¥ããã¾ãã :ref:`DocumentWriter` ã¯æ°ãããã¡ã¤ã«ã«ã®ã¿æ¸ãè¾¼ããã¨ãã§ãããããã¹ãã¼ãªã¼ã¯æ¢å­ã®ãã¼ã¸ã«éç½®ãããã¨ã¯ã§ãã¾ããããã®ã¹ã¯ãªããã¯ããã®å¶éãåé¿ããæ¹æ³ãç¤ºãã¦ãã¾ãã ã©ã¡ãã®ããªã¢ã³ããåãåºåã®PDFãçæãã¾ãã :ref:`make_table<Functions_make_table>` é¢æ°ãä½¿ç¨ãã¦ä½æãããã°ãªããåã§ :ref:`Story` ãªãã¸ã§ã¯ãã®ã·ã¼ã±ã³ã¹ãä½æãããã¨ã§ãéçºèã¯å¿è¦ãªã°ãªããã¬ã¤ã¢ã¦ããä½æã§ãã¾ãã åã®å¹ã¯ãåã®ã³ã³ãã³ãã«åºã¥ãã¦èªåçã«è¨ç®ããã¾ããç´æ¥è¨­å®ãããã¨ã¯ã§ãã¾ããã ã©ãããã§ãåå¾ã§ããæ¢å­ã®HTMLã½ã¼ã¹ [#f1]_ ãä½¿ç¨ãã¦ä½æãã¾ãã Python APIãä½¿ç¨ãã¦ä½æãã¾ãã ãã©ãããªãã¼ãã«ã¬ã¤ã¢ã¦ãï¼ãè¡ Ã åãï¼ããµãã¼ãããã¦ããããcolspanã/ãrowspanãå±æ§ã¯ãµãã¼ãããã¦ãã¾ããã èæ³¨ ä»¥ä¸ã¯ãé¿ããããªããHello Worldãã®ä¾ã§ãã2ã¤ã®ããªã¢ã³ããç¤ºãã¾ãï¼ ãã­ã¹ãã®è¡ãããã¤ãã®æ¸å¼ã§è¿½å ããæ¹æ³ ã·ã³ãã«ãªã°ãªããã¬ã¤ã¢ã¦ãã®ä½ææ¹æ³ JSONãã¼ã¿ãããªã¹ããè¡¨ç¤ºããæ¹æ³ ç®æ¬¡ã®çææ¹æ³ æ¢å­ã®PDFã¨çµ±åããæ¹æ³ å¤æ®µçµã®ã¬ã¤ã¢ã¦ããä½æããããã±ã¼ã¸ `pymupdf-fonts`_ ãããã©ã³ãã«ã¢ã¯ã»ã¹ããæ¹æ³ ãããããå®ç¾©ããããç¦æ­¢ã¨ãªã¢ãã¬ã¤ã¢ã¦ãã«å²ã¾ããã¬ã¤ã¢ã¦ãã®ä½ææ¹æ³ ãã¼ã¿ãã¼ã¹ã®åå®¹ãã¹ãã¼ãªã¼ãã³ãã¬ã¼ãã§åºåããæ¹æ³ HTMLãã¼ãã«ã®åºåæ¹æ³ å¤é¨ã®HTMLã¨CSSãã¹ãã¼ãªã¼ã«èª­ã¿è¾¼ãæ¹æ³ :meth:`Story.write()` ãä½¿ç¨ããåºæ¬çãªã¬ã¤ã¢ã¦ãã®æ¹æ³ ç¹°ãè¿ãã¬ã¤ã¢ã¦ãã¨ PDF ãªã³ã¯ã®ä½ææ¹æ³ï¼:meth:`Story.write_stabilized_links()` ã®ä½¿ç¨ :meth:`Story.write_stabilized()` ãä½¿ç¨ããç®æ¬¡ä»ãã®ç¹°ãè¿ãã¬ã¤ã¢ã¦ãã®æ¹æ³ ç»åã®ä½¿ç¨æ¹æ³ â ï¸ç»åã¯æä¾ãããHTMLã½ã¼ã¹åã§åç§ãããã¨ãã§ãã¾ããã¾ããPython APIãä»ãã¦å¿è¦ãªç»åã¸ã®åç§ãä¿å­ãããã¨ãã§ãã¾ããã©ã¡ãã®å ´åããç»åãè¦ã¤ããå ´æãæãã¢ã¼ã«ã¤ããä½¿ç¨ããå¿è¦ãããã¾ãã HTMLã½ã¼ã¹ã«ãã¤ããªã³ã³ãã³ããåãè¾¼ã¾ããç»åã¯ãã¹ãã¼ãªã¼ãºã§ã¯ãµãã¼ãããã¦ãã¾ããã ããã«ãããã©ã«ãã§ã¯Base-14ãã©ã³ãã«ããã©ã«ãã§ãªããããã±ã¼ã¸pymupdf-fontsãã2ã¤ã®ãUbuntuããã©ã³ããã¡ããªãä½¿ç¨ããã¦ãã¾ãã :ref:`DocumentWriter` ã® `writer` å¼æ°ã¯å¿è¦ããã¾ããã æ¬¡ã®æ©è½ãåãã£ã¦ãã¾ãï¼ â ï¸PDF ãã­ã¥ã¡ã³ãã®ã¤ã³ã¹ã¿ã³ã¹ãè¿ãã¾ãã æ¢å­ã®ï¼ãã¿ã¼ã²ãããï¼PDFã®ç»åã®å¨ãã«ãã­ã¹ããã¬ã¤ã¢ã¦ããã¾ãã ãããã®ã¬ã·ãã®ã½ã¼ã¹ã³ã¼ãã®å¤ãã¯ããã­ã¥ã¡ã³ããã©ã«ãåã®ä¾ã¨ãã¦å«ã¾ãã¦ãã¾ãã ç¹°ãè¿ããããã¼è¡ãã·ãã¥ã¬ã¼ããããã«ããã¼ã¸åºå HTMLãã¼ãã«ã®åºåã¯æ¬¡ã®ããã«ãµãã¼ãããã¦ãã¾ãï¼ è¡ã®é«ãã¯ãè¡ã®ã³ã³ãã³ãã«åºã¥ãã¦èªåçã«è¨ç®ãããå¿è¦ã«å¿ãã¦è¤æ°è¡ã®è¡ãçæããã¾ãã ãããã£ã¦ãã¹ã¯ãªããã¯  :meth:`Story.write_stabilized()` ãä½¿ç¨ãã¦ãå®å®ããã¾ã§ç¹°ãè¿ãã¬ã¤ã¢ã¦ããè¡ãã¾ãã èæ®ãã¹ãéè¦ãªCSSãµãã¼ã: ã¹ãã¼ãªã¼ãº :htmlTag:`tr` è¦ç´ ã®ã¹ã¿ã¤ãªã³ã°ã¯ãµãã¼ãããã¦ããããç¡è¦ããã¾ãããããã£ã¦ããã¼ãã«å¨ä½ã®ã°ãªãããäº¤äºã®è¡ã®èæ¯è²ã¯ãµãã¼ãããã¦ãã¾ããããã ããä»¥ä¸ã®ä¾ã¹ã¯ãªããã®ããããã¯ããã®å¶éã«å¯¾å¦ããç°¡åãªæ¹æ³ãç¤ºãã¦ãã¾ãã ãã¼ãã«ãactorsãã«ã¯ã1ã¤ã®è¡ã«1äººã®ä¿³åªã¨æ ç»ã®ã¿ã¤ãã«ãå«ã¾ãã¦ãã¾ãï¼ãã£ã¼ã«ãï¼actorï¼ãnameãã¨ï¼filmï¼ãtitleãï¼ã ãã¼ãã«ãfilmsãã«ã¯ããã£ã¼ã«ããtitleãããdirectorããããã³ï¼å¬éï¼ãyearããæã¤1ã¤ã®æ ç»ãã¨ã®è¡ãå«ã¾ãã¦ãã¾ãã ãã¼ãã«ã®ã»ã«ã«ã¯ç»åãå«ãããã¨ãã§ããããã¯åå¹è¨ç®ã®éã«èæ®ããã¾ãã ãã¼ãã«ã®ãããã¼è¡ã¯ãæåã®ãã¼ã¸ / "where" ç©å½¢ã®ã¿ã«è¡¨ç¤ºããã¾ãã ãã¼ãã«ãããã¼ã¿ã° :htmlTag:`th` ã¯ãå±æ§ âscopeâ ããµãã¼ãããå¤ã¨ãã¦ ârowâ ã¾ãã¯ âcolâ ãæã¡ã¾ããé©ç¨ããããã­ã¹ãã¯ããã©ã«ãã§å¤ªå­ã«ãªãã¾ãã ã°ãªããã©ã¤ã³ã§åºåããããã¼ãã«è¡ã¨å SQLãã¼ã¿ãã¼ã¹ãããã¼ã¿ãåçã«çæ/åãããã¼ãã«è¡ ç´æ¥HTMLãã¼ãã«è¦ç´ ã«  "style"   å±æ§ãä¸ããããå ´åãç¡è¦ããã¾ãããã¼ãã«ã¨ãã®è¦ç´ ã®ã¹ã¿ã¤ãªã³ã°ã¯ãCSSã½ã¼ã¹åã¾ãã¯ :htmlTag:`style`  ã¿ã°åã§å¥éè¡ãå¿è¦ãããã¾ãã :meth:`Story.write*()` é¢æ°ã¯ã :ref:`Story`  æ©è½ãç°ãªãæ¹æ³ã§ä½¿ç¨ããããã®æ¹æ³ãæä¾ãã¾ããããã«ãããå¼ã³åºãã³ã¼ãã  :meth:`Story.place()`  ã :meth:`Story.draw()`  ãªã©ãå¼ã³åºãã«ã¼ããå®è£ããå¿è¦ããªããªãã¾ãããå°ãªãã¨ã  `rectfn()`  ã³ã¼ã«ããã¯ãæä¾ããå¿è¦ãããã¾ãã Python APIã®ããªã¢ã³ã - ãã¹ã¦ããã­ã°ã©ã ã§ä½æããã¾ã:: ä¸è¨ã®å¹æï¼ãµã³ã»ãªãä½ããã³éããã­ã¹ãï¼ã¯ãæ¬¡ã®ããã«å¥ã®CSSã½ã¼ã¹ãä½¿ç¨ãããã¨ã§éæã§ãã¾ã:: åºæ¬çãªèãæ¹ã¯ã :ref:`DocumentWriter`  ãã¡ã¢ãªåã®PDFã«åºåãããã¨ã§ããã¹ãã¼ãªã¼ãå®äºãããããã®ã¡ã¢ãªPDFãååº¦éããã¡ã½ãã :meth:`Page.show_pdf_page` ãä½¿ç¨ãã¦ãã®ãã¼ã¸ãæ¢å­ã®ãã¼ã¸ã«å¿è¦ãªä½ç½®ã«éç½®ãã¾ãã ç®æ¬¡ã»ã¯ã·ã§ã³ã¯ææ¸ã®åé ­ã«éç½®ããã¦ãããããç®æ¬¡ã¸ã®å¤æ´ã«ãã£ã¦ææ¸ã®ä»ã®é¨åã®ãã¼ã¸çªå·ãå¤æ´ãããããã«ä¼´ãç®æ¬¡ã»ã¯ã·ã§ã³ã®ãã¼ã¸çªå·ãæ­£ãããªããªãå¯è½æ§ãããã¾ãã ãã®ä¾ã®SQLãã¼ã¿ãã¼ã¹ã«ã¯2ã¤ã®ãã¼ãã«ãå«ã¾ãã¦ãã¾ãï¼ ä»¥ä¸ã®ä¾ã§ã¯ããããã®å¥åãä½¿ç¨ããçµã¿åãããç¤ºãã¾ãã ãã­ã¹ãã«ä½¿ç¨ãããã©ã³ããµã¤ãºããã®å¤ã¯ãæä¾ããããã­ã¹ããã¿ã¼ã²ããPDFã®ï¼åºå®ãããï¼ãã¼ã¸ã®ç©ºç½ã¹ãã¼ã¹ã«åã¾ããã©ãããæ±ºå®ãã¾ããããã¯ã©ã®ããã«äºæ¸¬ãããã¨ãã§ãã¾ãããã¿ã¼ã²ããPDFã«ååãªãã¼ã¸ããªãå ´åãã¹ã¯ãªããã¯ä¾å¤ãã¹ã­ã¼ãããã¹ã¦ã®ãã¼ã¸ãå°ãªãã¨ãä¸é¨ã®ãã­ã¹ããåãåããªãå ´åã¯è­¦åã¡ãã»ã¼ã¸ãè¡¨ç¤ºããã¾ããã©ã¡ãã®å ´åããFONTSIZEã®å¤ãå¤æ´ã§ãã¾ãï¼æµ®åå°æ°ç¹æ°ï¼ã ã¬ã¤ã¢ã¦ãã¯ä¸æçãªï¼ã¡ã¢ãªï¼PDFãä½æãã¾ãããã®çæããããã¼ã¸ã®ã³ã³ãã³ãï¼ãã­ã¹ãï¼ã¯ãå¯¾å¿ããã¿ã¼ã²ãããã¼ã¸ã«éã­ã¦éç½®ããã¾ãããã­ã¹ããã¿ã¼ã²ããPDFã®å©ç¨å¯è½ãªãã¼ã¸ãããå¤ãã®ãã¼ã¸ãå¿è¦ã¨ããå ´åãä¾å¤ãçºçãã¾ãããã¹ã¦ã®ã¿ã¼ã²ãããã¼ã¸ãå°ãªãã¨ãä¸é¨ã®ãã­ã¹ããåãåããªãå ´åãè­¦åãè¡¨ç¤ºããã¾ãã ä¸»ãªPythonã½ã¼ã¹ããã® :ref:`DocumentWriter` ã«ãã£ã¦ã¡ã¢ãªã«æ¸ãè¾¼ã¿ã¾ãããã®å¾ãããä¸ã¤ã® :ref:`Story` / :ref:`DocumentWriter` ã®ãã¢ãä½¿ç¨ãã¦ï¼ã¡ã¢ãªï¼PDFãTOCãã¼ã¸ã®ããã«ä½æãã¾ããæå¾ã«ããããã®PDFã¯çµåããã¦çµæããã£ã¹ã¯ã«ä¿å­ããã¾ãã å¯ä¸å©ç¨å¯è½ãªã¬ã¤ã¢ã¦ãã¯ç¸å¯¾ã¬ã¤ã¢ã¦ãã§ãã ãã¼ã¸ããã¿ã¼ã¯èªåçã«å¤æ´ãããç¾å¨ã®Pythonãã¡ã¤ã«åãè¡¨ç¤ºããã¾ãã ãã¼ãã«ã®è¡ã®æ½å¨çã«è¤æ°è¡ã¯ãå¸¸ã«1ã¤ã®ãã¼ã¸ï¼ã¾ãã¯ âwhereâ ç©å½¢ï¼ã«ã¾ã¨ãã¦è¡¨ç¤ºãããåå²ããããã¨ã¯ããã¾ããã ãã®ã¹ã¯ãªããã¯ãä»¥ä¸ã®æ©è½ãç¤ºãã¦ãã¾ãï¼ ã¹ã¯ãªããã¯ãquickfox-image-no-go.pdfããçæããåã®ãã¼ã¸ã¨ç»åã®ä½ç½®ãå«ã¿ã¾ãããåã®è¨äºã®ãã­ã¹ãããã®å¨ãã«ã¬ã¤ã¢ã¦ãããã¾ãã ã¹ã¯ãªããã¯ãèªåèªèº«ã®ãã©ã«ãåã®ãimage-no-go.pdfããèª­ã¿è¾¼ã¿ã¾ããããããã¿ã¼ã²ãããPDFã§ãããªãªã¸ãã«ã®è¨äºãã2ã¤ã®ç»åï¼å2ãã¼ã¸ï¼ãå«ã¿ããããã¯åºç¯ãªãã¹ãã«ãã¬ãã¸ãä½æããå ´æã«éç½®ããã¦ãã¾ããããä»¥å¤ã®å ´åããã¼ã¸ã¯ç©ºã§ãã ã¹ãã¼ãªã¼DOMã¯ãæ ç»ã®1ã¤ã®ãã³ãã¬ã¼ãããæããæ ç»ã®ãã¼ã¿ã¨åºæ¼ä¿³åªã®ãªã¹ããå ±åãã¾ãã åãã¼ã¸ã®ãã¼ãã¼ã®å¹ã ãããã®ã±ã¼ã¹ã¯ããªãç´æ¥çã§ãã ãããã®ã°ã­ã¼ãã«ãã©ã¡ã¼ã¿ã¯ãã¿ã¼ã²ããPDFåã®ã©ãã«ãä¿å­ãããããããã£ã¦ã©ã®ãããªæ¹æ³ã§æä¾ãããå¿è¦ãããã¾ãï¼ â ï¸ãã®ãã­ã¥ã¡ã³ãã¯ãã¹ãã¼ãªã¼ãºã®å¸åçãªä½¿ç¨ä¾ãç¤ºãã¦ãã¾ãã ãã®ä¾ã§ã¯ãJSONãã¼ã¿å¥åãä½¿ç¨ãã¦ :ref:`Story` ãçæããããã¤ãã®è¦è¦çãªãã­ã¹ãæ¸å¼è¨­å®ãè¡ãããªã³ã¯ãè¿½å ããæ¹æ³ãç¤ºãã¦ãã¾ãã ããã¯ãPyMuPDFã®Storyã¯ã©ã¹ãä½¿ç¨ãã¦ãã­ã¹ãã2åã®ãã¼ã¸ã¬ã¤ã¢ã¦ãã§PDFã¨ãã¦åºåãããã¢ã¹ã¯ãªããã§ãã ããã¯ã:meth:`Story.write_stabilized_links()` ãä½¿ç¨ãã¦è¡ããã¾ããããã¯  :meth:`Story.write_stabilized()` ã¨ãããã«ç°ãªãã¾ãï¼ ãã®ã¹ã¯ãªããã¯ãè¦ç´ ã®ä½ç½®æå ±ï¼:ref:`ElementPosition` ã¢ã¤ãã ï¼ãåºã«ã³ã³ãã³ããåçã«ä½æãã`.heading`  å¤ãã¼ã­ã§ãªãè¦ç´ ã«åºã¥ãã¦ç®æ¬¡ã»ã¯ã·ã§ã³ãè¿½å ãã¾ãã ãã®ã¹ã¯ãªããã¯**HTMLãã³ãã¬ã¼ã**ãä½¿ç¨ãã¦SQLãã¼ã¿ãã¼ã¹ã®åå®¹ãå ±åããæ¹æ³ãç¤ºãã¦ãã¾ãã ãã®ã¹ã¯ãªããã¯ãã:meth:`Story.write_stabilized()` ã®ä½¿ç¨æ¹æ³ãã§èª¬æããã¦ãããã®ã¨é¡ä¼¼ãã¦ãã¾ãããçæããã PDF ã«ã¯ãåã® HTML åã®åé¨ãªã³ã¯ã«å¯¾å¿ãããªã³ã¯ãå«ã¾ãã¦ãã¾ãã ãã®ã¹ã¯ãªããã¯ãèªèº«ã®ã½ã¼ã¹ã³ã¼ãã®è¤æ°ã®ã³ãã¼ã1ãã¼ã¸ããã4ã¤ã®åè§å½¢ã«ã¬ã¤ã¢ã¦ããã¾ãã ãã®ã¹ã¯ãªããã¯ãã¹ã¯ãªããã®ãã£ã¬ã¯ããªã«å­å¨ãããã¹ã¦ã®Pythonã¹ã¯ãªããã®ã½ã¼ã¹ã³ã¼ãããªã¹ãè¡¨ç¤ºãã¾ãã ãã®ã¹ã¯ãªããã¯ããã­ã¹ãã¨è¤æ°ã®ç»åãå«ãè¨äºï¼Wikipediaããåå¾ï¼ãåºåãã2åã®ãã¼ã¸ã¬ã¤ã¢ã¦ããä½¿ç¨ãã¾ãã ãã¼ã¸ãã¨ã«3ã¤ã®å¥åã® :ref:`Story` ãªãã¸ã§ã¯ããä½¿ç¨ï¼ãããã¼ã¹ãã¼ãªã¼ãããã¿ã¼ã¹ãã¼ãªã¼ãPythonã½ã¼ã¹ã®å°å·ç¨ã¹ãã¼ãªã¼ã :meth:`Story.element_positions`  ã®ä½¿ç¨ã«ãããTOCã®ãã¼ã¿ã®åéã¨ãã¼ã¸ããã¿ã¼ã®åçèª¿æ´ã«ä½¿ç¨ããã¾ããããã¯ãã¹ãã¼ãªã¼åºåãã­ã»ã¹ã¨ã¹ã¯ãªããéã®åæ¹åã³ãã¥ãã±ã¼ã·ã§ã³ã®ä¾ã§ãã ãã­ã¹ãã®ããã®2åã®ãã¼ã¸ã¬ã¤ã¢ã¦ãã®ä½¿ç¨ã :meth:`Story.write*()` é¢æ°ã®ä½¿ç¨æ¹æ³ æ¢å­ã®HTMLã½ã¼ã¹ [#f1]_ ãä½¿ç¨ããããªã¢ã³ã â ãã®å ´åãã¹ã¯ãªããåã§å®æ°ã¨ãã¦å®ç¾©ããã¦ãã¾ã:: åè¿°ã®ãHello Worldãã®ä¾ãæ¡å¼µãããã­ã¹ãã®ç´å¾ã«å°çã®ç»åãè¡¨ç¤ºãã¾ããç»åã®ååããworld.jpgãã§ãããã¹ã¯ãªããã®ãã©ã«ãã«å­å¨ããã¨ä»®å®ããã¨ãæ¬¡ã«ç¤ºãããã«Python APIããªã¢ã³ããä¿®æ­£ãããã®ã¨ãªãã¾ã:: ããã§ä½¿ç¨ãããå¥ã®æ©è½ã¯ããã¹ã¦ã®ãã¼ã¿ â ç»åã¨è¨äºã®HTML â ãå±ã«ZIPãã¡ã¤ã«ã«æ ¼ç´ããã¦ãããã¨ã§ãã [ããã«é¢ããçç±ã¯å°ãè¤éã§ããä¾ãã°ã :ref:`DocumentWriter` ãå¿ããã PDF ã©ã¤ã¿ã¼ã§ããã¨ã¯éãããPDF ç¹æã® API ã§ã¯ãã¾ããã¾ãåä½ããªãããã§ãã] `background` ã¯å©ç¨ã§ãã¾ããããä»£ããã« `background-color` ãä½¿ç¨ãã¦ãã ããã `docs/samples/national-capitals.py` ã·ã³ãã«ãªè¿½å ã³ã¼ããä½¿ç¨ãã¦ãã¼ãã«åºåãªãã·ã§ã³ãæ¡å¼µããé«åº¦ãªã¹ã¯ãªãã: `docs/samples/table01.py` ãã®ã¹ã¯ãªããã¯åºæ¬çãªæ©è½ãåæ ãã¦ãã¾ãã `float` ã¯å©ç¨ã§ãã¾ããã 