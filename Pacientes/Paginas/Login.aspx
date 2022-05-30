<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pacientes.Paginas.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../CSS/Styles.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
     <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>    
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
        <div id="formLogin" >
        <asp:Panel runat="server" ID="Panel_Principal" HorizontalAlign="Center" > 
            <div id="divLogin" style="display:flex; ">
            <table class="table" style="margin-top:100px ; border:solid; max-width:50%; margin-left:auto; margin-right:auto">
                <tr ><td style="border:none">
                    <asp:label runat="server" CssClass="LabelTitulo">Faça seu Login </asp:label>
                    </td>
                </tr>           
                <tr>
               <td style="border:none">                
                <asp:TextBox runat="server" ID="TextCpf" CssClass="TextBoxLogin" placeholder="CPF" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldLoginValidator" runat="server" ErrorMessage="Digite CPF" ControlToValidate="TextCpf" ForeColor="Red" ValidationGroup="validacao6" Text="*"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                 <td style="border:none"> 
                <asp:TextBox runat="server" ID="TextSenha" CssClass="TextBoxLogin"  placeholder="Senha" TextMode="Password" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Digite Senha" ControlToValidate="TextSenha" ForeColor="Red" ValidationGroup="validacao6">*</asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td style="border:none">
                <asp:Button runat="server" ID="btEntrar" Class="btn" Text="Continuar"
                    style="border: solid;
                    border-width: 2px;
                    border-color: gray;
                    " CssClass="btnEntar"
                    OnClick="btEntrar_Click" ValidationGroup="validacao6" />                            
                </td>
                </tr>               
                </table>
              
            
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="validacao6" DisplayMode="List"/>
          </asp:Panel>
            </div>        
             
    </form>
</body>
</html>
