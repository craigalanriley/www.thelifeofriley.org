Note Board sample application readme
====================================

This document contains instructions to setup the Note Board sample application to run locally on your system. 

Prerequisites
-------------
To complete the tutorials for this sample application you will need the following software:

* ColdFusion MX [http://www.macromedia.com/go/mxstudio_trial]

* Macromedia Flash MX authoring tool [http://www.macromedia.com/go/mxstudio_trial]

* Macromedia Flash Remoting Components [http://www.macromedia.com/software/flashremoting/downloads/components/]

* Macromedia Flash UI Components Set 2 [http://dynamic.macromedia.com/bin/MM/exchange/extension_detail.jsp?product=flash&extOid=365880]

* Macromedia Flash Player 6 [http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash]

* Dreamweaver MX [http://www.macromedia.com/go/mxstudio_trial]

* The Note Board sample application files included in this download


Installing the sample files
---------------------------
1. Create a folder called Notes in the web root folder of your ColdFusion MX installation. The web root folder is typically located at C:\CfusionMX\wwwroot.

2. Locate the sample application ZIP file that you downloaded and unzip it to the folder you just created in the ColdFusion web root directory.

3. Next, launch the ColdFusion administrator (Start > Programs > Macromedia ColdFusion MX > Adminitrator).

4. From the Data & Services section of the menu on the left, select Data Sources.

5. In the Add New Data Source box, type the name Notes, select Microsoft Access for the driver, then click Add.
 

6. In the resulting screen, click the Browse Server button next to the Database File text box.

7. Browse to the Notes.mdb file that should be located at C:\CFusionMX\wwwroot\Notes\Notes.mdb and click Apply.
 

8. You'll be returned to the Microsoft Access data source screen. Click Submit.
 
9. Make sure that the Status for the new Notes data source name says "ok", then log out of the ColdFusion administrator.

The sample files are now installed and ColdFusion is configured to run the application. You can preview the application in Internet Explorer by browsing to the http://localhost:8500/Notes/noteboard_completed.html URL on your ColdFusion MX standalone server.

The tutorials for building the Note Board sample application can be found at the Macromedia Designer and Developer Center - http://www.macromedia.com/desdev/ria/note_board/

 
