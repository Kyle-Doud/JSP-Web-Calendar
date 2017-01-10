<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <head>
    <script>
function validateForm()
{
    var  fn = document.forms["myform"]["fname"].value;
    var  ln = document.forms["myform"]["lname"].value;
    var  e = document.forms["myform"]["email"].value;
    var pwd = document.forms["myform"]["pass"].value;
    var un = document.forms["myform"]["uname"].value;


    if(fn == null ||  fn == "" || fn.indexOf(',') > -1)
    {
        alert("First name must be nonempty without commas or spaces");
        return false;
    }

    else if(ln == null ||  ln == "" || ln.indexOf(',') > -1)
    {
        alert("Last name must be nonempty without commas or spaces");
        return false;
    }

    else if(e == null ||  e == "" || e.indexOf(',') > -1)
    {
        alert("Email must be nonempty without commas or spaces");
        return false;
    }

    else if(pwd == null ||  pwd == "" || pwd.indexOf(',') > -1)
    {
        alert("Password must be nonempty without commas or spaces");
        return false;
    }

    else if(un == null ||  un == "" || un.indexOf(',') > -1)
    {
        alert("User Name must be nonempty without commas or spaces");
        return false;
    }
    
}
</script>     
    </head>
    <body background="au.jpg"><br/><br/><br/>
        <form method="post" name="myform" id="data" action="registration.jsp" onsubmit="return validateForm()" >
            <center>
            <table style="border:10px outset silver;" border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already have an account? <a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>