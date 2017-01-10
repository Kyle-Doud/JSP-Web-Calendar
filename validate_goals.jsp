<html>
    <head>
        <script type="text/javascript">
         if(go){
            if(timeLimiT==0)
            {
              console.log("The time limit has been exceeded and hence the goals aren't met",OpenOutlookDoc());
        }

            function OpenOutlookDoc(){
                try {

                    var outlookApp = new ActiveXObject("Outlook.Application");
                    var nameSpace = outlookApp.getNameSpace("MAPI");
                    mailFolder = nameSpace.getDefaultFolder(6);
                    mailItem = mailFolder.Items.add('IPM.Note.FormA');
                    mailItem.Subject="a subject test";
                    mailItem.To = "an@email.here";
                    mailItem.HTMLBody = "<b>bold</b>";
                    mailItem.display (0); 
                }
                catch(e){
                    alert(e);
                    // act on any error that you get
                }
            }
        }
        </script>
    </head>
    <body>
        <a href="javascript:OpenOutlookDoc()">Click</a>
    </body>
</html>