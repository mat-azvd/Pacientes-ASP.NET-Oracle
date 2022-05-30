<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pacientes.Paginas.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
     <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>    
    <link href="../CSS/Styles.css" rel="stylesheet" />
    <script type="text/javascript">
         jQuery(function ($) {
             $("#TextCpf").mask("999.999.999-99");
             $('.data').mask('99/99/9999');
         });
    </script>
    
    <title></title>
</head>
<body>
     
    <form id="form1" runat="server">         
        <div id="formLogin">
        <asp:Panel runat="server" ID="Panel_Principal" HorizontalAlign="Center"> 
            <table class="table">
                <tr><td>
                    <asp:label runat="server" CssClass="LabelTitulo">Faça seu Login </asp:label>
                    </td>
                </tr>           
                <tr>
               <td>                
                <asp:TextBox runat="server" ID="TextCpf" CssClass="TextBoxLogin" placeholder="CPF" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldLoginValidator" runat="server" ErrorMessage="*" ControlToValidate="TextCpf" ForeColor="Red" ValidationGroup="validacao6"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                 <td> 
                <asp:TextBox runat="server" ID="TextSenha" CssClass="TextBoxLogin"  placeholder="Senha" TextMode="Password" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextSenha" ForeColor="Red" ValidationGroup="validacao6"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td>
                <asp:Button runat="server" ID="btEntrar" Class="btn" Text="Continuar" OnClick="btEntrar_Click" ValidationGroup="validacao6" />                            
                </td>
                </tr>
           
                </table>
          </asp:Panel>
            </div>        
             
    </form>
</body>
</html>
